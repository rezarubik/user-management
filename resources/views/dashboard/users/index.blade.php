@extends('dashboard.layouts.master')
@section('title', 'List Users')
@section('css')
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.18/css/bootstrap-select.min.css" integrity="sha512-ARJR74swou2y0Q2V9k0GbzQ/5vJ2RBSoCWokg4zkfM29Fb3vZEQyv0iWBMW/yvKgyHSR/7D64pFMmU8nYmbRkg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
@endsection
@section('content')
<div class="container-fluid">
    @if(Session::has('status'))
    <div class="alert alert-warning alert-dismissible fade show" role="alert">
        <strong>Viola!</strong> {{Session::get('status')}}
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
    @endif
    @if(Session::has('error'))
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
        <strong>Sorry!</strong> {{Session::get('error')}}
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
    @endif

    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <div class="row">
                <div class="col-md-6">
                    <h1 class="h3 mb-2 text-gray-800 m-0">Management Users</h1>
                </div>
                <!-- //todo: Create new data here -->
                <div class="col-md-6">
                    <a type="button" class="btn btn-md btn-primary float-right" href="{{route('dashboard.user.create')}}">
                        <i class="fas fa-plus"></i> Add New
                    </a>
                </div>
            </div>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="usersTable" width="100%" cellspacing="0">
                    <thead>
                        <th>Firstname</th>
                        <th>Lastname</th>
                        <th>Email</th>
                        <th>Role</th>
                        <th>Is Verify</th>
                        <th>Registered On</th>
                        <th>Action</th>
                    </thead>
                    <tbody>
                        @foreach($users as $user)
                        <tr>
                            <td>{{$user->firstname}}</td>
                            <td>{{$user->lastname}}</td>
                            <td>{{$user->email}}</td>
                            <td>Role</td>
                            <td>{{$user->is_verify}}</td>
                            <td>{{$user->created_at}}</td>
                            <td class="text-center">
                                <a title="Detail" href="#" class="btn btn-secondary btn-circle btn-sm">
                                    <i class="fas fa-eye"></i>
                                </a>
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
@endsection

@section('js')
<!-- Page level plugins -->
<script src="{{asset('assets/vendor/datatables/jquery.dataTables.min.js')}}"></script>
<script src="{{asset('assets/vendor/datatables/dataTables.bootstrap4.min.js')}}"></script>

<!-- Page level custom scripts -->
<!-- <script src="{{asset('assets/js/demo/datatables-demo.js')}}"></script> -->

<script>
    $(document).ready(function() {
        $('#usersTable').DataTable({
            "aaSorting": [
                [6, "desc"]
            ]
        });
    });
</script>
@endsection