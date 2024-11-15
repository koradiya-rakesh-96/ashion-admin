<?php

namespace App\Http\Controllers\admin;
use App\Models\Order;
use App\Models\Product;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    public function index(){
        
        $totalOrders = Order::where('status','!=','cancelled')->count();
        $totalCustomers = User::where('role',1)->count();
        $totalProducts = Product::count();
        $totalRevanue = Order::where('status','!=','cancelled')->sum('grand_total');

        //revanue this month
        $startOfMonth = Carbon::now()->startOfMonth()->format('Y-m-d');
        $currentDate = Carbon::now()->format('Y-m-d');

        $revanueThisMonth = Order::where('status','!=','cancelled')->whereDate('created_at','>=',$startOfMonth)->whereDate('created_at','<=',$currentDate)->sum('grand_total');

        //revanue last month
        $lastMonthStartDate = Carbon::now()->subMonth()->startOfMonth()->format('Y-m-d');
        $lastMonthEndDate = Carbon::now()->subMonth()->endOfMonth()->format('Y-m-d');
        $lastMonthName = Carbon::now()->subMonth()->startOfMonth()->format('M');

        $revanueLastMonth = Order::where('status','!=','cancelled')->whereDate('created_at','>=',$lastMonthStartDate)->whereDate('created_at','<=',$lastMonthEndDate)->sum('grand_total');
        
        return view('admin.dashboard',[
            'totalOrders' => $totalOrders,
            'totalProducts' => $totalProducts,
            'totalCustomers' => $totalCustomers,
            'totalRevanue' => $totalRevanue,
            'revanueThisMonth' => $revanueThisMonth,
            'revanueLastMonth' => $revanueLastMonth,
            'lastMonthName' => $lastMonthName
        ]);
        
        //$admin = Auth::guard('admin')->user();
        //echo 'Welcome '.$admin->name.' <a href="'.route('admin.logout').'">logout</a>';
    }

    public function logout(){
        Auth::guard('admin')->logout();
        return redirect()->route('admin.login');
    }
}
