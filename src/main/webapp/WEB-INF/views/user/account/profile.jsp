<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>AppleZone</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" />
        <link rel="stylesheet" href="/assets/css/index.css" />
        <style>
            .container-d {max-width: 1000px;margin: 20px auto;padding: 20px;border-radius: 8px;}
            .sidebar { width: 280px; float: left; margin-right: 20px; background-color: #fff; padding: 20px; margin-bottom: 40px; }
            .sidebar ul { list-style: none; padding: 0; }
            .sidebar ul li { margin-bottom: 10px; }
            .sidebar ul li a { color: #374151; text-decoration: none; padding: 8px; display: block; border-radius: 4px; }
            .sidebar ul li a.active { background-color: #e0f2fe; color: #2563eb; font-weight: 500; }
            .sidebar ul li a:hover { background-color: #f1f5f9; }
            .content { overflow: hidden; padding: 20px; background-color: #fff; }
            .form-group { margin-bottom: 10px; color: rgb(112, 112, 112); }
            .form-group label { display: block; font-weight: 500; color: #1f2937; margin-bottom: 5px; }
            .form-group input,
            .form-group select { width: 100%; padding: 8px; border: 1px solid #e7e7e8; border-radius: 4px; box-sizing: border-box; }
            .form-group select { appearance: none; background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 24 24' stroke-width='1.5' stroke='%236b7280' class='w-5 h-5'%3E%3Cpath stroke-linecap='round' stroke-linejoin='round' d='M19.5 8.25l-7.5 7.5-7.5-7.5' /%3E%3C/svg%3E"); ackground-repeat: no-repeat; background-position: right 8px center; }
            .form-group .gender { display: flex; gap: 10px;  }
            .form-group .gender input {  width: auto; margin-right: 5px; }
            .save-btn { background-color: #2563eb;  color: #fff; padding: 10px 20px; border: none;  border-radius: 4px; cursor: pointer; font-weight: 500;  }
            .save-btn:hover { background-color: #1d4ed8;  }
            .hiddenDrop {  display: none; }
            .login-container:hover .hiddenDrop {  display: block; }
            .form-control { width: 100%;  gap: 20px; margin-bottom: 8px; }
        </style>
    </head>
    <body class="bg-gray-100"> 

        <section class="bg-white" style="border-bottom-left-radius: 4px; border-bottom-right-radius: 4px">
            <ul
                class="flex mx-auto items-center px-1 py-3"
                style="  max-width: 1200px;  gap: 8px; font-size: 14px; color: #515154; font-family: Arial, Helvetica, sans-serif; ">
                <li>Trang chủ</li>
                <li>›</li>
                <li>Người dùng</li>
                <li>›</li>
                <li>Thông tin</li>
            </ul>
        </section>

        <!-- Main Content -->
        <main class="container-d">
            <div class="sidebar">
                <ul>
                    <li><a href="<c:url value='/thong-tin-cua-toi' />" class="active">Thông tin tài khoản</a></li>
                    <li><a href="">Địa chỉ nhận hàng</a></li>
                    <li><a href="<c:url value='/don-dat-hang' />">Đơn đặt hàng</a></li>
                    <li><a href="#">Hệ thống</a></li>
                    <li><a href="#">Điểm thưởng</a></li>
                    <li><a href="#">Đổi mật khẩu</a></li>
                    <li><a href="#">Ảnh đại diện</a></li>
                    <li><a href="#">Lịch sử đơn hàng đã tham gia</a></li>
                </ul>
            </div>
            <div class="content" style="height: 440px">
                <form class="flex p-2" >
                    <div style="width: 40%">
                        <div style="width: 100%; height: auto">
                            <c:choose>
					        <c:when test="${empty user.hinhAnh or user.hinhAnh == null}">
					            <div class="form-group" > 
					                <img src="<c:url value='/assets/user/images/avatar-null.jpg' />" style=""  alt="Avatar" />
					            	<p style="text-align: center; margin-top: 20px">Ảnh đại diện</p>
					            </div>
					        </c:when>
					        <c:otherwise>
					            <div class="form-group"> 
					                <img src="<c:url value='/assets/user/images/${user.hinhAnh}' />" alt="Avatar" />
					            	<p style="text-align: center; margin-top: 20px">Ảnh đại diện</p>
					            </div>
					        </c:otherwise>
					    </c:choose>
                        </div>
                    </div>

                    <div
                        style=" width: 60%;   display: flex;  align-items: center;  flex-direction: column;  " >
                        <div class="form-control">
                            <div class="form-group">
                                <label>Họ và tên:</label>
                                <input type="text" value="${ user.tenNguoiDung }" />
                            </div>
                            <div class="form-group">
                                <label>Email:</label>
                                <input type="email" value="${ user.email }" />
                            </div>
                        </div>

                        <div class="form-control"> 
                            <div class="form-group">
                                <label>Điện thoại:</label>
                                <input type="tel" value="${ user.sdt }" />
                            </div>
                            <div class="form-group">
                                <label>Địa chỉ:</label>
                                <input type="text" value=" ${ user.diaChi }" readonly />
                            </div>
                        </div>

                        <button type="submit" class="mx-auto block mt-1" style="background-color: #1d4ed8; font-size: 14px; padding: 10px 30px; color: white; border-radius: 8px; " >
                            Lưu lại
                        </button>
                    </div>
                </form>
            </div>
        </main> 

        <script src="/assets/js/main.js"></script>
    </body>
</html>
