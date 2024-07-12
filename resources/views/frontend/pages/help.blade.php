@extends('frontend.layouts.master')

@section('title', 'Help Center')

@section('main-content')
<div class="container mt-4">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <h1 class="text-center mb-4 text-primary">Welcome to Our Help Center</h1>
            
            <div class="accordion" id="helpAccordion">
                <!-- Account Management -->
                <div class="accordion-item">
                    <h2 class="accordion-header" id="accountHeading">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseAccount" aria-expanded="false" aria-controls="collapseAccount">
                            Account Management
                        </button>
                    </h2>
                    <div id="collapseAccount" class="accordion-collapse collapse" aria-labelledby="accountHeading" data-bs-parent="#helpAccordion">
                        <div class="accordion-body">
                            <ul>
                                <li><strong>Creating an Account:</strong> Step-by-step instructions on how to create an account.</li>
                                <li><strong>Login and Password:</strong> How to log in, reset a forgotten password, and change a password.</li>
                                <li><strong>Updating Account Information:</strong> How to update personal information, email, and address.</li>
                            </ul>
                        </div>
                    </div>
                </div>
                
                <!-- Ordering Process -->
                <div class="accordion-item">
                    <h2 class="accordion-header" id="orderHeading">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOrder" aria-expanded="false" aria-controls="collapseOrder">
                            Ordering Process
                        </button>
                    </h2>
                    <div id="collapseOrder" class="accordion-collapse collapse" aria-labelledby="orderHeading" data-bs-parent="#helpAccordion">
                        <div class="accordion-body">
                            <ul>
                                <li><strong>Placing an Order:</strong> Detailed steps on how to place an order.</li>
                                <li><strong>Payment Methods:</strong> Information on accepted payment methods, how to apply discount codes, and payment security.</li>
                                <li><strong>Order Confirmation:</strong> What to expect after placing an order, including confirmation emails and order summary.</li>
                            </ul>
                        </div>
                    </div>
                </div>
                
                <!-- Shipping and Delivery -->
                <div class="accordion-item">
                    <h2 class="accordion-header" id="shippingHeading">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseShipping" aria-expanded="false" aria-controls="collapseShipping">
                            Shipping and Delivery
                        </button>
                    </h2>
                    <div id="collapseShipping" class="accordion-collapse collapse" aria-labelledby="shippingHeading" data-bs-parent="#helpAccordion">
                        <div class="accordion-body">
                            <ul>
                                <li><strong>Shipping Options:</strong> Information on available shipping methods, costs, and estimated delivery times.</li>
                                <li><strong>Tracking Orders:</strong> How to track an order and interpret tracking information.</li>
                                <li><strong>International Shipping:</strong> Policies and additional charges for international shipping.</li>
                            </ul>
                        </div>
                    </div>
                </div>
                
                <!-- Returns and Refunds -->
                <div class="accordion-item">
                    <h2 class="accordion-header" id="returnsHeading">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseReturns" aria-expanded="false" aria-controls="collapseReturns">
                            Returns and Refunds
                        </button>
                    </h2>
                    <div id="collapseReturns" class="accordion-collapse collapse" aria-labelledby="returnsHeading" data-bs-parent="#helpAccordion">
                        <div class="accordion-body">
                            <ul>
                                <li><strong>Return Policy:</strong> Detailed return policy, including conditions for returns and timeframes.</li>
                                <li><strong>Refund Process:</strong> How and when refunds are processed, including timelines for different payment methods.</li>
                                <li><strong>Contact Customer Support:</strong> How to contact customer support for assistance with returns and refunds.</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="text-center mt-4">
                <p>If you have any further questions or need assistance, please feel free to <a href="{{ route('contact') }}" class="btn btn-primary">Contact Us</a>.</p>
            </div>
        </div>
    </div>
</div>
@endsection

@push('scripts')
<script>
    document.addEventListener('DOMContentLoaded', function() {
        var helpAccordion = document.getElementById('helpAccordion');
        if (helpAccordion) {
            new bootstrap.Collapse(helpAccordion, {
                toggle: false
            });
        }
    });
</script>
@endpush