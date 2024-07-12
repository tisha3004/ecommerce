@extends('frontend.layouts.master')

@section('title', 'Money-back Policy')

@section('main-content')
<div class="container mt-4">
    <div class="card shadow">
        <div class="card-body">
            <h2 class="card-title text-center mb-4 important-text">Money-back Policy</h2>
            
            <h5 class="important-text">We offer a money-back guarantee under the following conditions:</h5>
            
            <ul>
                <li>Products must be returned within 30 days of purchase.</li>
                <li>Products must be in original condition and packaging.</li>
                <li>Refunds will be processed within 7-10 business days after receiving the returned item.</li>
                <li>Shipping costs for returns are the responsibility of the customer unless the product is defective or incorrect.</li>
                <li>Items that have been personalized or customized are not eligible for a refund.</li>
                <li>Digital products are non-refundable once downloaded or accessed.</li>
                <li>We reserve the right to deny a refund if the returned product does not meet our return criteria.</li>
            </ul>
            
            <p>Contact our customer support for assistance with returns and refunds.</p>
        </div>
    </div>
</div>
@endsection
