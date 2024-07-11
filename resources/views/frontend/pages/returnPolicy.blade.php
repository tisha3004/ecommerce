@extends('frontend.layouts.master')

@section('title', 'Returns Policy')

@section('main-content')
<div class="container mt-4">
    <div class="card shadow">
        <div class="card-body">
            <h2 class="card-title text-center mb-4">Returns Policy</h2>
            
            <p>We accept returns under the following conditions:</p>
            
            <ul>
                <li>Products must be returned within 30 days of purchase.</li>
                <li>Products must be unused and in original condition with all tags attached.</li>
                <li>Returns are subject to inspection and approval before a refund or exchange is processed.</li>
            </ul>
            
            <p>Shipping costs for returns are the responsibility of the customer unless the return is due to a
                manufacturer defect or shipping error.</p>
        </div>
    </div>
</div>
@endsection
