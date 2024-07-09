@extends('user.layouts.master')

@section('main-content')
 <!-- DataTales Example -->
 <div class="card shadow mb-4">
     <div class="row">
         <div class="col-md-12">
            @include('user.layouts.notification')
         </div>
     </div>
    <div class="card-header py-3">
      <h6 class="m-0 font-weight-bold text-primary float-left">Payment Lists</h6>
    </div>
    <div class="container">
        <h2>Details of Payment</h2>
    <form action="{{route('user.payment.index1')}}" method="post">
        @csrf
    <div class="form-group">
        <label for="PaymentID">ID: </label>
        <input type="text" name="id" class="form-control" value="{{$payment->id}}" readonly>
    </div>
    <div class="form-group">
        <label for="User">User ID: </label>
        <input type="text" name="uid" class="form-control" value="{{$payment->id}}" readonly>
    </div>
    <div class="form-group">
        <label for="Name">Name: </label>
        <input type="text" name="name" class="form-control" value="{{ $payment->first_name }}  {{$payment->last_name}}" readonly>
    </div>         
    <div class="form-group">
        <label for="amount">Amount: </label>
        <input type="text" name="amount" class="form-control" value="{{$payment->total_amount}}"readonly>
    </div>
    <div class="form-group">
        <label for="status">Status: </label>
        <input type="text" name="status" class="form-control" value="{{$payment->status}}" readonly>
    </div>
    <div class="form-group">
        <label for="order_number">Order Number: </label>
        <input type="text" name="order_number" class="form-control" value="{{$payment->order_number}}" readonly>
    </div>
    <div class="form-group">
        <label for="phone">Phone Number: </label>
        <input type="text" name="phone" class="form-control" value="{{$payment->phone}}" readonly>
    </div>
    <button type="submit" class="btn btn-primary">Back</button>
    </div>
</form>
</div>
@endsection

@push('styles')
  <link href="{{asset('backend/vendor/datatables/dataTables.bootstrap4.min.css')}}" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
  <style>
      div.dataTables_wrapper div.dataTables_paginate{
          display: none;
      }
  </style>
@endpush

@push('scripts')

  <!-- Page level plugins -->
  <script src="{{asset('backend/vendor/datatables/jquery.dataTables.min.js')}}"></script>
  <script src="{{asset('backend/vendor/datatables/dataTables.bootstrap4.min.js')}}"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="{{asset('backend/js/demo/datatables-demo.js')}}"></script>
  <script>

      $('#order-dataTable').DataTable( {
            "columnDefs":[
                {
                    "orderable":false,
                    "targets":[8]
                }
            ]
        } );

        // Sweet alert

     
  </script>
  <script>
      $(document).ready(function(){
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
       
      })
  </script>
@endpush
