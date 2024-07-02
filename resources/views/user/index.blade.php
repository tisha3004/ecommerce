@extends('user.layouts.master')

@section('main-content')
<div class="container-fluid">
    @include('user.layouts.notification')
    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
      <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
    </div>

    <div class="container">
        <h2>Admin Dashboard</h2>
        <div class="row">
            <!-- Total Orders -->
             
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="card bg-primary text-white shadow">
                    <div class="card-body">
                    <a href="{{route('user.product.index')}}">
                        <div class="row">
                            <div class="col">
                                <div class="text-xs font-weight-bold text-uppercase mb-1 text-white ">Total Orders</div>
                                <div class="h5 mb-0 font-weight-bold text-white ">{{ $totalOrders }}</div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-shopping-cart fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </a>
                    </div>
                </div>
            </div>
            <!-- Total Orders -->
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="card bg-primary text-white shadow">
                    <div class="card-body">
                    <a href="{{route('user.noOfUser.index')}}">
                        <div class="row">
                            <div class="col">
                                <div class="text-xs font-weight-bold text-uppercase mb-1 text-white ">Total Users</div>
                                <div class="h5 mb-0 font-weight-bold text-white ">{{ $totalUsers }}</div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-user fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </a>
                    </div>
                </div>
            </div>
            <!-- Total Revenue -->
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="card bg-success text-white shadow">
                    <div class="card-body">
                    <a href="{{route('user.payment.index')}}">
                        <div class="row">
                            <div class="col">
                                <div class="text-xs font-weight-bold text-uppercase mb-1 text-white ">Total Revenue</div>
                                <div class="h5 mb-0 font-weight-bold text-white ">${{ number_format($totalRevenue, 2) }}</div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </a>
                    </div>
                </div>
            </div>

            <div class="row">
            <!-- Monthly Sales Chart -->
            <div class="col-lg-6 col-md-12 mb-4">
                <div class="card shadow">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Monthly Sales</h6>
                    </div>
                    <div class="card-body">
                        <canvas id="monthlySalesChart"></canvas>
                    </div>
                </div>
            </div>

            <!-- Monthly Revenue Bar Chart -->
            <div class="col-lg-6 col-md-12 mb-4">
                <div class="card shadow">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Monthly Revenue</h6>
                    </div>
                    <div class="card-body">
                        <canvas id="monthlyRevenueChart"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>


@endsection

@push('scripts')
<!-- Include Chart.js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const ctx = document.getElementById('monthlySalesChart').getContext('2d');
        const monthlySalesChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: [
                    @foreach(range(1, 12) as $month)
                        "{{ date('F', mktime(0, 0, 0, $month, 1)) }}",
                    @endforeach
                ],
                datasets: [{
                    label: 'Sales',
                    data: [
                        @foreach(range(1, 12) as $month)
                            {{ $monthlySales->get($month, 0) }},
                        @endforeach
                    ],
                    borderColor: 'rgba(75, 192, 192, 1)',
                    backgroundColor: 'rgba(75, 192, 192, 0.2)',
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
        const ctx1 = document.getElementById('monthlyRevenueChart').getContext('2d');
            const monthlyRevenueChart = new Chart(ctx1, {
                type: 'bar',  // Change to 'bar' for bar graph
                data: {
                    labels: [
                        @foreach(range(1, 12) as $month)
                            "{{ date('F', mktime(0, 0, 0, $month, 1)) }}",
                        @endforeach
                    ],
                    datasets: [{
                        label: 'Revenue',
                        data: [
                            @foreach(range(1, 12) as $month)
                                {{ $monthlySales->get($month, 0) }},
                            @endforeach
                        ],
                        backgroundColor: 'rgba(75, 192, 192, 0.2)',
                        borderColor: 'rgba(75, 192, 192, 1)',
                        borderWidth: 1
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
    });
</script>

@endpush