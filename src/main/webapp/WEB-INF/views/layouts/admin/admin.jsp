<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@include file="/WEB-INF/views/layouts/admin/taglib.jsp" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
          integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="<c:url value='/assets/admin/style.css' />" />
    <link rel="stylesheet" href="<c:url value='/assets/admin/products.css' />" />
    <title><decorator:title default="Trang Quản Trị - AppleZone" /></title>
    <decorator:head />
</head>
<body> 
    <!-- SIDEBAR -->
	<section id="sidebar"> 
	    <a href="#" class="brand"><i class="bx bxs-smile icon"></i> AppleZone</a>
	    <ul class="side-menu">
                    <li><a href="<c:url value='/quan-tri' />" class="active"><i class="fa-solid fa-gauge icon"></i> Thống kê</a></li>
                    <li class="divider" data-text="main">Main</li>
                    <li><a href="<c:url value="/nguoi-dung-admin" />"><i class="fa-solid fa-users-line icon"></i> Quản lý người dùng</a></li>
                    <li><a href="<c:url value="/san-pham-admin" />"><i class="fa-solid fa-shirt icon"></i> Quản lý sản phẩm</a></li>
                    <li><a href="<c:url value="/loai-san-pham-admin" />"><i class="fa-solid fa-layer-group icon"></i> Quản lý danh mục</a></li>
                    <li><a href="<c:url value="/don-hang-admin" />"><i class="fa-solid fa-briefcase icon"></i> Quản lý đơn hàng</a></li>
                      <li><a href="<c:url value="nha-cung-cap-admin" />"><i class="fa-solid fa-comment icon"></i> Quản lý nhà cung cấp</a></li>
                </ul>
	</section>
<!-- SIDEBAR -->
    <!-- SIDEBAR -->

    <!-- CONTENT -->
    <section id="content">
        <!-- NAVBAR -->
        <nav>
            <i class="bx bx-menu toggle-sidebar"></i>
            <form action="#">
                <div class="form-group">
                    <input type="text" placeholder="Search..." />
                    <i class="bx bx-search icon"></i>
                </div>
            </form>
            <a href="#" class="nav-link">
                <i class="bx bxs-bell icon"></i>
                <span class="badge">5</span>
            </a>
            <a href="#" class="nav-link">
                <i class="bx bxs-message-square-dots icon"></i>
                <span class="badge">8</span>
            </a>
            <span class="divider"></span>
            <div class="profile">
                <img src="<c:url value="/assets/user/images/avatar-null.jpg" />" alt="" />
                <ul class="profile-link">
                    <li><a href="#"><i class="bx bxs-user-circle icon"></i> Profile</a></li>
                    <li><a href="#"><i class="bx bxs-cog"></i> Settings</a></li>
                    <li><a href="#"><i class="bx bxs-log-out-circle"></i> Logout</a></li>
                </ul>
            </div>
        </nav>
        <!-- NAVBAR -->

        <!-- MAIN -->
        <decorator:body />
        <!-- MAIN -->
    </section>
    <!-- CONTENT -->

    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
    <script src="<c:url value='/assets/admin/script.js' />"></script>
</body>
</html>