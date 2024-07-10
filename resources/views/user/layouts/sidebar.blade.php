<ul class="navbar-nav bg-gradient-secondary sidebar sidebar-dark accordion" id="accordionSidebar">

    <!-- Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="{{route('user')}}">
      <div class="sidebar-brand-icon rotate-n-15">
        <i class="fas fa-laugh-wink"></i>
      </div>
      <div class="sidebar-brand-text mx-3">User</div>
    </a>

    <!-- Divider -->
    <hr class="sidebar-divider my-0">

    <!-- Nav Item - Dashboard -->
    <li class="nav-item active">
      <a class="nav-link" href="{{route('user')}}">
        <i class="fas fa-fw fa-tachometer-alt"></i>
        <span>Dashboard</span></a>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider">

        <!-- Heading -->
        <div class="sidebar-heading">
            Shop
        </div>
    <!--Orders -->
    <li class="nav-item">
        <a class="nav-link" href="{{route('user.order.index')}}">
            <i class="fas fa-box"></i>
            <span>Orders</span>
        </a>
    </li>
     <!--Users -->
     <li class="nav-item">
        <a class="nav-link" href="{{route('user.noOfUser.index')}}">
            <i class="fas fa-users fa-chart-area"></i>
            <span>Users</span>
        </a>
    </li>
      <!--Banners -->
      <li class="nav-item">
        <a class="nav-link" href="{{route('user.banner.index')}}">
            <i class="fas fa-image"></i>
            <span>Banners</span>
        </a>
    </li>
      <!--Banners -->
      <li class="nav-item">
        <a class="nav-link" href="{{route('user.blog.index')}}">
            <i class="fas fa-blog"></i>
            <span>Blogs</span>
        </a>
    </li>
    <!-- Reviews -->
    <li class="nav-item">
        <a class="nav-link" href="{{route('user.productreview.index')}}">
            <i class="fas fa-comments"></i>
            <span>Reviews</span></a>
    </li>
     <!-- Categories -->
     <li class="nav-item">
        <a class="nav-link" href="{{route('user.category.index')}}">
            <i class="fas fa-credit-card"></i>
            <span>Categories</span></a>
    </li>
    <!-- Product -->
    <li class="nav-item">
        <a class="nav-link" href="{{route('user.product.index')}}">
            <i class="fas fa-box-open"></i>
            <span>Products</span></a>
    </li>
      <!-- Coupons -->
      <li class="nav-item">
        <a class="nav-link" href="{{route('user.coupon.index')}}">
            <i class="fas fa-box-open"></i>
            <span>Coupons</span></a>
    </li>
      <!-- Payment -->
      <li class="nav-item">
        <a class="nav-link" href="{{route('user.payment.index')}}">
            <i class="fas fa-credit-card"></i>
            <span>Payment</span></a>
    </li>


    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- Heading -->
    <div class="sidebar-heading">
      Posts
    </div>
    <!-- Comments -->
    <li class="nav-item">
      <a class="nav-link" href="{{route('comment.index')}}">
          <i class="fas fa-comments fa-chart-area"></i>
          <span>Comments</span>
      </a>
    </li>
    <!-- Sidebar Toggler (Sidebar) -->
    <div class="text-center d-none d-md-inline">
      <button class="rounded-circle border-0" id="sidebarToggle"></button>
    </div>

</ul>