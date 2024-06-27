<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Wishlist;
use App\Models\Cart;
use App\Models\User;
use Illuminate\Support\Str;
use Auth;
use Helper;

class CartController extends Controller
{
    protected $product = null;

    public function __construct(Product $product)
    {
        $this->product = $product;
    }

    protected function ensureAuthenticated()
    {
        if (!auth()->check()) {             
            return back()->with('error', 'Please log in to proceed');
        }         
        return null;   
    }

    public function addToCart(Request $request)
    {
        if ($redirect = $this->ensureAuthenticated()) {
            return $redirect;
        }

        try {
            if (empty($request->slug)) {
                return back()->with('error', 'Invalid product');
            }

            $product = Product::where('slug', $request->slug)->firstOrFail();
            $user = auth()->user();

            $alreadyInCart = Cart::where('user_id', $user->id)
                ->where('order_id', null)
                ->where('product_id', $product->id)
                ->first();

            if ($alreadyInCart) {
                $newQuantity = $alreadyInCart->quantity + 1;

                if ($product->stock < $newQuantity) {
                    return back()->with('error', 'Insufficient stock');
                }

                $alreadyInCart->quantity = $newQuantity;
                $alreadyInCart->amount = $product->price * $newQuantity;
                $alreadyInCart->save();
            } else {
                if ($product->stock < 1) {
                    return back()->with('error', 'Product out of stock');
                }

                $cart = new Cart();
                $cart->user_id = $user->id;
                $cart->product_id = $product->id;
                $cart->price = $product->price * (1 - $product->discount / 100);
                $cart->quantity = 1;
                $cart->amount = $cart->price;
                $cart->save();

                Wishlist::where('user_id', $user->id)
                    ->where('cart_id', null)
                    ->update(['cart_id' => $cart->id]);
            }

            return back()->with('success', 'Product added to cart successfully');
        } catch (\Exception $e) {
            \Log::error('Error adding product to cart: ' . $e->getMessage());
            return back()->with('error', 'An error occurred while adding the product to cart');
        }
    }
    public function singleAddToCart(Request $request)
    {
        if ($redirect = $this->ensureAuthenticated()) {
            return $redirect;
        }

        $request->validate([
            'slug' => 'required',
            'quant' => 'required',
        ]);

        $product = Product::where('slug', $request->slug)->first();
        if ($product->stock < $request->quant[1]) {
            return back()->with('error', 'Out of stock, You can add other products.');
        }
        if (($request->quant[1] < 1) || empty($product)) {
            request()->session()->flash('error', 'Invalid Products');
            return back();
        }

        $already_cart = Cart::where('user_id', auth()->user()->id)->where('order_id', null)->where('product_id', $product->id)->first();

        if ($already_cart) {
            $already_cart->quantity = $already_cart->quantity + $request->quant[1];
            $already_cart->amount = ($product->price * $request->quant[1]) + $already_cart->amount;

            if ($already_cart->product->stock < $already_cart->quantity || $already_cart->product->stock <= 0) return back()->with('error', 'Stock not sufficient!.');

            $already_cart->save();
        } else {
            $cart = new Cart;
            $cart->user_id = auth()->user()->id;
            $cart->product_id = $product->id;
            $cart->price = ($product->price - ($product->price * $product->discount) / 100);
            $cart->quantity = $request->quant[1];
            $cart->amount = ($product->price * $request->quant[1]);
            if ($cart->product->stock < $cart->quantity || $cart->product->stock <= 0) return back()->with('error', 'Stock not sufficient!.');
            $cart->save();
        }
        request()->session()->flash('success', 'Product has been added to cart.');
        return back();
    }

    public function cartDelete(Request $request)
    {
        if ($redirect = $this->ensureAuthenticated()) {
            return $redirect;
        }

        $cart = Cart::find($request->id);
        if ($cart) {
            $cart->delete();
            request()->session()->flash('success', 'Cart removed successfully');
            return back();
        }
        request()->session()->flash('error', 'Error please try again');
        return back();
    }

    public function cartUpdate(Request $request)
    {
        if ($redirect = $this->ensureAuthenticated()) {
            return $redirect;
        }

        if ($request->quant) {
            $error = array();
            $success = '';
            foreach ($request->quant as $k => $quant) {
                $id = $request->qty_id[$k];
                $cart = Cart::find($id);
                if ($quant > 0 && $cart) {
                    if ($cart->product->stock < $quant) {
                        request()->session()->flash('error', 'Out of stock');
                        return back();
                    }
                    $cart->quantity = ($cart->product->stock > $quant) ? $quant : $cart->product->stock;
                    if ($cart->product->stock <= 0) continue;
                    $after_price = ($cart->product->price - ($cart->product->price * $cart->product->discount) / 100);
                    $cart->amount = $after_price * $quant;
                    $cart->save();
                    $success = 'Cart updated successfully!';
                } else {
                    $error[] = 'Cart Invalid!';
                }
            }
            return back()->with($error)->with('success', $success);
        } else {
            return back()->with('Cart Invalid!');
        }
    }

    public function checkout(Request $request)
    {
        if ($redirect = $this->ensureAuthenticated()) {
            return $redirect;
        }

        return view('frontend.pages.checkout');
    }
}
