<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\TempImage;
use Illuminate\Http\Request;
//use Nette\Utils\Image;
use Intervention\Image\ImageManagerStatic as Image;
//use Intervention\Image\Facades\Image as Image;

class TempImagesController extends Controller
{
    public function create(Request $request){
        $image = $request->image;
        //dd($image);exit;
        if(!empty($image)){
            $ext = $image->getClientOriginalExtension();
            //$newName = time().'.'.$ext;
            $imgname = $image->getClientOriginalName();
            $newName = time().'-'.$imgname;

            $tempImage = new TempImage();
            $tempImage->name = $newName;
            $tempImage->save();
            $image->move(public_path().'/temp',$newName);

            //Generate Thumb
            $sourcePath = public_path().'/temp/'.$newName;
            $destPath = public_path().'/temp/thumb/'.$newName;
            //dd($sourcePath);
            //dd($destPath);
            $image = Image::make($sourcePath);
            $image->fit(300,275);
            $image->save($destPath);

            return response()->json([
                'status' => true,
                'image_id' => $tempImage->id,
                'imagePath' => asset('/temp/thumb/'.$newName),
                'message' => 'Image Uploaded successfully'
            ]);

        }
    }
}
