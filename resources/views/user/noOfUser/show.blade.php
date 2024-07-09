@extends('user.layouts.master')

@section('title','User Detail')

@section('main-content')
<div class="card">
<h5 class="card-header">User Detail
  </h5>
  <div class="card-body">
    <table class="table table-striped table-hover table-hover">
      <thead>
        <tr>
          
            <th>User ID.</th>
            <th>Name</th>
            <th>Email</th>
            <th>Photo</th>
            <th>Role</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
      </thead>
      <tbody>
        <tr>
            <td>{{$user->id}}</td>
            <td>{{$user->name}} </td>
            <td>{{$user->email}}</td>
            <td>{{$user->photo}}</td>
            <td>{{$user->role}}</td>
            <td>{{$user->status}}</td>
            <td>
                <form method="POST" action="{{route('user.delete',[$user->id])}}">
                  @csrf
                  @method('delete')
                      <button class="btn btn-danger btn-sm dltBtn" data-id="{{$user->id}}" style="height:30px; width:30px;border-radius:50%" data-toggle="tooltip" data-placement="bottom" title="Delete"><i class="fas fa-trash-alt"></i></button>
                </form>
            </td>

        </tr>
      </tbody>
    </table>

    <section class="confirmation_part section_padding">
      <div class="order_boxes">
        <div class="row">
          <div class="col-lg-6 col-lx-4">
            <div class="order-info">
              <h4 class="text-center pb-4">USER INFORMATION</h4>
              <table class="table">
                    <tr class="">
                        <td> User ID</td>
                        <td> : {{$user->id}}</td>
                    </tr>
                    <tr>
                        <td>User Name</td>
                        <td> : {{$user->name}} </td>
                    </tr>
                    <tr>
                    </tr>
              </table>
            </div>
          </div>

         
        </div>
      </div>
    </section>

  </div>
</div>
@endsection

@push('styles')
<style>
    .order-info,.shipping-info{
        background:#ECECEC;
        padding:20px;
    }
    .order-info h4,.shipping-info h4{
        text-decoration: underline;
    }

</style>
@endpush
