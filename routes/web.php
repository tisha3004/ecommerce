<?php

use Illuminate\Support\Facades\Route;
use UniSharp\LaravelFilemanager\Lfm;
use App\Http\Controllers\FrontendController;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\Auth\ForgotPasswordController;
use App\Http\Controllers\Auth\ResetPasswordController;
use App\Http\Controllers\MessageController;
use App\Http\Controllers\CartController;
use App\Http\Controllers\WishlistController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\PayPalController;
use App\Http\Controllers\ProductReviewController;
use App\Http\Controllers\PostCommentController;
use App\Http\Controllers\CouponController;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\UsersController;
use App\Http\Controllers\BannerController;
use App\Http\Controllers\BrandController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\PostCategoryController;
use App\Http\Controllers\PostTagController;
use App\Http\Controllers\PostController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\ShippingController;
use App\Http\Controllers\NotificationController;
use App\Http\Controllers\HomeController;
use App\Http\Middleware\CheckUserSession;



/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Auth::routes(['register' => false]);

Route::get('user/login', [FrontendController::class, 'login'])->name('login.form');
Route::post('user/login', [FrontendController::class, 'loginSubmit'])->name('login.submit');
Route::get('user/logout', [FrontendController::class, 'logout'])->name('user.logout');

Route::get('user/register', [FrontendController::class, 'register'])->name('register.form');
Route::post('user/register', [FrontendController::class, 'registerSubmit'])->name('register.submit');

// Reset password route
Route::get('password/reset', [ForgotPasswordController::class, 'showLinkRequestForm'])->name('password.request');
Route::post('password/email', [ForgotPasswordController::class, 'sendResetLinkEmail'])->name('password.email');
Route::get('password/reset/{token}', [ResetPasswordController::class, 'showResetForm'])->name('password.reset');
Route::post('password/reset', [ResetPasswordController::class, 'reset'])->name('password.update');

// Socialite
Route::get('login/{provider}/', [LoginController::class, 'redirect'])->name('login.redirect');
Route::get('login/{provider}/callback/', [LoginController::class, 'Callback'])->name('login.callback');

Route::get('/', [FrontendController::class, 'home'])->name('home1');
Route::get('/home', [FrontendController::class, 'index']);

// Frontend Routes
Route::get('/about-us', [FrontendController::class, 'aboutUs'])->name('about-us');
Route::get('/contact', [FrontendController::class, 'contact'])->name('contact');
Route::post('/contact/message', [MessageController::class, 'store'])->name('contact.store');
Route::get('product-detail/{slug}', [FrontendController::class, 'productDetail'])->name('product-detail');
Route::post('/product/search', [FrontendController::class, 'productSearch'])->name('product.search');
Route::get('/product-cat/{slug}', [FrontendController::class, 'productCat'])->name('product-cat');
Route::get('/product-sub-cat/{slug}/{sub_slug}', [FrontendController::class, 'productSubCat'])->name('product-sub-cat');
Route::get('/product-brand/{slug}', [FrontendController::class, 'productBrand'])->name('product-brand');

// Cart section
Route::get('/add-to-cart/{slug}', [CartController::class, 'addToCart'])->name('add-to-cart')->middleware(CheckUserSession::class);
Route::post('/add-to-cart', [CartController::class, 'singleAddToCart'])->name('single-add-to-cart')->middleware(CheckUserSession::class);
Route::get('cart-delete/{id}', [CartController::class, 'cartDelete'])->name('cart-delete');
Route::post('cart-update', [CartController::class, 'cartUpdate'])->name('cart.update');

Route::get('/cart', function () {
    return view('frontend.pages.cart');
})->name('cart');

Route::get('/checkout', [CartController::class, 'checkout'])->name('checkout')->middleware(CheckUserSession::class);

// Wishlist
Route::get('/wishlist', function () {
    return view('frontend.pages.wishlist');
})->name('wishlist');
Route::get('/wishlist/{slug}', [WishlistController::class, 'wishlist'])->name('add-to-wishlist')->middleware(CheckUserSession::class);
Route::get('wishlist-delete/{id}', [WishlistController::class, 'wishlistDelete'])->name('wishlist-delete');

Route::post('cart/order', [OrderController::class, 'store'])->name('cart.order');
Route::get('order/pdf/{id}', [OrderController::class, 'pdf'])->name('order.pdf');
Route::get('/income', [OrderController::class, 'incomeChart'])->name('product.order.income');

Route::get('/product-grids', [FrontendController::class, 'productGrids'])->name('product-grids');
Route::get('/product-lists', [FrontendController::class, 'productLists'])->name('product-lists');
Route::match(['get', 'post'], '/filter', [FrontendController::class, 'productFilter'])->name('shop.filter');

// Order Track
Route::get('/product/track', [OrderController::class, 'orderTrack'])->name('order.track');
Route::post('product/track/order', [OrderController::class, 'productTrackOrder'])->name('product.track.order');


//edit profile
Route::get('/user/edit', [FrontendController::class, 'editUser'])->name('user.edit');
Route::post('/user/edit/{id}', [FrontendController::class, 'editUserSubmit'])->name('userEdit.submit');


// Blog
Route::get('/blog', [FrontendController::class, 'blog'])->name('blog');
Route::get('/blog-detail/{slug}', [FrontendController::class, 'blogDetail'])->name('blog.detail');
Route::get('/blog/search', [FrontendController::class, 'blogSearch'])->name('blog.search');
Route::post('/blog/filter', [FrontendController::class, 'blogFilter'])->name('blog.filter');
Route::get('blog-cat/{slug}', [FrontendController::class, 'blogByCategory'])->name('blog.category');
Route::get('blog-tag/{slug}', [FrontendController::class, 'blogByTag'])->name('blog.tag');

