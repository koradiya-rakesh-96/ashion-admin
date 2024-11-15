@extends('front.layouts.app')

@section('content')
<section class="section-5 pt-3 pb-3 mb-3 bg-white">
    <div class="container">
        <div class="light-font">
            <ol class="breadcrumb primary-color mb-0">
                <li class="breadcrumb-item"><a class="white-text" href="{{ route('account.profile') }}">My Account</a></li>
                <li class="breadcrumb-item">Settings</li>
            </ol>
        </div>
    </div>
</section>

<section class=" section-11 ">
    <div class="container  mt-5">
        <div class="row">
            @include('front.account.common.message')
            <div class="col-md-3">
                @include('front.account.common.sidebar')
            </div>
            <div class="col-md-9">
                <div class="card">
                    <div class="card-header">
                        <h2 class="h5 mb-0 pt-2 pb-2">My Orders</h2>
                    </div>
                    <div class="card-body p-4">
                        <div class="table-responsive">
                            @if ($orders->isNotEmpty())
                                <table class="table">
                                    <thead> 
                                        <tr>
                                            <th>Orders #</th>
                                            <th>Date Purchased</th>
                                            <th>Status</th>
                                            <th>Total</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($orders as $order)
                                        <tr>
                                            <td>
                                                <a href="{{ route('account.orderDetail',$order->id) }}" style="color: #0079ff">ORD-ID-{{ $order->id }}</a>
                                            </td>
                                            <td>{{ \Carbon\Carbon::parse($order->created_at)->format('d M, Y') }}</td>
                                            <td>
                                                @if ($order->status == 'pending')
                                                    <span class="badge bg-danger">Pending</span>
                                                @elseif($order->status == 'shipped')
                                                    <span class="badge bg-info">Shipped</span>
                                                @elseif($order->status == 'delivered')
                                                    <span class="badge bg-success">Delivered</span>
                                                @else
                                                    <span class="badge bg-danger">Cancelled</span>
                                                @endif
                                            </td>
                                            <td>&#8377;{{ number_format($order->grand_total,2) }}</td>
                                            <td>
                                                @if ($order->status == 'shipped' || $order->status == 'delivered' || $order->status == 'cancelled')
                                                    <span style="cursor: no-drop" class="btn btn-danger btn-sm"><i class="fa fa-times"></i> Cancel</span>
                                                @else
                                                    <span style="cursor: pointer" class="btn btn-danger btn-sm" onclick="cancelOrder({{$order->id}});"><i class="fa fa-times"></i> Cancel</span>
                                                @endif
                                                
                                            </td>
                                        </tr>
                                        @endforeach                                  
                                    </tbody>
                                </table>
                            @else
                                <div>
                                    <h3 class="h4">Orders not found !</h3>
                                </div>
                            @endif
                        </div>                            
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
@endsection

@section('customJs')
    <script>
        function cancelOrder(id){
            if(confirm("Are You Sure You Want to Cancel this Order")){
                var url = '{{ route("account.orderCancel","ID") }}';
                var newUrl = url.replace("ID",id);
                $.ajax({
                    url : newUrl,
                    type : 'get',
                    data : {},
                    dataType : 'json',
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    },
                    success : function (response){
                        if(response['status']){
                            window.location.href = "{{ route('account.orders') }}"
                        }              
                    }
                });
            }
        }
    </script>
@endsection