<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Models\Post;
use App\Models\PostCategory;
use App\Models\PostTag;
use App\Models\User;

class PostController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $posts=Post::getAllPost();
        // return $posts;
        return view('backend.post.index')->with('posts',$posts);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $categories=PostCategory::get();
        $tags=PostTag::get();
        $users=User::get();
        return view('backend.post.create')->with('users',$users)->with('categories',$categories)->with('tags',$tags);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
       // return $request->all();
        $request->validate([
            'title' => 'required|max:255',
            'slug' => 'required|unique:posts,slug',
            'summary' => 'required',
            'description' => 'required',
            'quote' => 'nullable',
            'photo' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048', 
            'tags' => 'nullable|string',
            'post_category_id' => 'required|exists:post_categories,id',
            'post_tag_id' => 'nullable|exists:post_tags,id',
            'status' => 'required',
        ]);
        /* return "data validated"; */
        // Handle photo upload if provided
        $photoPath = null;
        if ($request->hasFile('photo')) {
            $photoPath = $request->file('photo')->store('/storage/blogs', 'public');
            $photoUrl = str_replace('public', 'storage', $photoPath);
        }

        // Create the post
        $post = new Post();
        $post->title = $request->title;
        $post->slug = $request->slug;
        $post->summary = $request->summary;
        $post->description = $request->description;
        $post->quote = $request->quote;
        if ($request->hasFile('photo')) {
            /* $photoPath = $request->file('photo')->store('/storage/blogs', 'public');
            $photoUrl = str_replace('public', 'storage', $photoPath); */
            $post->photo = $request->photo;
        }
      
        $post->tags = $request->tags;
        $post->post_cat_id = $request->post_category_id;
        $post->post_tag_id = $request->post_tag_id;
        $post->status = $request->status;
        $post->save();

        return redirect()->route('user.blog.index')->with('success', 'Post created successfully.');
 
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $post=Post::findOrFail($id);
        $categories=PostCategory::get();
        $tags=PostTag::get();
        $users=User::get();
        return view('user.blog.edit')->with('categories',$categories)->with('users',$users)->with('tags',$tags)->with('post',$post);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
    $post = Post::findOrFail($id);

    // Validate the request
    $request->validate([
        'title' => 'required|string|max:255',
        'quote' => 'nullable|string',
        'summary' => 'required|string',
        'description' => 'nullable|string',
        'post_cat_id' => 'required|integer',
        'tags' => 'nullable|array',
        'photo' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        'status' => 'required|in:active,inactive',
    ]);

    // Handle file upload
    if ($request->hasFile('photo')) {
        // Delete old photo if exists
        if ($post->photo) {
            Storage::delete( $post->photo);
        }
        $photoPath = $request->file('photo')->store('public/blogs');
        $post->photo = str_replace( $photoPath);
    }

    // Update post
    $post->title = $request->title;
    $post->quote = $request->quote;
    $post->summary = $request->summary;
    $post->description = $request->description;
    $post->post_cat_id = $request->post_cat_id;
    $post->tags = implode(',', $request->tags);
    $post->added_by = $request->added_by;
    $post->status = $request->status;

    $post->save();

    return redirect()->route('user.blog.index')->with('success', 'Post updated successfully.');
}

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $post=Post::findOrFail($id);
       
        $status=$post->delete();
        
        if($status){
            request()->session()->flash('success','Post deleted');
        }
        else{
            request()->session()->flash('error','Error while deleting post ');
        }
        return redirect()->route('user.blog.index');
    }
}
