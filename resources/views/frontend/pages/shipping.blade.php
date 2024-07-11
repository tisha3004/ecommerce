@extends('user.layouts.master')

@section('title', 'Shipping Policy')

@section('main-content')
<div class="container mt-4">
    <div class="card shadow">
        <div class="card-body">
            <h2 class="card-title text-center mb-4">Shipping Policy</h2>
            
            <p>We offer the following shipping options:</p>
            
            <ul>
                <li>Standard Shipping: 5-7 business days</li>
                <li>Express Shipping: 2-3 business days</li>
                <li>International Shipping: Delivery times may vary based on destination</li>
            </ul>
            
            <p>Shipping costs are calculated at checkout and may vary based on the shipping method selected and
                destination.</p>
            
            <p>For international orders, customs duties and taxes may apply and are the responsibility of the
                recipient.</p>
        </div>
    </div>
</div>
@endsection
