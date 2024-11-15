<?php

use App\Mail\CancelOrderEmail;
use App\Mail\OrderEmail;
use App\Models\Category;
use App\Models\Country;
use App\Models\Order;
use App\Models\Page;
use App\Models\ProductImage;
use Illuminate\Support\Facades\Mail;

function getCategories(){
    return Category::orderBy('name','ASC')
    ->with('sub_category')
    ->orderBy('id','DESC')
    ->where('status',1)
    ->where('showHome','Yes')
    ->get();
}

function getProductImage($productId){
    return ProductImage::where('product_id',$productId)->first();
}

function orderEmail($orderId, $userType="customer"){
    
    $order = Order::where('id',$orderId)->with('items')->first();

    if($userType == 'customer'){
        $subject = 'Thank you for your order';
        $email = $order->email;
    }else{
        $subject = 'You Have Received an order';
        $email = env('ADMIN_EMAIL');
    }

    $mailData = [
        'subject' => $subject,
        'order' => $order,
        'userType' => $userType
    ];

    Mail::to($email)->send(new OrderEmail($mailData));
    //dd($order);
}
function cancelOrderEmail($orderId, $userType="customer"){
    
    $order = Order::where('id',$orderId)->with('items')->first();
    
    if($userType == 'customer'){
        $subject = 'Cancel order';
        $email = $order->email;
    }else{
        $subject = 'Cancel order by Customer';
        $email = env('ADMIN_EMAIL');
    }

    $mailData = [
        'subject' => $subject,
        'order' => $order,
        'userType' => $userType
    ];

    Mail::to($email)->send(new CancelOrderEmail($mailData));
    //dd($order);
}

function getCountryInfo($id){
    return Country::where('id',$id)->first();
}

function staticPages(){
    $pages = Page::orderBy('name','ASC')->get();
    return $pages;
}

?>