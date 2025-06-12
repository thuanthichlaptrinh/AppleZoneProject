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
    <link rel="stylesheet" href="<c:url value='/assets/css/index.css' />" />
    <style>
        body { background-color: white !important; }
        .login-container-c { max-width: 1200px; height: auto; margin: 0 auto; display: flex; justify-content: space-between; align-items: center; padding: 40px 0; margin-top: 40px; }
        .login-image img { padding-right: 20px; width: 612px !important; height: 332px !important; object-fit: cover; }
        .login-image { width: 680px !important; height: 332px !important; object-fit: cover; }
        .login-form { flex: 1; padding-left: 20px; }
        .login-form h2 { font-size: 30px; font-weight: 500; margin-bottom: 20px; }
        .login-form input { width: 100%; padding: 14px 16px; margin-bottom: 10px; border: 1px solid #ccc; border-radius: 9px; outline: none; }
        .login-form input:focus { border: 1px solid #007bff; }
        .login-form button { width: 100%; padding: 10px; background-color: #0056b3; color: white; border: none; border-radius: 8px; cursor: pointer; }
        .login-form button:hover { background-color: #0056b3; }
        .forgot-password { text-align: right; font-size: 14px; color: #007bff; margin-bottom: 10px; }
        .register-link { text-align: center; font-size: 14px; color: #515154; }
        .register-link a { color: #007bff; text-decoration: none; }
        .error-message, .success-message { color: red; font-size: 14px; margin-bottom: 10px; }
        .success-message { color: green; }
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

    <div class="login-container-c" style="margin-bottom: 140px">
        <div class="login-image">
            <img src="<c:url value='/assets/user/images/login.jpeg' />" alt="Login Illustration" style="max-width: 100%" />
        </div>
        <div class="login-form">
            <h2>Đăng nhập</h2>
            <c:if test="${not empty error}">
                <div class="error-message">${error}</div>
            </c:if>
            <c:if test="${param.registered == 'true'}">
                <div class="success-message">Đăng ký thành công! Vui lòng đăng nhập.</div>
            </c:if>
            <c:if test="${param.logout == 'true'}">
                <div class="success-message">Bạn đã đăng xuất thành công!</div>
            </c:if>
            <c:if test="${param.error == 'true'}">
                <div class="error-message">Số điện thoại hoặc mật khẩu không đúng!</div>
            </c:if>

            <form:form method="POST" action="/AppleZone/dang-nhap" modelAttribute="user">
                <div class="mt-3">
                    <label>Số điện thoại:</label>
                    <form:input type="text" path="sdt" cssClass="input-field" placeholder="Nhập số điện thoại" />
                </div>
                <div class="mt-3">
                    <label>Mật khẩu:</label>
                    <form:input type="password" path="matKhau" cssClass="input-field" placeholder="Nhập mật khẩu" />
                </div>
                <div class="forgot-password mt-3 flex items-center justify-between">
                    <div class="flex items-center gap-2">
                        <input type="checkbox" id="checkpassword" name="remember-me" style="width: 18px; height: 18px; margin-bottom: 0" />
                        <label for="checkpassword" style="color: #9f9f9f">Nhớ mật khẩu</label>
                    </div>
                    <a href="#">Quên mật khẩu?</a>
                </div>
                <button type="submit" class="mt-3">Đăng nhập</button>
                <div class="register-link mt-6">
                    Bạn chưa có tài khoản? <a href="<c:url value='/dang-ky' />">Tạo tài khoản ngay</a>
                </div>
            </form:form>
        </div>
    </div>
</body>
</html>