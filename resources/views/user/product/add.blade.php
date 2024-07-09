@extends('user.layouts.master')

@section('main-content')
 <!-- DataTales Example -->
 
 <div class="container mt-5">
    <h2 class="mb-4">Add a New Product</h2>
    <form method="post" action="{{route('user.product.add')}}" enctype="multipart/form-data">
    <input type="hidden" name="_token" value="<?php echo csrf_token(); ?>">

      <div class="form-group">
        <label for="title">Title</label>
        <input type="text" class="form-control" name="title" placeholder="Enter title">
      </div>
      
      <div class="form-group">
        <label for="slug">Slug</label>
        <input type="text" class="form-control" name="slug" placeholder="Enter slug">
      </div>
      <div class="form-group">
        <label for="summary">Summary</label>
        <textarea class="form-control" name="summary" rows="3" placeholder="Enter summary"></textarea>
      </div>
      <div class="form-group">
        <label for="description">Description</label>
        <textarea class="form-control" name="description" rows="3" placeholder="Enter Description"></textarea>
      </div>
      <div class="form-group">
        <label for="stock">Stock</label>
      <input type="number" class="form-control" name="stock" placeholder="Enter Stock Available">
      </div>
      <div class="form-group">
        <label for="quote">Size</label>
        <input type="text" class="form-control" name="quote" placeholder="Enter size">
      </div>
      <div class="form-group">
        <label for="photo">Photo</label>
        <input type="file" class="form-control-file" name="photo">
      </div>
      <div class="form-group">
        <label for="tags">Price</label>
        <input type="number" class="form-control" name="price" placeholder="Enter price">
      </div>

      <div class="form-group">
        <label for="discount">Discount</label>
        <input type="number" class="form-control" name="discount" placeholder="Enter discount">
      </div>
      <div class="form-group">
        <label for="post_category_name">Condition</label>
        <select class="form-control" name="condition">
          <option value="" selected disabled>Select category</option>
          <option value="default">Default</option>
          <option value="new">New</option>
          <option value="hot">Hot</option>
        </select>
      </div>
      <div class="form-group">
        <label for="post_category_name">category</label>
        <select class="form-control" name="cat_id">
          <option value="" selected disabled>Select category</option>
          @if ($cat)
          @foreach($cat as $cats)
          <option value="{{$cats->id}}" >{{ $cats->title }}</option>
          @endforeach
          @endif
        </select>
      </div>
      <div class="form-group">
        <label for="post_category_name">Child Category</label>
        <select class="form-control" name="childCategory">
          <option value="" selected disabled>Select Child category</option>
          @if ($cat)
          @foreach($cat as $cats)
          <option value="{{ $cats->id }}" >{{ $cats->title }}</option>
          @endforeach
         @endif
        </select>
      </div>
      <div class="form-group">
        <label for="post_category_name">brands</label>
        <select class="form-control" name="brand">
          <option value="" selected disabled>Select brands</option>
          @if ($brand)
          @foreach($brand as $brands)
          <option value="{{ $brands->id }}" >{{ $brands->title }}</option>
          @endforeach
         @endif
        </select>
      </div>
      <div class="form-group">
        <label for="post_tag_id">Is featured</label>
        <select class="form-control" name="post_tag_id">
          <option value="" selected disabled>Select</option>
          <option value="1">Yes</option>
          <option value="0">No</option>
         

        </select>
      </div>
      <div class="form-group">
        <label>Status</label>
        <div class="form-check">
          <input class="form-check-input" type="radio" name="status" id="active" value="active">
          <label class="form-check-label" for="active">
            Active
          </label>
        </div>
        <div class="form-check">
          <input class="form-check-input" type="radio" name="status" id="inactive" value="inactive">
          <label class="form-check-label" for="inactive">
            Inactive
          </label>
        </div>
      </div>
      <button type="submit" class="btn btn-primary">Submit</button>
    </form>
  </div>
  @endsection

@push('styles')
<link href="{{asset('backend/vendor/datatables/dataTables.bootstrap4.min.css')}}" rel="stylesheet">
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
  <style>
      div.dataTables_wrapper div.dataTables_paginate{
          display: none;
      }
  </style>
@endpush

@push('scripts')

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
@endpush
