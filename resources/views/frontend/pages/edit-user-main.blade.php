@extends('frontend.layouts.master')

@section('title', 'Ecommerce || Your Account')

@section('main-content')
    <!-- Breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="bread-inner">
                        <ul class="bread-list">
                            <li><a href="/">Home<i class="ti-arrow-right"></i></a></li>
                            <li><a href="{{route('edit')}}">Your Account</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->

    <!-- Account Dashboard -->
    <section class="account-dashboard section">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <h2 class="title text-center mb-4">Your Account</h2>
                    <div class="card-grid">
                        <a href="{{route('order.history')}}">
                         <div class="card">
                            <img src="{{ asset('/storage/photos/1/icons/orderHistory.png') }}" alt="Your Orders">
                            <div class="card-title">Your Orders</div>
                            <div class="card-text">Track, return, or buy things again</div>
                         </div>
                       </a>
                       <a href="{{route('user.edit1')}}">
                        <div class="card">
                            <img src="{{ asset('/storage/photos/1/icons/security.jpg') }}" alt="Login & Security">
                            <div class="card-title">Login & Security</div>
                            <div class="card-text">Edit login, name, and mobile number</div>
                        </div>
                       </a>
                       <a href="">
                        <div class="card">
                            <img src="{{ asset('/storage/photos/1/icons/address.png') }}" alt="Your Addresses">
                            <div class="card-title">Your Addresses</div>
                            <div class="card-text">Edit addresses for orders and gifts</div>
                        </div>
                        </a>
                        <a href="{{route('payment-methods')}}">
                        <div class="card">
                            <img src="{{ asset('/storage/photos/1/icons/payment.jpg') }}" alt="Payment Options">
                            <div class="card-title">Payment Options</div>
                            <div class="card-text">Edit or add payment methods</div>
                        </div>
                        </a>
                        
                        <a href="{{route('contact')}}">
                        <div class="card">
                            <img src="{{ asset('/storage/photos/1/icons/contactUs.png') }}" alt="Contact Us">
                            <div class="card-title">Contact Us</div>
                            <div class="card-text">Contact our customer support</div>
                        </div>
                      </a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Account Dashboard -->
@endsection

@push('styles')
<style>
    body {
        font-family: 'Roboto', sans-serif;
        background-color: #f5f5f5;
        margin: 0;
        padding: 20px;
    }
    .breadcrumbs .bread-inner {
        margin-top: 20px;
    }
    .breadcrumbs .bread-list li {
        display: inline-block;
        font-size: 14px;
    }
    .breadcrumbs .bread-list li a {
        color: #333;
    }
    .account-dashboard {
        padding: 40px 0;
    }
    .title {
        font-size: 24px;
        font-weight: 700;
        margin-bottom: 20px;
    }
    .card-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
        gap: 20px;
    }
    .card {
        background-color: #fff;
        border: 1px solid #ddd;
        border-radius: 8px;
        padding: 20px;
        text-align: center;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }
    .card img {
        max-width: 50px;
        margin-bottom: 10px;
    }
    .card-title {
        font-size: 18px;
        font-weight: 700;
        margin-bottom: 10px;
    }
    .card-text {
        font-size: 14px;
        color: #555;
    }
</style>
@endpush
