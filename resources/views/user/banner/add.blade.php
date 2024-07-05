@extends('user.layouts.master')

@section('main-content')
 <!-- DataTales Example -->
 
 <div class="container mt-5">
    <h2 class="mb-4">Create a New Post</h2>
    <form method="POST" action="{{route('user.blog.store')}}" enctype="multipart/form-data">
      <!-- CSRF Token if using a framework like Laravel -->
      <input type="hidden" name="_token" value="<?php echo csrf_token(); ?>">

      <div class="form-group">
        <label for="title">Title</label>
        <input type="text" class="form-control" id="title" name="title" placeholder="Enter title" required>
      </div>
      <div class="form-group">
        <label for="slug">Slug</label>
        <input type="text" class="form-control" id="slug" name="slug" placeholder="Enter slug" required>
      </div>
      <div class="form-group">
        <label for="summary">Summary</label>
        <textarea class="form-control" id="summary" name="summary" rows="3" placeholder="Enter summary" required></textarea>
      </div>
      <div class="form-group">
        <label for="description">Description</label>
        <textarea class="form-control" id="description" name="description" rows="5" placeholder="Enter description" required></textarea>
      </div>
      <div class="form-group">
        <label for="quote">Quote</label>
        <input type="text" class="form-control" id="quote" name="quote" placeholder="Enter quote" required>
      </div>
      <div class="form-group">
        <label for="photo">Photo</label>
        <input type="file" class="form-control-file" id="photo" name="photo" required>
      </div>
      <div class="form-group">
        <label for="tags">Tags</label>
        <input type="text" class="form-control" id="tags" name="tags" placeholder="Enter tags" required>
      </div>
      <div class="form-group">
        <label for="post_category_id">Post Category</label>
        <select class="form-control" id="post_category_id" name="post_category_id" required>
          <option value="" selected disabled>Select category</option>
          <option value="1">Category 1</option>
          <option value="2">Category 2</option>
          <option value="3">Category 3</option>
          <!-- Add more categories as needed -->
        </select>
      </div>
      <div class="form-group">
        <label for="post_tag_id">Post Tag</label>
        <select class="form-control" id="post_tag_id" name="post_tag_id" required>
          <option value="" selected disabled>Select tag</option>
          <option value="1">Tag 1</option>
          <option value="2">Tag 2</option>
          <option value="3">Tag 3</option>
          <!-- Add more tags as needed -->
        </select>
      </div>
      <div class="form-group">
        <label>Status</label>
        <div class="form-check">
          <input class="form-check-input" type="radio" name="status" id="active" value="active" required>
          <label class="form-check-label" for="active">
            Active
          </label>
        </div>
        <div class="form-check">
          <input class="form-check-input" type="radio" name="status" id="inactive" value="inactive" required>
          <label class="form-check-label" for="inactive">
            Inactive
          </label>
        </div>
      </div>
      <button type="submit" class="btn btn-primary">Submit</button>
    </form>
  </div>
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
