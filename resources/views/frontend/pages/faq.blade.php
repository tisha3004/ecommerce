@extends('frontend.layouts.master')

@section('title', 'FAQ')

@section('main-content')

<div class="container mt-4">
    <div class="card">
        <div class="card-header">
            <h5 class="card-title">Frequently Asked Questions</h5>
        </div>
        <div class="card-body">
            <div id="accordion">

                <!-- FAQ Item 1 -->
                <div class="card">
                    <div class="card-header" id="headingOne">
                        <h5 class="mb-0">
                            <button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne"
                                aria-expanded="true" aria-controls="collapseOne">
                                Question 1: What are the payment options available?
                            </button>
                        </h5>
                    </div>

                    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
                        <div class="card-body">
                            Answer 1: We accept payments via credit/debit card, PayPal, and bank transfer.
                        </div>
                    </div>
                </div>

                <!-- FAQ Item 2 -->
                <div class="card">
                    <div class="card-header" id="headingTwo">
                        <h5 class="mb-0">
                            <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseTwo"
                                aria-expanded="false" aria-controls="collapseTwo">
                                Question 2: How can I track my order?
                            </button>
                        </h5>
                    </div>
                    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
                        <div class="card-body">
                            Answer 2: Once your order is shipped, you will receive a tracking number via email. You can
                            use this number to track your order on our website.
                        </div>
                    </div>
                </div>

                <!-- FAQ Item 3 -->
                <div class="card">
                    <div class="card-header" id="headingThree">
                        <h5 class="mb-0">
                            <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseThree"
                                aria-expanded="false" aria-controls="collapseThree">
                                Question 3: What is your return policy?
                            </button>
                        </h5>
                    </div>
                    <div id="collapseThree" class="collapse" aria-labelledby="headingThree"
                        data-parent="#accordion">
                        <div class="card-body">
                            Answer 3: We accept returns within 30 days of purchase. Items must be unused and in their
                            original packaging for a full refund.
                        </div>
                    </div>
                </div>

                <!-- Add more FAQ items as needed -->

            </div>
        </div>
    </div>
</div>

@endsection
