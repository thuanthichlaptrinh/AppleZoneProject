<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Đơn đặt hàng - AppleZone</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" />
    <link href="<c:url value='/assets/user/css/index.css'/>" rel="stylesheet" />  
    <style>
        .container-d{max-width:1000px;margin:20px auto;padding:20px;border-radius:8px;}
        .sidebar{width:280px;float:left;margin-right:20px;background:#fff;padding:20px;margin-bottom:40px;}
        .sidebar ul{list-style:none;padding:0;}
        .sidebar ul li{margin-bottom:10px;}
        .sidebar ul li a{color:#374151;text-decoration:none;padding:8px;display:block;border-radius:4px;}
        .sidebar ul li a.active{background:#e0f2fe;color:#2563eb;font-weight:500;}
        .sidebar ul li a:hover{background:#f1f5f9;}
        .content{overflow:hidden;padding:20px;background:#fff;}
        .table{width:100%;border-collapse:collapse;margin-top:10px;}
        .table th,.table td{padding:12px;border:1px solid #e5e7eb;text-align:left;}
        .table th{background:#f3f4f6;font-weight:500;}
        .table tr:hover{background:#f9fafb;}
        .status-pending{color:#fb6e2e;}
        .status-completed{color:#22c55e;}
        .view-btn{background:#2563eb;color:#fff;padding:6px 12px;border-radius:4px;text-decoration:none;}
        .view-btn:hover{background:#1d4ed8;}
        .no-orders{text-align:center;color:#6b7280;padding:20px;}
    </style>
</head>
<body class="bg-gray-100">   
    <section class="bg-white" style="border-bottom-left-radius:4px;border-bottom-right-radius:4px">
        <ul class="flex mx-auto items-center px-1 py-3" style="max-width:1200px;gap:8px;font-size:14px;color:#515154;font-family:Arial,Helvetica,sans-serif;">
            <li>Trang chủ</li><li>›</li><li>Người dùng</li><li>›</li><li>Đơn đặt hàng</li>
        </ul>
    </section>

    <main class="container-d" style="height: 580px">
        <div class="sidebar">
            <ul>
                <li><a href="<c:url value='/thong-tin-cua-toi' />">Thông tin tài khoản</a></li>
                <li><a href="#">Địa chỉ nhận hàng</a></li>
                <li><a href="<c:url value='/don-dat-hang' />" class="active">Đơn đặt hàng</a></li>
                <li><a href="#">Hệ thống</a></li>
                <li><a href="#">Điểm thưởng</a></li>
                <li><a href="#">Đổi mật khẩu</a></li>
                <li><a href="#">Ảnh đại diện</a></li>
                <li><a href="#">Lịch sử đơn hàng đã tham gia</a></li>
            </ul>
        </div>
        <div class="content" style="height: 439px">
            <h1 class="text-2xl font-bold mb-4">Đơn đặt hàng</h1>
            <c:choose>
                <c:when test="${empty orders}">
                    <p class="no-orders">Bạn chưa có đơn hàng nào.</p>
                </c:when>
                <c:otherwise>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Mã đơn hàng</th>
                                <th>Ngày đặt</th>
                                <th>Trạng thái</th>
                                <th>Tổng tiền</th>
                                <th>Chi tiết</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="order" items="${orders}">
                                <tr>
                                    <td style="color: #3b82f6">#${order.idDonHang}</td>
                                    <td><fmt:formatDate value="${order.ngayDat}" pattern="dd/MM/yyyy HH:mm"/></td>
                                    <td class="${order.trangThai == 'Chưa hoàn tất' ? 'status-pending' : 'status-completed'}">${order.trangThai}</td>
                                    <td><fmt:formatNumber value="${order.tongTien}" type="number" pattern="#,##0"/>đ</td>
                                    <td><a href="<c:url value='/xac-nhan-dat-hang?donHangId=${order.idDonHang}'/>" class="view-btn">Xem</a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:otherwise>
            </c:choose>
        </div>
    </main> 

    <script src="<c:url value='/assets/user/js/main.js'/>"></script>
</body>
</html>