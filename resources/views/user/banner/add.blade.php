@extends('user.layouts.master')

@section('main-content')
 <!-- DataTales Example -->
 
 <div class="container mt-5">
    <h2 class="mb-4">Create a New Banner</h2>
    <form method="post" action="{{route('user.banner.store')}}" enctype="multipart/form-data">
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
        <label for="description">Description</label>
        <textarea class="form-control" name="description" rows="5" placeholder="Enter description"></textarea>
      </div>
     
      <div class="form-group">
        <label for="photo">Photo</label>
        <input type="file" class="form-control-file" name="photo">
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
