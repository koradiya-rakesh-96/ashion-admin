<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    public function index(Request $request){
        $users = User::latest()->where('role',1);
        if(!empty($request->get('keyword'))){
            $users = $users->where('name','like','%'.$request->get('keyword').'%');
            $users = $users->orWhere('email','like','%'.$request->get('keyword').'%');
        }
        $users = $users->paginate(10);

        return view('admin.users.list',compact('users'));
    }

    public function create(){
        return view('admin.users.create');
    }

    public function store(Request $request){
        
        $validator = Validator::make($request->all(),[
            'name' => 'required',
            'password' => 'required|min:5',
            'email' => 'required|email|unique:users',
            'phone' => 'required'
        ]);

        if($validator->passes()){
            $user = new User();
            $user->name = $request->name;
            $user->password = Hash::make($request->password);
            $user->email = $request->email;
            $user->phone = $request->phone;
            $user->status = $request->status;
            $user->save();

            $request->session()->flash('success','User added successfully');

            return response()->json([
                'status' => true,
                'message' => 'User added successfully'
            ]);

        }else{
            return response([
                'status' => false,
                'errors' => $validator->errors()
            ]);
        }

    }

    public function edit($id, Request $request){
        
        $user = User::find($id);

        if($user == null){
            session()->flash('error','User not found !');
            return redirect()->route('users.index');
        }

        $data['user'] = $user;

        return view('admin.users.edit',$data);
    }

    public function update($id, Request $request){
        
        $user = User::find($id);

        if($user == null){
            session()->flash('error','User not found !');
            return response()->json([
                'status' => true,
                'message' => 'User not found'
            ]);
        }
        
        $validator = Validator::make($request->all(),[
            'name' => 'required',
            'email' => 'required|email|unique:users,email,'.$id.',id'
        ]);

        if($validator->passes()){
            
            $user->name = $request->name;
            if($request->password != ''){
                $user->password = Hash::make($request->password);
            }
            $user->email = $request->email;
            $user->phone = $request->phone;
            $user->status = $request->status;
            $user->save();

            $request->session()->flash('success','User updated successfully');

            return response()->json([
                'status' => true,
                'message' => 'User updated successfully'
            ]);

        }else{
            return response([
                'status' => false,
                'errors' => $validator->errors()
            ]);
        }

    }


    public function destroy($id){

        $user = User::find($id);

        if($user == null){
            session()->flash('error','User not found !');
            return response()->json([
                'status' => true,
                'message' => 'User not found'
            ]);
        }
        
        $user->delete();

        session()->flash('success','User Deleted Successfully');
        return response()->json([
            'status' => true,
            'message' => 'User Deleted Successfully'
        ]);

    }

}
