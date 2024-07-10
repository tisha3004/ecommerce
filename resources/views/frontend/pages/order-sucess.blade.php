@extends('frontend.layouts.master')

@section('title','Checkout page')

@section('main-content')

<div class="card">
    <h5 class="card-header">Order Details</h5>
    <div class="card-body">
        <div class="form-group">
            <label for="inputOrderNumber" class="col-form-label">Order Number: </label>
            <input id="inputOrderNumber" type="text" name="order_number" value="{{ $order_data['order_number'] }}" class="form-control" readonly>
        </div>
        <div class="form-group">
            <label for="inputName" class="col-form-label">Name: </label>
            <input id="inputName" type="text" name="name" value="{{ $order_data['first_name'] }} {{ $order_data['last_name'] }}" class="form-control" readonly>
        </div>
        <div class="form-group">
            <label for="inputEmail" class="col-form-label">Email: </label>
            <input id="inputEmail" type="text" name="email" value="{{ $order_data['email'] }}" class="form-control" readonly>
        </div>
        <div class="form-group">
            <label for="inputPhone" class="col-form-label">Phone Number: </label>
            <input id="inputPhone" type="text" name="phone" value="{{ $order_data['phone'] }}" class="form-control" readonly>
        </div>
        <div class="form-group">
            <label for="inputAddress" class="col-form-label">Address: </label>
            <input id="inputAddress" type="text" name="address" value="{{ $order_data['address1'] }} {{ $order_data['address2'] }} {{ $order_data['post_code'] }}" class="form-control" readonly>
        </div>
        <div class="form-group">
            <label for="inputPaymentMethod" class="col-form-label">Payment Method: </label>
            <input id="inputPaymentMethod" type="text" name="payment_method" value="{{ $order_data['payment_method'] }}" class="form-control" readonly>
        </div>
        <div class="form-group">
            <label for="inputQuantity" class="col-form-label">Quantity: </label>
            <input id="inputQuantity" type="text" name="quantity" value="{{ $order_data['quantity'] }}" class="form-control" readonly>
        </div>
        <div class="form-group">
            <label for="inputTotalAmount" class="col-form-label">Total Amount: </label>
            <input id="inputTotalAmount" type="text" name="total_amount" value="{{ $order_data['total_amount'] }}" class="form-control" readonly>
        </div>
        <div class="form-group">
            <label for="inputPaymentStatus" class="col-form-label">Payment Status: </label>
            <input id="inputPaymentStatus" type="text" name="payment_status" value="{{ $order_data['payment_status'] }}" class="form-control" readonly>
        </div>
        <div class="form-group mb-3">
            <button class="btn btn-success text-white" type="submit">
                <a href="{{ route('home1') }}" class="text-white">Done</a>
            </button>
        </div>
    </div>
</div>

@endsection

@push('styles')
<link rel="stylesheet" href="{{ asset('backend/summernote/summernote.min.css') }}">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/css/bootstrap-select.css" />
@endpush

@push('scripts')
<script src="/vendor/laravel-filemanager/js/stand-alone-button.js"></script>
<script src="{{ asset('backend/summernote/summernote.min.js') }}"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/js/bootstrap-select.min.js"></script>
@endpush
