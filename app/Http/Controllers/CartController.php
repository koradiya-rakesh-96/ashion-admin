<?php

namespace App\Http\Controllers;
use App\Models\Country;
use App\Models\CustomerAddress;
use App\Models\DiscountCoupon;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\Product;
use App\Models\ShippingCharge;
use Gloudemans\Shoppingcart\Facades\Cart;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Stripe\Charge;
use Stripe\Stripe;

class CartController extends Controller
{
    public function addToCart(Request $request){
        $product = Product::with('product_images')->find($request->id);
        if($product == null){
            return response()->json([
                'status' => false,
                'message' => 'Record not found'
            ]);
        }

        if(Cart::count() > 0){
            $cartContent = Cart::content();
            $productAlreadyExist = false;
            foreach ($cartContent as $item) {
                if($item->id == $product->id){
                    $productAlreadyExist = true;
                }
            }
            if($productAlreadyExist == false){
                
                Cart::add($product->id, $product->title, 1, $product->price,['productImage' => (!empty($product->product_images)) ? $product->product_images->first() : '' ]);    
                
                $status = true;
                $message = '<strong>'.$product->title.'</strong> added in your cart successfully';
                session()->flash('success',$message);
            }else{
                $status = false;
                $message = $product->title.' already added in cart';    
            }
        }else{
            Cart::add($product->id, $product->title, 1, $product->price,['productImage' => (!empty($product->product_images)) ? $product->product_images->first() : '' ]);
            $status = true;
            $message = '<strong>'.$product->title.'</strong> added in cart';
            session()->flash('success',$message);
        }
        return response()->json([
            'status' => $status,
            'message' => $message
        ]);
    }
    
    public function cart(){
        $cartContent = Cart::content();
        $data['cartContent'] = $cartContent;
        return view('front.cart',$data);
    }

    public function updateCart(Request $request){
        
        $rowId = $request->rowId;
        $qty = $request->qty;

        $itemInfo = Cart::get($rowId);
        $product = Product::find($itemInfo->id);

        //Check qty availabel in stock
        if($product->track_qty == 'Yes'){
            if($qty <= $product->qty){
                Cart::update($rowId, $qty);
                $message = 'Cart updated successfully';
                $status = true;
                session()->flash('success',$message);
            }else{
                $message = 'Requested qty('.$qty.') not available in stock';
                $status = false;
                session()->flash('error',$message);
            }
        }else{
            Cart::update($rowId, $qty);
            $message = 'Cart updated successfully';
            $status = true;
            session()->flash('success',$message);
        }        
        // when user update cart the coupon code is removed
        session()->forget('code');
        return response()->json([
            'status' => $status,
            'message' => $message
        ]);
    }

    public function deleteItem(Request $request){
        
        $itemInfo = Cart::get($request->rowId);

        if($itemInfo == null){
            $eroorMessage = 'Item not found in cart';
            session()->flash('error',$eroorMessage);
            return response()->json([
                'status' => false,
                'message' => $eroorMessage
            ]);
        }

        Cart::remove($request->rowId);

        $successMessage = 'Item removed from cart successfully';
        session()->flash('success',$successMessage);
        return response()->json([
            'status' => true,
            'message' => $successMessage
        ]);
    }

    public function checkout(){

        $discount = 0;

        //if cart is empty then it will redirect to cart page
        if(Cart::count() == 0){
            return redirect()->route('front.cart');
        }
        //if user is not log-in then it will redirect to login page
        if(Auth::check() == false){
            if(!session()->has('url.intended')){
                session(['url.intended' => url()->current() ]);
            }
            return redirect()->route('account.login');
        }
        $customerAddress = CustomerAddress::where('user_id',Auth::user()->id)->first();
        
        session()->forget('url.intended');

        $countries = Country::orderBy('name','ASC')->get();

        $subTotal = Cart::subtotal(2,'.','');

        // Apply Discount here
        if(session()->has('code')){
            $code = session()->get('code');
            if($code->type == 'percent'){
                $discount = ($code->discount_amount/100)*$subTotal;
            }else{
                $discount = $code->discount_amount;
            }
        }

        //calculate shipping 

        if($customerAddress != ''){
            $userCountry = $customerAddress->country_id;
            $shippingInfo = ShippingCharge::where('country_id',$userCountry)->first();
            if($shippingInfo != null){
                $totalShippingCharge = $shippingInfo->amount;
            }else{
                $shippingInfo = ShippingCharge::where('country_id','rest_of_world')->first();
                $totalShippingCharge = $shippingInfo->amount;
            }

            $grandTotal = ($subTotal-$discount) + $totalShippingCharge;
        }else{
            $grandTotal = ($subTotal-$discount);
            $totalShippingCharge = 0;
        }        

        return view('front.checkout',[
            'countries' => $countries,
            'customerAddress' => $customerAddress,
            'totalShippingCharge' => $totalShippingCharge,
            'discount' => $discount,
            'grandTotal' => $grandTotal
        ]);
    }