// Newsletter
Route::post('/subscribe', [FrontendController::class, 'subscribe'])->name('subscribe');

// Product Review
Route::resource('/review', ProductReviewController::class);
Route::post('product/{slug}/review', [ProductReviewController::class, 'store'])->name('review.store');

// Post Comment
Route::post('post/{slug}/comment', [PostCommentController::class, 'store'])->name('post-comment.store');
Route::resource('/comment', PostCommentController::class);

// Coupon
Route::post('/coupon-store', [CouponController::class, 'couponStore'])->name('coupon-store');

// Payment
Route::get('payment', [PayPalController::class, 'payment'])->name('payment');
Route::get('cancel', [PayPalController::class, 'cancel'])->name('payment.cancel');
Route::get('payment/success', [PayPalController::class, 'success'])->name('payment.success');

// File manager
Route::group(['prefix' => 'laravel-filemanager', 'middleware' => ['web', 'auth']], function () {
    Lfm::routes();
});

// Backend section start
Route::group(['prefix' => 'user'], /* 'middleware' => [CheckUserSession::class]], */ function () {
     Route::get('/', [HomeController::class, 'index'])->name('user');
    Route::get('/profile', [HomeController::class, 'profile'])->name('user-profile');
    Route::post('/profile/{id}', [HomeController::class, 'profileUpdate'])->name('user-profile-update');
    Route::get('/order', [HomeController::class, 'orderIndex'])->name('user.order.index');
    Route::get('/user', [UsersController::class, 'index'])->name('user.noOfUser.index');
    Route::get('/banner', [HomeController::class, 'bannerIndex'])->name('user.banner.index');
    Route::get('/blog', [HomeController::class, 'blogIndex'])->name('user.blog.index');
    Route::get('/edit-blog/{id}', [PostController::class, 'edit'])->name('blog.edit');
    Route::post('/update-blog', [PostController::class, 'store'])->name('user.blog.edit');
    Route::get('/add-blog', [HomeController::class, 'addBlog'])->name('user.blog.add');
    Route::post('/add-blog', [PostController::class, 'store'])->name('user.blog.store');
    Route::get('/add-banner', [HomeController::class, 'addBanner'])->name('user.banner.add');
    Route::post('/add-banner', [BannerController::class, 'store'])->name('user.banner.store');
    Route::get('/edit-banner/{id}', [BannerController::class, 'edit'])->name('user.banner.edit');
    Route::post('/edit-banner/{id}', [BannerController::class, 'store'])->name('user.banner.update');
    Route::get('/products', [HomeController::class, 'productIndex'])->name('user.product.index');
    Route::get('/payment', [HomeController::class, 'paymentIndex'])->name('user.payment.index');
    Route::get('/payment-detail/{id}',[HomeController::class,'paymentDetail'])->name('payment.detail');
    Route::post('/payment', [HomeController::class, 'paymentIndex'])->name('user.payment.index1');


    Route::get('/category', [CategoryController::class, 'index'])->name('user.category.index');
    Route::get('/edit-category/{id}', [PostController::class, 'edit'])->name('category.edit');
    Route::post('/update-category', [PostController::class, 'store'])->name('user.category.edit');
    Route::get('/add-category', [HomeController::class, 'addcategory'])->name('user.category.add');
    Route::post('/add-category', [PostController::class, 'store'])->name('user.category.store');
    Route::get('/add-product', [ProductController::class, 'addProduct'])->name('user.product.add');
    Route::get('/edit-product/{id}', [ProductController::class, 'editProduct'])->name('user.product.edit1');
    Route::post('/edit-product/{id}', [ProductController::class, 'update'])->name('user.product.edit');
    Route::delete('/delete-product/{id}', [ProductController::class, 'destroy'])->name('user.product.delete');
    Route::post('/add-product', [ProductController::class, 'store'])->name('user.product.store');
    Route::get('/order/show/{id}', [HomeController::class, 'orderShow'])->name('user.order.show');
    Route::get('/user/show/{id}', [UsersController::class, 'edit'])->name('user.show');
    Route::post('/user/show/{id}', [UsersController::class, 'update'])->name('users.update');
    Route::delete('/delete/{id}', [HomeController::class, 'userDelete'])->name('user.delete');
    Route::delete('/order/delete/{id}', [HomeController::class, 'userOrderDelete'])->name('user.order.delete');
    Route::get('/user-review', [HomeController::class, 'productReviewIndex'])->name('user.productreview.index');
    Route::delete('/user-review/delete/{id}', [HomeController::class, 'productReviewDelete'])->name('user.productreview.delete');
    Route::get('/user-review/edit/{id}', [HomeController::class, 'productReviewEdit'])->name('user.productreview.edit');
    Route::patch('/user-review/update/{id}', [HomeController::class, 'productReviewUpdate'])->name('user.productreview.update');
    Route::get('user-post/comment', [HomeController::class, 'userComment'])->name('comment.index');
    Route::delete('user-post/comment/delete/{id}', [HomeController::class, 'userCommentDelete'])->name('user.post-comment.delete');
    Route::get('user-post/comment/edit/{id}', [HomeController::class, 'userCommentEdit'])->name('user.post-comment.edit');
    Route::patch('user-post/comment/update/{id}', [HomeController::class, 'userCommentUpdate'])->name('user.post-comment.update');
    Route::get('change-password', [HomeController::class, 'changePassword'])->name('user.change.password.form');
    Route::post('change-password', [HomeController::class, 'changPasswordStore'])->name('change.password'); 
});

// File manager
Route::group(['prefix' => 'laravel-filemanager', 'middleware' => ['web', 'auth']], function () {
    Lfm::routes();
});

Auth::routes();

Route::get('/home', [HomeController::class, 'index'])->name('home');
