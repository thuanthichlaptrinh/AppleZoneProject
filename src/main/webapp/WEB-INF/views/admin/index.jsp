<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<style>
        header { display: none }
        footer { display: none }
        .dashboard {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }
        .stat-card {
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .stat-card i {
            font-size: 2.5rem;
            color: #fff;
            padding: 15px;
            border-radius: 50%;
        }
        .stat-card .info h3 {
            margin: 0;
            font-size: 1.5rem;
            color: #333;
        }
        .stat-card .info p {
            margin: 5px 0 0;
            color: #777;
        }
        .chart-container {
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            margin-bottom: 20px;
        }
        canvas {
            max-width: 500px;
            max-height: 400px;
        }
    </style>
  
        <!-- MAIN -->
        <main>
            <h1 class="title">Thống kê</h1>
            <ul class="breadcrumbs" style="margin-bottom: 16px">
                <li><a href="<c:url value='/quan-tri'/>">Home</a></li>
                <li class="divider">/</li>
                <li><a href="#" class="active">Thống kê</a></li>
            </ul>
            <div class="dashboard"">
                <div class="stat-card" style="background: linear-gradient(135deg, #4facfe, #00f2fe);">
                    <i class="fa-solid fa-box" style="background: #007bff;"></i>
                    <div class="info">
                        <h3><c:out value="${totalProducts}" /></h3>
                        <p>Sản phẩm</p>
                    </div>
                </div>
                <div class="stat-card" style="background: linear-gradient(135deg, #ff9a9e, #fad0c4);">
                    <i class="fa-solid fa-shopping-cart" style="background: #dc3545;"></i>
                    <div class="info">
                        <h3><c:out value="${totalOrders}" /></h3>
                        <p>Đơn hàng hoàn thành</p>
                    </div>
                </div>
                <div class="stat-card" style="background: linear-gradient(135deg, #a8e063, #56ab2f);">
                    <i class="fa-solid fa-money-bill" style="background: #28a745;"></i>
                    <div class="info">
                        <h3><fmt:formatNumber value="${totalRevenue}" pattern="#,##0 VNĐ"/></h3>
                        <p>Doanh thu</p>
                    </div>
                </div>
                <div class="stat-card" style="background: linear-gradient(135deg, #f6d365, #fda085);">
                    <i class="fa-solid fa-users" style="background: #ffc107;"></i>
                    <div class="info">
                        <h3><c:out value="${totalUsers}" /></h3>
                        <p>Người dùng</p>
                    </div>
                </div>
                <div class="stat-card" style="background: linear-gradient(135deg, #89f7fe, #66a6ff);">
                    <i class="fa-solid fa-truck" style="background: #17a2b8;"></i>
                    <div class="info">
                        <h3><c:out value="${totalSuppliers}" /></h3>
                        <p>Nhà cung cấp</p>
                    </div>
                </div>
            </div>
            <!-- <div class="chart-container">
                <h3>Doanh thu theo tháng</h3>
                <canvas id="revenueChart"></canvas>
            </div> -->
            <div class="chart-container">
                <h3>Trạng thái đơn hàng</h3>
                <canvas id="orderStatusChart"></canvas>
            </div>
            
        </main>
        <!-- MAIN -->
    </section>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        // Biểu đồ doanh thu theo tháng
        const revenueData = {
            labels: [
                <c:forEach var="item" items="${revenueByMonth}">
                    '${item.Year}-${item.Month}',
                </c:forEach>
            ],
            datasets: [{
                label: 'Doanh thu (VNĐ)',
                data: [
                    <c:forEach var="item" items="${revenueByMonth}">
                        ${item.TotalRevenue},
                    </c:forEach>
                ],
                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                borderColor: 'rgba(75, 192, 192, 1)',
                borderWidth: 2,
                fill: true
            }]
        };

        const revenueChart = new Chart(document.getElementById('revenueChart'), {
            type: 'line',
            data: revenueData,
            options: {
                scales: {
                    y: {
                        beginAtZero: true,
                        title: {
                            display: true,
                            text: 'Doanh thu (VNĐ)'
                        }
                    },
                    xAxis: {
                        title: {
                            display: true,
                            text: 'Tháng-Năm'
                        }
                    }
                }
            }
        });

        // Biểu đồ trạng thái đơn hàng
        const orderStatusData = [
            <c:forEach var="entry" items="${orderStatusStats}">
                { label: '${entry.key}', value: ${entry.value} },
            </c:forEach>
        ];

        const orderStatusChart = [
            'rgba(255, 99, 132, 0.6)',
            'rgba(54, 162, 235, 0.6)',
            'rgba(255, 206, 86, 0.6)',
            'rgba(75, 192, 192, 0.6)',
            'rgba(153, 102, 255, 0.6)'
        ];

        const orderStatus = new Chart(document.getElementById('orderStatusChart'), {
            type: 'pie',
            data: {
                labels: orderStatusData.map(item => item.label),
                datasets: [{
                    data: orderStatusData.map(item => item.value),
                    backgroundColor: orderStatusChart,
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        position: 'top',
                    }
                }
            }
        });
    </script>
    <script src="<c:url value='/assets/admin/script.js' />"></script>
</body> 