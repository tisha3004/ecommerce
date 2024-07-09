<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Category;
use App\Models\Brand;
use Illuminate\Support\Str;

class ProductController extends Controller
{
     /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $products=Product::getAllProduct();
        // return $products;
        return view('backend.product.index')->with('products',$products);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $brand=Brand::get();
        $category=Category::where('is_parent',1)->get();
        // return $category;
        return view('backend.product.create')->with('categories',$category)->with('brands',$brand);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //return $request;
        try {
            $validatedData = $this->validate($request, [
                'title' => 'string|required',
                'summary' => 'string|required',
                'description' => 'string|nullable',
                'photo' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048',
                'size' => 'nullable',
                'stock' => 'required|numeric',
                'cat_id' => 'required|exists:categories,id',
                'brand_id' => 'nullable|exists:brands,id',
                'child_cat_id' => 'nullable|exists:categories,id',
                'is_featured' => 'sometimes|in:1',
                'status' => 'required|in:active,inactive',
                'condition' => 'required|in:default,new,hot',
                'price' => 'required|numeric',
                'discount' => 'nullable|numeric'
            ]);
        } catch (\Illuminate\Validation\ValidationException $e) {
            dd($e->errors());
        }

        // return $request; 
        $data = $request->all();
        $slug = Str::slug($request->title);
        $count = Product::where('slug', $slug)->count();
        if ($count > 0) {
            $slug = $slug . '-' . date('ymdis') . '-' . rand(0, 999);
        }
        $data['slug'] = $slug;
        $data['is_featured'] = $request->input('is_featured', 0);
        $size = $request->input('size');
        if ($size) {
            $data['size'] = implode(',', $size);
        } else {
            $data['size'] = '';
        }
        $status = Product::create($data);
        if ($status) {
            request()->session()->flash('success', 'Product added');
        } else {
            request()->session()->flash('error', 'Please try again!!');
        }
    
        return redirect()->route('user.product.index');
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
  /*   public function edit($id)
    {
        $brand=Brand::get();
        $product=Product::findOrFail($id);
        $category=Category::where('is_parent',1)->get();
        $items=Product::where('id',$id)->get();
        // return $items;
        return view('backend.product.edit')->with('product',$product)
                    ->with('brands',$brand)
                    ->with('categories',$category)->with('items',$items);
    }
 */
    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */

     public function addProduct(){
            $brand=Brand::get();
            $cat=Category::get();
          //  return $cat;
           return view('user.product.add')->with('brand',$brand)->with('cat',$cat);
     }

     public function editProduct($id){
        $brand=Brand::get();
        $product=Product::findOrFail($id);
        $category=Category::where('is_parent',1)->get();
        $items=Product::where('id',$id)->get();
        // return $items;
        return view('user.product.edit')->with('product',$product)
                    ->with('brands',$brand)
                    ->with('categories',$category)->with('items',$items);
    }

    public function update(Request $request, $id)
    {
        $product=Product::findOrFail($id);
        try {
            $validatedData = $this->validate($request, [
                'title' => 'string|required',
                'summary' => 'string|required',
                'description' => 'string|nullable',
                'photo' => 'nullable|string',
                'size' => 'nullable',
                'stock' => 'required|numeric',
                'cat_id' => 'required|exists:categories,id',
                'brand_id' => 'nullable|exists:brands,id',
                'child_cat_id' => 'nullable|exists:categories,id',
                'is_featured' => 'sometimes|in:1',
                'status' => 'required|in:active,inactive',
                'condition' => 'required|in:default,new,hot',
                'price' => 'required|numeric',
                'discount' => 'nullable|numeric'
            ]);
        } catch (\Illuminate\Validation\ValidationException $e) {
            dd($e->errors());
        }

        $data=$request->all();
        $data['is_featured']=$request->input('is_featured',0);
        $size = $request->input('size');
        if (is_array($size)) { 
            $data['size'] = implode(',', $size);
        } else {
            $data['size'] = ''; 
        }
    
        // return $data;
        $status=$product->fill($data)->save();
        if($status){
            request()->session()->flash('success','Product updated');
        }
        else{
            request()->session()->flash('error','Please try again!!');
        }
        return redirect()->route('user.product.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $product=Product::findOrFail($id);
        $status=$product->delete();
        
        if($status){
            request()->session()->flash('success','Product deleted');
        }
        else{
            request()->session()->flash('error','Error while deleting product');
        }
        return redirect()->route('user.product.index');
    }
}
