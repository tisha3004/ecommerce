@extends('user.layouts.master')
@section('main-content')

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-lg-10">
            <div class="card">
                <div class="card-header">
                    <h5>Blogs List</h5>
                    <a href="{{ route('user.blog.create') }}" class="btn btn-primary float-right">+ Add More Blogs</a>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Title</th>
                                    <th>Slug</th>
                                    <th>Photo</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($blogs as $blog)
                                    <tr>
                                        <td>{{ $blog->id }}</td>
                                        <td>{{ $blog->title }}</td>
                                        <td>{{ $blog->slug }}</td>
                                        <td>
                                            @if($blog->photo)
                                                <img src="{{ asset('storage/' . $blog->photo) }}" alt="{{ $blog->title }}" style="max-height: 50px;">
                                            @else
                                                No Image
                                            @endif
                                        </td>
                                        <td>
                                            <a href="{{ route('user.blog.edit', $blog->id) }}" class="btn btn-warning btn-sm">Edit</a>
                                            <form action="{{ route('user.blog.delete', $blog->id) }}" method="POST" style="display: inline-block;">
                                                @csrf
                                                @method('DELETE')
                                                <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                                            </form>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                    <!-- Pagination links -->
                    {{ $blogs->links() }}
                </div>
            </div>
        </div>
    </div>
</div>

@endsection
