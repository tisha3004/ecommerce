@extends('frontend.layouts.master')

@section('title','Ecommerce  || User Edit')

@section('main-content')
    <!-- Breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="bread-inner">
                        <ul class="bread-list">
                            <li><a href="/">Home<i class="ti-arrow-right"></i></a></li>
                            <li><a href="{{route('user.edit')}}">Edit Profile</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->
            
    <!-- Shop Login -->
    <section class="shop login section">
        <div class="container">
            <div class="row"> 
                <div class="col-lg-6 offset-lg-3 col-12">
                    <div class="login-form">
                    @if($user)
             
                    
               
                        <!-- Form -->
                        <form class="form" method="post" action="{{route('userEdit.submit', ['id' => $user->id])}}">
                            @csrf
                            <div class="row">
                                <div class="col-12">
                                    <div class="form-group">
                                        <label>Name: </label>
                                        <input type="name" name="name" placeholder="" required="required" value="{{$user->name}}">
                                        <input type="hidden" name="id"  value="{{$user->id}}">
                                     
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <label>Your Email</label>
                                        <input type="email" name="email" placeholder="" required="required" value="{{$user->email}}">
                                       
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <label>Photo</label>
                                        <input type="file" class="form-control-file" name="photo" value="{{$user->photo}}">
                                      
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group login-btn">
                                        <button class="btn btn-facebook" type="submit">Save</button>
                                        <!-- OR
                                        <a href="{{route('login.redirect','facebook')}}" class="btn btn-facebook"><i class="ti-facebook"></i></a>
                                        <a href="{{route('login.redirect','github')}}" class="btn btn-github"><i class="ti-github"></i></a>
                                        <a href="{{route('login.redirect','google')}}" class="btn btn-google"><i class="ti-google"></i></a> -->

                                    </div>
                                    <div class="checkbox">
                                        <label class="checkbox-inline" for="2"><input name="news" id="2" type="checkbox">Remember me</label>
                                    </div>
                                    @if (Route::has('password.request'))
                                         <a class="lost-pass" href="{{ route('password.request') }}">
                                            Lost your password?
                                        </a>
                                    @endif 
                                </div>
                            </div>
                        </form>
                        <!--/ End Form -->
                    </div>
                </div>
            </div>
        </div>
    </section> 
        
      @endif

    <!--/ End Login -->
@endsection
@push('styles')
<style>
    .shop.login .form .btn{
        margin-right:0;
    }
    .btn-facebook{
        background:#39579A;
    }
    .btn-facebook:hover{
        background:#073088 !important;
    }
    .btn-github{
        background:#444444;
        color:white;
    }
    .btn-github:hover{
        background:black !important;
    }
    .btn-google{
        background:#ea4335;
        color:white;
    }
    .btn-google:hover{
        background:rgb(243, 26, 26) !important;
    }
</style>
@endpush