    public function processCheckout(Request $request){
        //dd($request);exit;
        //step 1 apply validation
        $rules = [
            'first_name' => 'required|min:3',
            'last_name' => 'required',
            'email' => 'required|email',
            'country' => 'required',
            'address' => 'required|min:10',
            'city' => 'required',
            'state' => 'required',
            'zip' => 'required',
            'mobile' => 'required'
        ];

        if(!empty($request->payment_method) && $request->payment_method == 'stripe'){
            $rules['cardholderName'] = 'required';
        }

        $validator = Validator::make($request->all(),$rules);

        /* $validator = Validator::make($request->all(),[
            'first_name' => 'required|min:3',
            'last_name' => 'required',
            'email' => 'required|email',
            'country' => 'required',
            'address' => 'required|min:10',
            'city' => 'required',
            'state' => 'required',
            'zip' => 'required',
            'mobile' => 'required'
        ]); */

        if($validator->fails()){
            return response()->json([
                'message' => 'Please fix the errors',
                'status' => false,
                'errors' => $validator->errors()
            ]);
        }

        $user = Auth::user();

        // step 2 save user address
        //$customerAddress = CustomerAddress::find()
        CustomerAddress::updateOrCreate(
            ['user_id' => $user->id],
            [
                'first_name' => $request->first_name,
                'last_name' => $request->last_name,
                'email' => $request->email,
                'mobile' => $request->mobile,
                'country_id' => $request->country,
                'address' => $request->address,
                'apartment' => $request->apartment,
                'city' => $request->city,
                'state' => $request->state,
                'zip' => $request->zip
            ]
        );

        // step 3 store data in orders tabel

        if($request->payment_method == 'cod'){

            $shipping = 0;
            $discount = 0;
            $discountCodeId = '';
            $promoCode = '';
            $subTotal = Cart::subtotal(2,'.','');

            // Apply Discount here
            if(session()->has('code')){
                $code = session()->get('code');
                if($code->type == 'percent'){
                    $discount = ($code->discount_amount/100)*$subTotal;
                }else{
                    $discount = $code->discount_amount;
                }
                $discountCodeId = $code->id;
                $promoCode = $code->code;
            }
            
            // Calculate Shipping
            
            $shippingInfo = ShippingCharge::where('country_id',$request->country)->first();

            if($shippingInfo != null){
                $shipping = $shippingInfo->amount;
                $grandTotal = ($subTotal-$discount) + $shipping;
            }else{
                $shippingInfo = ShippingCharge::where('country_id','rest_of_world')->first();
                $shipping = $shippingInfo->amount;
                $grandTotal = ($subTotal-$discount) + $shipping;
            }
            
            $order = new Order;
            $order->subtotal = $subTotal;
            $order->shipping = $shipping;
            $order->grand_total = $grandTotal;
            $order->discount = $discount;
            $order->coupon_code_id = $discountCodeId;
            $order->coupon_code = $promoCode;
            $order->payment_status = 'not paid';
            $order->payment_mode = 'cod';
            $order->status = 'pending';
            $order->user_id = $user->id;
            $order->first_name = $request->first_name;
            $order->last_name = $request->last_name;
            $order->email = $request->email;
            $order->mobile = $request->mobile;
            $order->country_id = $request->country;
            $order->address = $request->address;
            $order->apartment = $request->apartment;
            $order->city = $request->city;
            $order->state = $request->state;
            $order->zip = $request->zip;
            $order->notes = $request->order_notes;

            $order->save();

            // step 4 store data in orderitems 
            foreach (Cart::content() as $item) {
                $orderItem = new OrderItem;
                $orderItem->product_id = $item->id; 
                $orderItem->order_id = $order->id; 
                $orderItem->name = $item->name; 
                $orderItem->qty = $item->qty; 
                $orderItem->price = $item->price;
                $orderItem->total = $item->price*$item->qty;
                $orderItem->save();

                // Update Product Stock
                $productData = Product::find($item->id);
                if($productData->track_qty == 'Yes'){
                    $currentQty = $productData->qty;
                    $updatedQty = $currentQty - $item->qty;
                    $productData->qty = $updatedQty;
                    $productData->save();
                }
            }

            // Send Order Email
            orderEmail($order->id,'customer');

            session()->flash('success','You have successfully placed your order.');
            
            Cart::destroy();
            
            session()->forget('code');
            
            return response()->json([
                'message' => 'Order saved successfully',
                'orderId' => $order->id,
                'status' => true
            ]);
            
        }else{
            //dd($request);exit;
            $shipping = 0;
            $discount = 0;
            $discountCodeId = '';
            $promoCode = '';
            $subTotal = Cart::subtotal(2,'.','');

            // Apply Discount here
            if(session()->has('code')){
                $code = session()->get('code');
                if($code->type == 'percent'){
                    $discount = ($code->discount_amount/100)*$subTotal;
                }else{
                    $discount = $code->discount_amount;
                }
                $discountCodeId = $code->id;
                $promoCode = $code->code;
            }
            
            // Calculate Shipping
            
            $shippingInfo = ShippingCharge::where('country_id',$request->country)->first();

            if($shippingInfo != null){
                $shipping = $shippingInfo->amount;
                $grandTotal = ($subTotal-$discount) + $shipping;
            }else{
                $shippingInfo = ShippingCharge::where('country_id','rest_of_world')->first();
                $shipping = $shippingInfo->amount;
                $grandTotal = ($subTotal-$discount) + $shipping;
            }

            // add payment using stripe 

            $token = $request->input('stripeToken');
            // Set Stripe secret key
            $stripe = new \Stripe\StripeClient(env('STRIPE_SECRET'));
            try {
                
                $stripe->charges->create([
                    "amount" => $grandTotal*100,
                    "currency" => "INR",
                    "source" => $request->stripeToken,
                    "description" => "Payment For Rupesh's AmazingOnlineShop",
                ]);
            } catch (\Exception $e) {
                return response()->json([
                    'message' => $e->getMessage(),
                    'status' => false
                ]);
            }
            
            $order = new Order;
            $order->subtotal = $subTotal;
            $order->shipping = $shipping;
            $order->grand_total = $grandTotal;
            $order->discount = $discount;
            $order->coupon_code_id = $discountCodeId;
            $order->coupon_code = $promoCode;
            $order->payment_status = 'paid';
            $order->payment_mode = 'card';
            $order->status = 'pending';
            $order->user_id = $user->id;
            $order->first_name = $request->first_name;
            $order->last_name = $request->last_name;
            $order->email = $request->email;
            $order->mobile = $request->mobile;
            $order->country_id = $request->country;
            $order->address = $request->address;
            $order->apartment = $request->apartment;
            $order->city = $request->city;
            $order->state = $request->state;
            $order->zip = $request->zip;
            $order->notes = $request->order_notes;

            $order->save();

            // step 4 store data in orderitems 
            foreach (Cart::content() as $item) {
                $orderItem = new OrderItem;
                $orderItem->product_id = $item->id; 
                $orderItem->order_id = $order->id; 
                $orderItem->name = $item->name; 
                $orderItem->qty = $item->qty; 
                $orderItem->price = $item->price;
                $orderItem->total = $item->price*$item->qty;
                $orderItem->save();

                // Update Product Stock
                $productData = Product::find($item->id);
                if($productData->track_qty == 'Yes'){
                    $currentQty = $productData->qty;
                    $updatedQty = $currentQty - $item->qty;
                    $productData->qty = $updatedQty;
                    $productData->save();
                }
            }
            
            // Send Order Email
            orderEmail($order->id,'customer');

            session()->flash('success','You have successfully placed your order.');
            
            Cart::destroy();
            
            session()->forget('code');
            
            return response()->json([
                'message' => 'Order saved successfully',
                'orderId' => $order->id,
                'status' => true
            ]);
        }

    }

