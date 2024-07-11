@extends('frontend.layouts.master')

@section('title', 'Payment Methods')

@section('main-content')
<div class="container mt-4">
    <div class="card shadow">
        <div class="card-body">
            <h2 class="card-title text-center mb-4">Payment Methods</h2>
            
            <p>We accept the following payment methods:</p>
            
            <ul>
                <li>Credit/Debit Cards (Visa, Mastercard, American Express)</li>
                <li>PayPal</li>
                <li>Bank Transfer</li>
                <li>Payment Wallets (e.g., Apple Pay, Google Pay)</li>
            </ul>
            
            <p>Please ensure your preferred payment method is available in your region before making a purchase.</p>
        </div>
    </div>
</div>
@endsection
