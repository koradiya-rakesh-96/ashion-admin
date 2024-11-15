<?php

namespace App\Http\Controllers\admin;
use App\Models\Brand;
use Illuminate\Support\Facades\Validator;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class BrandController extends Controller
{
    public function index(Request $request){
        $brands = Brand::latest('id');
        if(!empty($request->get('keyword'))){
            $brands = $brands->where('name','like','%'.$request->get('keyword').'%');
        }
        $brands = $brands->paginate(10);
        return view('admin.brands.list',compact('brands'));
    }

    public function create(){
        return view('admin.brands.create');
    }

    public function edit($id,Request $request){
        $brand = Brand::find($id);
        if(empty($brand)){
            $request->session()->flash('error','Brand not found');
            return redirect()->route('brands.index');
        }
        /* $categories = Brand::orderBy('name','ASC')->get();
        $data['categories'] = $categories; */
        $data['brand'] = $brand;
        return view('admin.brands.edit',$data);
    }

    public function update($id, Request $request){
        
        $brand = Brand::find($id);

        if(empty($brand)){
            $request->session()->flash('error','Brand not found');
            return response([
                'status' => false,
                'notFound' => true
            ]);
        }

        $validator = Validator::make($request->all(),[
            'name' => 'required',
            'slug' => 'required|unique:brands,slug,'.$brand->id.',id',
            'staus' => 'require'
        ]);
        if($validator->passes()){

            $brand->name = $request->name;
            $brand->slug = $request->slug;
            $brand->status = $request->status;
            $brand->save();

            $request->session()->flash('success','Brand updated successfully');

            return response()->json([
                'status' => true,
                'message' => 'Brand updated successfully'
            ]);

        }else{
            return response([
                'status' => false,
                'errors' => $validator->errors()
            ]);
        }

    }

    public function store(Request $request){
        $validator = Validator::make($request->all(),[
            'name' => 'required',
            'slug' => 'required|unique:brands',
        ]);
        if($validator->passes()){
            $brand = new Brand();
            $brand->name = $request->name;
            $brand->slug = $request->slug;
            $brand->status = $request->status;
            $brand->save();

            $request->session()->flash('success','Brand added successfully');

            return response()->json([
                'status' => true,
                'message' => 'Brand added successfully'
            ]);

        }else{
            return response()->json([
                'status' => false,
                'errors' => $validator->errors()
            ]);
        }
    }

    public function destroy($brandId){
        $brand = Brand::find($brandId);
        if(empty($brand)){
            session()->flash('error','Brand not found');
            return response()->json([
                'status' => true,
                'message' => 'Brand not found'
            ]);    
            //return redirect()->route('categories.index');
        }
        
        $brand->delete();

        session()->flash('success','Brand Deleted Successfully');

        return response()->json([
            'status' => true,
            'message' => 'Brand Deleted Successfully'
        ]);
    }
}