    public function thankyou($id){
        return view('front.thanks',[
            'id' => $id
        ]);
    }

    public function getOrderSummery(Request $request){
        $subTotal = Cart::subtotal(2,'.','');
        $discount = 0;
        $discountString = '';
        // Apply Discount here
        if(session()->has('code')){
            $code = session()->get('code');
            if($code->type == 'percent'){
                $discount = ($code->discount_amount/100)*$subTotal;
            }else{
                $discount = $code->discount_amount;
            }
            $discountString  = '<div class="mt-4" id="discount-response">
                                    <strong>'.session()->get('code')->code.'</strong>
                                    <a class="btn btn-sm btn-danger" id="remove-discount">
                                        <i class="fa fa-times"></i>
                                    </a>
                                </div>';
        }

        if($request->country_id > 0){

            $shippingInfo = ShippingCharge::where('country_id',$request->country_id)->first();

            if($shippingInfo != null){
                $shippingCharge = $shippingInfo->amount;
                $grandTotal = ($subTotal-$discount) + $shippingCharge;
                return response([
                    'status' => true,
                    'grandTotal' => number_format($grandTotal,2),
                    'discount' => number_format($discount,2),
                    'discountString' => $discountString,
                    'shippingCharge' => number_format($shippingCharge,2)
                ]);
            }else{
                $shippingInfo = ShippingCharge::where('country_id','rest_of_world')->first();
                $shippingCharge = $shippingInfo->amount;
                $grandTotal = ($subTotal-$discount) + $shippingCharge;
                return response([
                    'status' => true,
                    'grandTotal' => number_format($grandTotal,2),
                    'discount' => number_format($discount,2),
                    'discountString' => $discountString,
                    'shippingCharge' => number_format($shippingCharge,2)
                ]);
            }

        }else{
            $subTotal = Cart::subtotal(2,'.','');
            return response([
                'status' => true,
                'grandTotal' => number_format(($subTotal-$discount),2),
                'discount' => number_format($discount,2),
                'discountString' => $discountString,
                'shippingCharge' => number_format(0,2)
            ]);
        }
    }

