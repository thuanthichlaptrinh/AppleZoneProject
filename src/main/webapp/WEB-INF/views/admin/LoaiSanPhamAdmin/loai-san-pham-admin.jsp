<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@include file="/WEB-INF/views/layouts/user/taglib.jsp" %>

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
        <style>
        	header {display: none}
        	footer {display: none}
        </style>
</head>
<body> 
    <!-- SIDEBAR -->
	<section id="sidebar">
                <a href="#" class="brand"><i class="bx bxs-smile icon"></i> AppleZone</a>
                <ul class="side-menu">
                    <li><a href="<c:url value='/quan-tri' />"><i class="fa-solid fa-gauge icon"></i> Thống kê</a></li>
                    <li class="divider" data-text="main">Main</li>
                    <li><a href="<c:url value="/nguoi-dung-admin" />"><i class="fa-solid fa-users-line icon"></i> Quản lý người dùng</a></li>
                    <li><a href="<c:url value="/san-pham-admin" />"><i class="fa-solid fa-shirt icon"></i> Quản lý sản phẩm</a></li>
                    <li><a href="<c:url value="/loai-san-pham-admin" />" class="active"><i class="fa-solid fa-layer-group icon"></i> Quản lý danh mục</a></li>
                    <li><a href="<c:url value="/don-hang-admin" />" ><i class="fa-solid fa-briefcase icon"></i> Quản lý đơn hàng</a></li>
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
			<main>
			    <h1 class="title">Quản lý Danh Mục</h1>
			    <ul class="breadcrumbs">
			        <li><a href="<c:url value='/quan-tri'/>">Home</a></li>
			        <li class="divider">/</li>
			        <li><a href="#" class="active">Danh Mục</a></li>
			    </ul>
			    <div class="container">
			        <div class="card">
			            <div class="card-header">
			                <h6>Bảng Danh Mục</h6>
			            </div>
			            <div class="table-wrapper">
			                <table class="authors-table">
			                    <thead>
			                        <tr>
			                            <th>STT</th>
			                            <th>Tên Danh Mục</th> 
			                            <th>Thao Tác</th>
			                        </tr>
			                    </thead>
			                    <tbody>
			                        <c:if test="${not empty categorys}">
			                            <c:forEach var="category" items="${categorys}" varStatus="loop">
			                                <tr>
			                                    <td>${category.idLoaiSP}</td>
			                                    <td><small>${category.tenLoaiSP}</small></td> 
			                                    <td>
			                                        <a href="#" class="edit-link"><i class="fa-solid fa-pen-to-square"></i></a>
			                                        <a href="#" class="delete-link"><i class="fa-solid fa-trash"></i></a>
			                                    </td>
			                                </tr>
			                            </c:forEach>
			                        </c:if>
			                        <c:if test="${empty categorys}">
			                            <tr>
			                                <td colspan="4" class="text-center text-gray-500">Không có danh mục nào.</td>
			                            </tr>
			                        </c:if>
			                    </tbody>
			                </table>
			            </div>
			        </div>
			    </div>
			</main>
        <!-- MAIN -->
    </section>
    <!-- CONTENT -->

    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
    <script src="<c:url value='/assets/admin/script.js' />"></script>
</body>
</html>