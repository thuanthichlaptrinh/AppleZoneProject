<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@include file="/WEB-INF/views/layouts/admin/taglib.jsp" %>

<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Truy cập không được phép</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 flex items-center justify-center h-screen">
    <div class="text-center  mt-8" style="height: 600px">
        <h1 class="text-3xl font-bold text-red-600">Không có quyền truy cập</h1>
        <p class="mt-4 text-gray-700">Bạn không có quyền truy cập vào trang <span class="text-red-600	">quản trị</span>. Vui lòng liên hệ quản trị viên nếu cần hỗ trợ.</p>
        <a href="<c:url value='/trang-chu' />" class="mt-6 inline-block bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600">Quay lại Trang chủ</a>
    </div>
</body>
</html>