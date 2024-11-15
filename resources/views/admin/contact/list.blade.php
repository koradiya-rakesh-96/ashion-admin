@extends('admin.layouts.app')

@section('content')
    <!-- Content Header (Page header) -->
    <section class="content-header">					
        <div class="container-fluid my-2">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Contact-Us Query's</h1>
                </div>
                <div class="col-sm-6 text-right">
                    {{-- <a href="{{ route('users.create') }}" class="btn btn-primary">New User</a> --}}
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
            <div class="card">
                <form action="" method="get">
                    <div class="card-header"> 
                        <div class="card-title">
                            <button type="button" onclick="window.location.href='{{ route('contact.index') }}'" class="btn btn-default btn-sm">Reset</button>
                        </div>               
                        <div class="card-tools">
                            <div class="input-group input-group" style="width: 250px;">
                                <input type="text" name="keyword" value="{{ Request::get('keyword') }}" class="form-control float-right" placeholder="Search">
                                <div class="input-group-append">
                                    <button type="submit" class="btn btn-default">
                                    <i class="fas fa-search"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
                <div class="card-body table-responsive p-0">								
                    <table class="table table-hover table-fixed">
                        <thead>
                            <tr>
                                <th width="60">ID</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Subject</th>
                                <th>Message</th>
                            </tr>
                        </thead>
                        <tbody>
                            @if($contact->isNotEmpty())
                                @foreach ($contact as $user)
                                    <tr>
                                        <td>{{ $user->id }}</td>
                                        <td>{{ $user->name }}</td>
                                        <td>{{ $user->email }}</td>
                                        <td>{{ $user->subject }}</td>
                                        <td>{{ $user->message }}</td>
                                    </tr>
                                @endforeach
                            @else
                                <tr>
                                    <td colspan="5">Records Not Found</td>
                                </tr>
                            @endif
                        </tbody>
                    </table>										
                </div>
                <div class="card-footer clearfix">
                    {{ $contact->links() }}
                </div>
            </div>
        </div>
        <!-- /.card -->
    </section>
    <!-- /.content -->
@endsection

@section('customJs')
<script>
    function deleteUser(id){
        var url = '{{ route("users.delete","ID") }}';
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
                        window.location.href = "{{ route('users.index') }}"
                    }              
                }
            });
        }
        
    }
</script>
@endsection