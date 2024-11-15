<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Contact;
use Illuminate\Http\Request;

class ContactUsContoller extends Controller
{
    public function index(Request $request){
        $contact = Contact::latest();
        if(!empty($request->get('keyword'))){
            $contact = $contact->where('name','like','%'.$request->get('keyword').'%');
            $contact = $contact->orWhere('email','like','%'.$request->get('keyword').'%');
        }
        $contact = $contact->paginate(10);
        return view('admin.contact.list',compact('contact'));
    }
}
