@extends('admin.layouts.app')

@section('content')

<!-- Content Header (Page header) -->
<section class="content-header">
    <div class="container-fluid my-2">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1>Shipping Managment</h1>
            </div>
            <div class="col-sm-6 text-right">
            </div>
        </div>
    </div>
    <!-- /.container-fluid -->
</section>
<!-- Main content -->
<section class="content">
    <!-- Default box -->
    <div class="container-fluid">
        @include('admin.message')
        <form action="" method="post" id="shippingForm" name="shippingForm">
            @csrf
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="name">Name</label>
                                <select name="country" id="country" class="form-control">
                                    <option value="">Select a country </option>
                                    @if ($countries->isNotEmpty())
                                        @foreach ($countries as $item)
                                            <option value="{{ $item->id }}">{{ $item->name }}</option>        
                                        @endforeach
                                        <option value="rest_of_world">Rest of the world </option>
                                    @endif
                                </select>
                                <p></p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="amount">Amount</label>
                                <input type="text" name="amount" id="amount" class="form-control" placeholder="Amount">
                                <p></p>	
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="pb-5 pt-3">
                <button type="submit" class="btn btn-primary">Create</button>
            </div>
        </form>
        <div class="card">
            <div class="card-body">
                <div class="row">
                    <div class="col-md-12">
                        <table class="table table-striped">
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Amount</th>
                                <th>Action</th>
                            </tr>
                            @if ($shippingCharges->isNotEmpty())
                                @foreach ($shippingCharges as $item)
                                    <tr>
                                        <td>{{ $item->id }}</td>
                                        <td>{{ ($item->country_id == 'rest_of_world') ? 'Rest of the world' : $item->name }}</td>
                                        <td>&#8377;{{ $item->amount }}</td>
                                        <td>
                                            <a href="{{ route('shipping.edit',$item->id) }}" class="btn btn-primary">Edit</a>
                                            <a href="javascript:void(0);" onclick="deleteShipping({{ $item->id }})" class="btn btn-danger">Delete</a>
                                        </td>
                                    </tr>
                                @endforeach
                            @endif
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.card -->
</section>
<!-- /.content -->

@endsection


@section('customJs')
<script>
    $('#shippingForm').submit(function(event){
        event.preventDefault();
        var elements = $(this);
        $.ajax({
            url : '{{ route('shipping.store') }}',
            type : 'post',
            data : elements.serializeArray(),
            dataType : 'json',
            success : function (response){
                if(response['status'] == true){
                    window.location.href = "{{ route('shipping.create') }}"
                    $("#country").removeClass('is-invalid').siblings('p').removeClass('invalid-feedback').html("");
                    $("#amount").removeClass('is-invalid').siblings('p').removeClass('invalid-feedback').html("");
                }else{
                    var errors = response['errors'];
                    if(errors['country']){
                        $("#country").addClass('is-invalid').siblings('p').addClass('invalid-feedback').html(errors['country']);
                    }else{
                        $("#country").removeClass('is-invalid').siblings('p').removeClass('invalid-feedback').html("");
                    }

                    if(errors['amount']){
                        $("#amount").addClass('is-invalid').siblings('p').addClass('invalid-feedback').html(errors['amount']);
                    }else{
                        $("#amount").removeClass('is-invalid').siblings('p').removeClass('invalid-feedback').html("");
                    }
                }
                
            },
            error : function(jqXHR,exception){
                console.log("something is worng");
            }
        });
    })

    function deleteShipping(id){
        var url = '{{ route("shipping.delete","ID") }}';
        var newUrl = url.replace("ID",id);
        //alert(newUrl);
        
        if(confirm("Are you sure you want to delete")){
            $.ajax({
                url : newUrl,
                type : 'delete',
                data : {},
                dataType : 'json',
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                success : function (response){
                    if(response['status']){
                        window.location.href = "{{ route('shipping.create') }}"
                    }              
                }
            });
        }
        
    }

</script>
@endsection