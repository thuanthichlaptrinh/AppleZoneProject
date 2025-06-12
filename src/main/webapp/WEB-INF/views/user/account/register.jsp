<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%@include file="/WEB-INF/views/layouts/user/taglib.jsp" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>AppleZone E-Commerce</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" />
    <link rel="stylesheet" href="<c:url value='/assets/user/css/index.css' />" />
    <style>
        .login-container-c { max-width: 1200px; height: auto; margin: 0 auto; display: flex; justify-content: space-between; align-items: center; padding: 40px 0; margin-top: 40px;  margin-bottom: 60px; }
        .login-image img { padding-right: 20px; width: 658px !important; height: 446px !important; object-fit: cover; }
        .login-image { width: 680px !important; height: 332px !important; }
        .login-form { flex: 1; padding-left: 20px; }
        .login-form h2 { font-size: 30px; font-weight: 500; margin-bottom: 20px; }
        .login-form input[type='text'],
        .login-form input[type='password'],
        .login-form input[type='email'],
        .login-form input[type='tel'],
        .login-form input[type='file'] { width: 100%; padding: 14px 16px; margin-bottom: 10px; border: 1px solid #dbdbdb; border-radius: 9px; box-sizing: border-box; outline: none; }
        .login-form input:focus { border: 1px solid #007bff; }
        .login-form button {  width: 100%; padding: 10px; background-color: #0056b3; color: white; border: none;  border-radius: 8px; cursor: pointer; }
        .login-form button:hover { background-color: #0056b3; }
        .register-link { text-align: center; font-size: 14px; color: #515154; margin-top: 10px; }
        .register-link a { color: #007bff; text-decoration: none; }
        .error-message, .success-message { color: red;  font-size: 14px; margin-bottom: 10px; }
        .success-message { color: green; }
        body { background-color: white !important; }
    </style>
</head>
<body>
    <section class="bg-white" style="border-bottom-left-radius: 4px; border-bottom-right-radius: 4px">
        <ul class="flex mx-auto items-center px-1 py-3" style="max-width: 1200px; gap: 8px; font-size: 14px; color: #515154; font-family: Arial, Helvetica, sans-serif;">
            <li>Trang chủ</li>
            <li>›</li>
            <li>Người dùng</li>
            <li>›</li>
            <li id="breadcrumb-section">Thông tin</li>
        </ul>
    </section>

    <div class="login-container-c">
        <div class="login-image" style="position: relative">
            <img src="<c:url value='/assets/user/images/register.jpeg'/>" alt="Register Illustration" style="max-width: 100%; position: absolute; top: -45%" />
        </div>
        <div class="login-form" style="width: 460px">
            <h2>Đăng ký</h2>
            <c:if test="${not empty error}">
                <div class="error-message">${error}</div>
            </c:if>
            <c:if test="${not empty success}">
                <div class="success-message">${success}</div>
            </c:if>
             
            <form:form method="POST" action="/AppleZone/dang-ky" modelAttribute="user">
                <div class="mt-4">
                    <label>Họ và tên:</label>
                    <form:input type="text" path="tenNguoiDung" placeholder="Nhập họ và tên"  />
                </div> 
                <div class="mt-4">
                    <label>Số điện thoại:</label>
                    <form:input type="tel" path="sdt" placeholder="Nhập số điện thoại"  />
                </div>
                <div class="mt-4">
                    <label>Email:</label>
                    <form:input type="email" path="email" placeholder="Nhập email"  />
                </div> 
                <div class="mt-4">
                    <label>Mật khẩu:</label>
                    <form:input type="password" path="matKhau" placeholder="Nhập mật khẩu"  />
                </div> 
                <div class="mt-4">
                    <label>Địa chỉ:</label>
                    <form:input type="text" path="diaChi" placeholder="Nhập địa chỉ"  />
                </div> 
                
                <button type="submit" class="mt-4" style="padding: 14px 16px">Đăng ký</button>
                <div class="register-link mt-4">
                    Bạn đã có tài khoản? <a href="<c:url value='/dang-nhap' />">Đăng nhập ngay</a>
                </div>
            </form:form>
        </div>
    </div>
</body>
</html>