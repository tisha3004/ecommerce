@extends('frontend.layouts.master')

@section('title', 'Privacy Policy')

@section('main-content')
<div class="container mt-4">
    <div class="card shadow">
        <div class="card-body">
            <h2 class="card-title text-center mb-4">Privacy Policy</h2>
            
            <div class="privacy-section">
                <h4 class="privacy-heading">1. Information Collection</h4>
                <p>We collect information from you when you register on our site, place an order, subscribe to our
                    newsletter, respond to a survey, or fill out a form.</p>
            </div>
            
            <div class="privacy-section">
                <h4 class="privacy-heading">2. Use of Information</h4>
                <p>Any of the information we collect from you may be used in one of the following ways:</p>
                <ul>
                    <li>To personalize your experience (your information helps us to better respond to your individual
                        needs)</li>
                    <li>To improve our website (we continually strive to improve our website offerings based on the
                        information and feedback we receive from you)</li>
                    <li>To process transactions</li>
                    <li>To send periodic emails</li>
                </ul>
            </div>
            
            <div class="privacy-section">
                <h4 class="privacy-heading">3. Security</h4>
                <p>We implement a variety of security measures to maintain the safety of your personal information
                    when you place an order or enter, submit, or access your personal information.</p>
                <p>We offer the use of a secure server. All supplied sensitive/credit information is transmitted via
                    Secure Socket Layer (SSL) technology and then encrypted into our Payment gateway providers database
                    only to be accessible by those authorized with special access rights to such systems, and are
                    required to keep the information confidential.</p>
            </div>
            
            <div class="privacy-section">
                <h4 class="privacy-heading">4. Cookies</h4>
                <p>We use cookies to help us remember and process the items in your shopping cart and understand and
                    save your preferences for future visits.</p>
            </div>
            
            <div class="privacy-section">
                <h4 class="privacy-heading">5. Third Party Disclosure</h4>
                <p>We do not sell, trade, or otherwise transfer to outside parties your personally identifiable
                    information. This does not include trusted third parties who assist us in operating our website,
                    conducting our business, or servicing you, so long as those parties agree to keep this information
                    confidential. We may also release your information when we believe release is appropriate to comply
                    with the law, enforce our site policies, or protect ours or others rights, property, or safety.</p>
            </div>
            
            <div class="privacy-section">
                <h4 class="privacy-heading">6. Changes to Our Privacy Policy</h4>
                <p>If we decide to change our privacy policy, we will post those changes on this page, and/or update
                    the Privacy Policy modification date below.</p>
                <p>This policy was last modified on <span class="privacy-date">[Date]</span></p>
            </div>
            
            <div class="privacy-section">
                <h4 class="privacy-heading">7. Contacting Us</h4>
                <p>If there are any questions regarding this privacy policy, you may contact us using the information
                    below:</p>
                <ul>
                    <li>Email: mehtatisha35@gmail.com</li>
                    <li>Phone: +1000000001</li>
                    <li>Address: 123 Street, City, Country</li>
                </ul>
            </div>
        </div>
    </div>
</div>
@endsection

@push('styles')
<style>
    .privacy-section {
        margin-bottom: 20px;
    }
    
    .privacy-heading {
        font-size: 18px;
        color: #007bff;
        margin-bottom: 10px;
    }
    
    .privacy-date {
        font-weight: bold;
    }
</style>
@endpush
