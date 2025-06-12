<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Xác nhận đơn hàng - AppleZone</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
    <style>
        body { font-family: 'Roboto', sans-serif; }
        .btn-primary { background: #2563eb; color: white; padding: 12px 24px; border-radius: 8px; font-weight: 500; border: none; cursor: pointer; width: 100%; }
        .btn-primary:hover { background: #1d4ed8; }
        .pending { color: #fb6e2e; border: 1px dashed #fb6e2e; background-color: rgba(251, 110, 46, 0.05); }
    </style>
</head>
<body class="bg-gray-100">
     
    <main class="container mx-auto py-8" style="max-width: 600px; height: 640px">
        <div class="bg-white p-6 rounded-lg shadow-md">
            <c:choose>
                <c:when test="${not empty error}">
                    <h2 class="text-lg text-center font-semibold text-red-600 mb-4">${error}</h2>
                </c:when>
                <c:otherwise>
                    <h2 class="text-lg text-center font-semibold text-green-700 mb-4">Đặt hàng thành công</h2>
                    <p class="text-gray-600 mb-4">
                        Cảm ơn <span class="font-bold">${loggedInUser.tenNguoiDung}</span> đã chọn AppleZone.
                    </p>
                    <div class="border p-4 mb-4 rounded-lg bg-gray-50">
                        <p class="text-gray-700"><strong style="color: black">Đơn hàng: <span style="color: #3b82f6; font-weight: 500">#${donHang.idDonHang}</span></strong></p>
                        <ul class="list-disc list-inside text-gray-600 mt-2">
                            <li><strong style="color: black">Người nhận:</strong> ${loggedInUser.tenNguoiDung}, ${loggedInUser.sdt}</li>
                            <li><strong style="color: black">Nhận tại:</strong> ${donHang.diaChi}</li>
                            <li><strong style="color: black">Tổng tiền:</strong> <fmt:formatNumber value="${donHang.tongTien}" type="currency" currencyCode="VND" maxFractionDigits="0"/></li>
                        	<li><strong style="color: black">Trạng thái đơn hàng:</strong> ${donHang.trangThai }</li>
                        </ul>
                    </div>
                    <button class="w-full py-2 rounded-lg text-center pending">
                        Đơn hàng chưa thanh toán
                    </button>
                    <a href="<c:url value="/trang-chu" />" class="w-full block mt-3 py-2 text-center" style="border: 1px solid #3b82f6; color: #3b82f6;  border-radius: 6px">Trở về trang chủ</a>
                </c:otherwise>
            </c:choose>
        </div>
    </main>
</body>
</html>