<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="{{ route('admin.dashboard') }}" class="brand-link">
        <img src="{{ asset('admin-assets/img/AdminLTELogo.png')}}" alt="AdminLTE Logo"
            class="brand-image img-circle elevation-3" style="opacity: .8">
        <span class="brand-text font-weight-light">Online SHOP</span>
    </a>
    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar user (optional) -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                <!-- Add icons to the links using the .nav-icon class
								with font-awesome or any other icon font library -->
                <li class="nav-item">
                    <a href="{{ route('admin.dashboard') }}" class="nav-link {{ request()->routeIs('admin.dashboard') ? 'active' : '' }}">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>Dashboard</p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="{{ route('categories.index') }}" class="nav-link {{ (request()->routeIs('categories.index') || request()->routeIs('categories.create') || request()->routeIs('categories.edit')) ? 'active' : '' }}">
                        <i class="nav-icon fas fa-file-alt"></i>
                        <p>Category</p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="{{ route('sub-categories.index') }}" class="nav-link {{ (request()->routeIs('sub-categories.index') || request()->routeIs('sub-categories.create') || request()->routeIs('sub-categories.edit')) ? 'active' : '' }}">
                        <i class="nav-icon fas fa-file-alt"></i>
                        <p>Sub Category</p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="{{ route('brands.index') }}" class="nav-link {{ (request()->routeIs('brands.index') || request()->routeIs('brands.create') || request()->routeIs('brands.edit')) ? 'active' : '' }}">
                        <svg class="h-6 nav-icon w-6 shrink-0" xmlns="http://www.w3.org/2000/svg" fill="none"
                            viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" aria-hidden="true">
                            <path stroke-linecap="round" stroke-linejoin="round"
                                d="M16 4v12l-4-2-4 2V4M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z">
                            </path>
                        </svg>
                        <p>Brands</p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="{{ route('products.index') }}" class="nav-link {{ (request()->routeIs('products.index') || request()->routeIs('products.create') || request()->routeIs('products.edit')) ? 'active' : '' }}">
                        <i class="nav-icon fas fa-tag"></i>
                        <p>Products</p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="{{ route('products.productRatings') }}" class="nav-link {{ request()->routeIs('products.productRatings') ? 'active' : '' }}">
                        <i class="nav-icon fas fa-star"></i>
                        <p>Ratings</p>
                    </a>
                </li>

                <li class="nav-item">
                    <a href="{{ route('shipping.create') }}" class="nav-link {{ request()->routeIs('shipping.create') || request()->routeIs('shipping.edit') ? 'active' : '' }}">
                        <!-- <i class="nav-icon fas fa-tag"></i> -->
                        <i class="fas fa-truck nav-icon"></i>
                        <p>Shipping</p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="{{ route('orders.index') }}" class="nav-link {{ (request()->routeIs('orders.index') || request()->routeIs('orders.detail')) ? 'active' : '' }}">
                        <i class="nav-icon fas fa-shopping-bag"></i>
                        <p>Orders</p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="{{ route('coupons.index') }}" class="nav-link {{ (request()->routeIs('coupons.index') || request()->routeIs('coupons.create') || request()->routeIs('coupons.edit')) ? 'active' : '' }}">
                        <i class="nav-icon  fa fa-percent" aria-hidden="true"></i>
                        <p>Discount</p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="{{ route('users.index') }}" class="nav-link {{ (request()->routeIs('users.index') || request()->routeIs('users.create') || request()->routeIs('users.edit')) ? 'active' : '' }}">
                        <i class="nav-icon  fas fa-users"></i>
                        <p>Users</p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="{{ route('contact.index') }}" class="nav-link {{ request()->routeIs('contact.index') ? 'active' : '' }}">
                        <i class="nav-icon fa fa-comment"></i>
                        <p>User Query</p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="{{ route('pages.index') }}" class="nav-link {{ (request()->routeIs('pages.index') || request()->routeIs('pages.create') || request()->routeIs('pages.edit')) ? 'active' : '' }}">
                        <i class="nav-icon  far fa-file-alt"></i>
                        <p>Pages</p>
                    </a>
                </li>
            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>