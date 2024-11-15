<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Page;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class PageController extends Controller
{
    public function index(Request $request){
        $pages = Page::latest();
        if(!empty($request->get('keyword'))){
            $pages = $pages->where('name','like','%'.$request->get('keyword').'%');
        }
        
        $pages = $pages->paginate(10);
        return view('admin.pages.list',[
            'pages' => $pages
        ]);
    }

    public function create(){
        return view('admin.pages.create');
    }

    public function store(Request $request){

        $validator = Validator::make($request->all(),[
            'name' => 'required',
            'slug' => 'required|unique:pages'
        ]);
        
        if($validator->fails()){
            return response()->json([
                'status' => false,
                'errors' => $validator->errors()
            ]);
        }

        $page = new Page;
        $page->name = $request->name;
        $page->slug = $request->slug;
        $page->content = $request->content;
        $page->save();

        session()->flash('success','Page added successfully');

        return response()->json([
            'status' => true,
            'message' => 'Page added successfully'
        ]);

    }

    public function edit($id, Request $request){
        $pages = Page::find($id);
        if(empty($pages)){
            session()->flash('error','Page not found');
            return redirect()->route('pages.index');
        }

        $data['pages'] = $pages;
        
        return view('admin.pages.edit',$data);
    }

    public function update($id, Request $request){

        $page = Page::find($id);
        if($page == null){
            session()->flash('error','Page not found !');
            return response()->json([
                'status' => true,
                'message' => 'Page not found !'
            ]);
        }

        $validator = Validator::make($request->all(),[
            'name' => 'required',
            'slug' => 'required|unique:pages,slug,'.$id.',id',
        ]);
        
        if($validator->fails()){
            return response()->json([
                'status' => false,
                'errors' => $validator->errors()
            ]);
        }

        $page->name = $request->name;
        $page->slug = $request->slug;
        $page->content = $request->content;
        $page->save();

        session()->flash('success','Page updated successfully');

        return response()->json([
            'status' => true,
            'message' => 'Page updated successfully'
        ]);

    }

    public function destroy($id){
        $page = Page::find($id);
        if($page == null){
            session()->flash('error','Page not found !');
            return response()->json([
                'status' => true,
                'message' => 'Page not found !'
            ]);
        }

        $page->delete();
        session()->flash('success','Page deleted successfully');
        return response()->json([
            'status' => true,
            'message' => 'Page deleted successfully'
        ]);
    }
}
