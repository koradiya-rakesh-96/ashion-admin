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
                                            <option {{ ($shippingCharge->country_id == $item->id) ? 'selected' : '' }} value="{{ $item->id }}">{{ $item->name }}</option>        
                                        @endforeach
                                        <option {{ ($shippingCharge->country_id == 'rest_of_world') ? 'selected' : '' }} value="rest_of_world">Rest of the world </option>
                                    @endif
                                </select>
                                <p></p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="amount">Amount</label>
                                <input value="{{ $shippingCharge->amount }}" type="text" name="amount" id="amount" class="form-control" placeholder="Amount">
                                <p></p>	
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="pb-5 pt-3">
                <button type="submit" class="btn btn-primary">Update</button>
            </div>
        </form>
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
            url : '{{ route('shipping.update',$shippingCharge->id) }}',
            type : 'put',
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
</script>
@endsection