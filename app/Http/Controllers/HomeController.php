<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Order;
use App\Models\Product;
use App\Models\Post;
use App\Models\Banner;
use App\Models\ProductReview;
use App\Models\PostComment;
use App\Rules\MatchOldPassword;
use Carbon\Carbon;
use Hash;

class HomeController extends Controller
{
    
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */


    public function index(){
           $totalOrders = Order::count();
           $totalUsers = User::count();
        $totalRevenue = Order::where('status', 'delivered')->sum('total_amount');
        $monthlySales = Order::where('status', 'delivered')
            ->whereYear('created_at', Carbon::now()->year)
            ->selectRaw('MONTH(created_at) as month, SUM(total_amount) as total')
            ->groupBy('month')
            ->get()
            ->pluck('total', 'month');

        return view('user.index', compact('totalOrders', 'totalRevenue', 'monthlySales','totalUsers'));
    }


    public function profile(){
        $profile=Auth()->user();
        // return $profile;
        return view('user.users.profile')->with('profile',$profile);
    }

    public function profileUpdate(Request $request,$id){
        // return $request->all();
        $user=User::findOrFail($id);
        $data=$request->all();
        $status=$user->fill($data)->save();
        if($status){
            request()->session()->flash('success','Successfully updated your profile');
        }
        else{
            request()->session()->flash('error','Please try again!');
        }
        return redirect()->back();
    }

    // Order
    public function orderIndex(){
        $orders=Order::orderBy('id','DESC')->paginate(10);
        return view('user.order.index')->with('orders',$orders);
    }
    public function orderUser(){
        $user=User::orderBy('id','DESC')->paginate(10);
        return view('user.noOfUser.index')->with('Users',$user);
    }

    public function paymentIndex(){
        $payment=Order::orderBy('id','DESC')->paginate(10);
        return view('user.payment.index')->with('payment',$payment);
    }

    public function bannerIndex(){
        $banner=Banner::orderBy('id','DESC')->paginate(10);
        //return $banner;
       return view('user.banner.index')->with('Banners',$banner);
    }


    public function addBlog(){
        return view('user.blog.add');   
    } 
    public function storeBlog(){
        return view('user.banner.add');   
    } 


    public function addBanner(){
        return view('user.banner.add');   
    } 
    

    public function blogIndex(){
        $blog=Post::orderBy('id','DESC')->paginate(10);
      //  return $blog;
       return view('user.blog.index')->with('Blogs',$blog);
    }

    public function storeBanner(Request $request){
        return $request;
    }
    public function userOrderDelete($id)
    {
        $order=Order::find($id);
        if($order){
           if($order->status=="process" || $order->status=='delivered' || $order->status=='cancel'){
                return redirect()->back()->with('error','You can not delete this order now');
           }
           else{
                $status=$order->delete();
                if($status){
                    request()->session()->flash('success','Order Successfully deleted');
                }
                else{
                    request()->session()->flash('error','Order can not deleted');
                }
                return redirect()->route('user.order.index');
           }
        }
        else{
            request()->session()->flash('error','Order can not found');
            return redirect()->back();
        }
    }
    public function userDelete($id)
    {
        $user=User::find($id);
        if($user){
                $status=$user->delete();
                if($status){
                    request()->session()->flash('success','User Successfully deleted');
                }
                else{
                    request()->session()->flash('error','User can not deleted');
                }
                return redirect()->back();
        }
        else{
            request()->session()->flash('error','User can not found');
            return redirect()->back();
        }
    }
    public function userShow($id)
    {
        $user=User::find($id);
        //return $user;
        return view('user.noOfUser.show')->with('User',$user);
    }
    public function orderShow($id)
    {
        $order=Order::find($id);
        // return $order;
        return view('user.order.show')->with('order',$order);
    }
    // Product Review
    public function productReviewIndex(){
        $reviews=ProductReview::orderBy('id','DESC')->paginate(10);
      //  return $reviews;
        return view('user.review.index')->with('reviews',$reviews);
    }

    public function productIndex(){
        $product=Product::orderBy('id')->paginate(10);
       // return $product;
       return view('user.product.index')->with('products',$product);
    }

    public function productReviewEdit($id)
    {
        $review=ProductReview::find($id);
        // return $review;
        return view('user.review.edit')->with('review',$review);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function productReviewUpdate(Request $request, $id)
    {
        $review=ProductReview::find($id);
        if($review){
            $data=$request->all();
            $status=$review->fill($data)->update();
            if($status){
                request()->session()->flash('success','Review updated');
            }
            else{
                request()->session()->flash('error','Something went wrong! Please try again!!');
            }
        }
        else{
            request()->session()->flash('error','Review not found!!');
        }

        return redirect()->route('user.productreview.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function productReviewDelete($id)
    {
        $review=ProductReview::find($id);
        $status=$review->delete();
        if($status){
            request()->session()->flash('success','Review deleted');
        }
        else{
            request()->session()->flash('error','Something went wrong! Try again');
        }
        return redirect()->route('user.productreview.index');
    }

    public function userComment()
    {
        $comments=PostComment::getAllUserComments();
        return view('user.comment.index')->with('comments',$comments);
    }
    public function userCommentDelete($id){
        $comment=PostComment::find($id);
        if($comment){
            $status=$comment->delete();
            if($status){
                request()->session()->flash('success','Post Comment deleted');
            }
            else{
                request()->session()->flash('error','Error occurred please try again');
            }
            return back();
        }
        else{
            request()->session()->flash('error','Post Comment not found');
            return redirect()->back();
        }
    }
    public function userCommentEdit($id)
    {
        $comments=PostComment::find($id);
        if($comments){
            return view('user.comment.edit')->with('comment',$comments);
        }
        else{
            request()->session()->flash('error','Comment not found');
            return redirect()->back();
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function userCommentUpdate(Request $request, $id)
    {
        $comment=PostComment::find($id);
        if($comment){
            $data=$request->all();
            // return $data;
            $status=$comment->fill($data)->update();
            if($status){
                request()->session()->flash('success','Comment updated');
            }
            else{
                request()->session()->flash('error','Something went wrong! Please try again!!');
            }
            return redirect()->route('user.post-comment.index');
        }
        else{
            request()->session()->flash('error','Comment not found');
            return redirect()->back();
        }

    }

    public function changePassword(){
        return view('user.layouts.userPasswordChange');
    }
    public function changPasswordStore(Request $request)
    {
        $request->validate([
            'current_password' => ['required', new MatchOldPassword],
            'new_password' => ['required'],
            'new_confirm_password' => ['same:new_password'],
        ]);
   
        User::find(auth()->user()->id)->update(['password'=> Hash::make($request->new_password)]);
   
        return redirect()->route('user')->with('success','Password changed successfully');
    }

    

}