    public function applyDiscount(Request $request){
        
        $code = DiscountCoupon::where('code',$request->code)->first();

        if($code == null){
            return response()->json([
                'status' => false,
                'message' => 'Invalid Discount Coupon Code'
            ]);
        }

        //check if coupon start date is valid or not
        $now = Carbon::now();   

        if($code->starts_at != ''){
            $startDate = Carbon::createFromFormat('Y-m-d H:i:s',$code->starts_at);
            if($now->lt($startDate)){
                return response()->json([
                    'status' => false,
                    'message' => 'Invalid Discount Coupon Code'
                ]);
            }
        }

        if($code->expires_at != ''){
          $endDate = Carbon::createFromFormat('Y-m-d H:i:s',$code->expires_at);
            if($now->gt($endDate)){
                return response()->json([
                    'status' => false,
                    'message' => 'Invalid Discount Coupon Code'
                ]);
            }
        }

        // Max Uses Check
        if($code->max_uses > 0){
            $couponUsed = Order::where('coupon_code_id',$code->id)->count();

            if($couponUsed >= $code->max_uses){
                return response()->json([
                    'status' => false,
                    'message' => 'Invalid Discount Coupon Code'
                ]);
            }
        }

        // Max Uses User Check
        if($code->max_uses_user > 0){
            $couponUsedByUser = Order::where(['coupon_code_id' => $code->id, 'user_id' => Auth::user()->id])->count();

            if($couponUsedByUser >= $code->max_uses_user){
                return response()->json([
                    'status' => false,
                    'message' => 'You Have Already Used This Discount Coupon Code.'
                ]);
            }
        }

        $subTotal = Cart::subtotal(2,'.','');
        // Min Amount Condition Check
        if($code->min_amount > 0){
            if($subTotal < $code->min_amount){
                return response()->json([
                    'status' => false,
                    'message' => 'Your Minimum Amount Must be &#8377;'. $code->min_amount.'.',
                ]);
            }
        }elseif($code->min_amount == null){
            $discount_amount = number_format($code->discount_amount,2);
            // var_dump($subTotal);
            // var_dump($discount_amount);exit;
            if($code->type == 'fixed' && $discount_amount > $subTotal){
                // var_dump($discount_amount);
                // var_dump($subTotal);
                return response()->json([
                    'status' => false,
                    'message' => 'Your Minimun Amount Must be Greater than &#8377;'.$discount_amount.'.',
                ]);
                
            }
        }

        session()->put('code',$code);

        return $this->getOrderSummery($request);

    }

    public function removeCoupon(Request $request){
        session()->forget('code');
        return $this->getOrderSummery($request);
    }

}
