<?php

namespace App\Http\Controllers;
use App\Models\Category;
use DB;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
class ApiController extends Controller
{
    public function navList(){
        $navList = Category::where('showHome','Yes')->get();
        if($navList){
            return response()->json([
                'status' => true,
                'data' => $navList
            ]);
        }else{
            return response()->json([
                'status' => false
            ]);
        }
    }
}