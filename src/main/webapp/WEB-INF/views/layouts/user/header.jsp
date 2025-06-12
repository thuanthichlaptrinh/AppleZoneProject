<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  

<header class="bgPrimary shadow-md sticky top-0" style="z-index: 1000000">
    <div class="container mx-auto py-4 flex items-center justify-between" style="max-width: 1210px">
        <a href="<c:url value="/" />" class="flex items-center">
            <span class="text-2xl textColor font-bold ml-2">AppleZone E-Commerce</span>
        </a>
        <nav class="hidden md:flex space-x-8">
            <c:forEach var="category" items="${categories}">
                <a href="<c:url value='/san-pham?idLoaiSP=${category.idLoaiSP}' />" class="textColor hover-colorPrimary">${category.tenLoaiSP}</a>
            </c:forEach>
        </nav>
        <div class="flex items-center space-x-6">
            <!-- Ô tìm kiếm -->
            <form action="<c:url value='/tim-kiem' />" method="get"  class="relative search-container">
                <a href="#" class="hover:text-red-500 search-icon">
                    <img src="<c:url value='/assets/user/icons/search-icon-1.png'/>" alt="Search" />
                </a>
                <input type="text" name="keyword" class="search-input hidden absolute bg-white border border-gray-300 rounded-lg py-2 px-4 right-0 mt-3 focus:outline-none focus:ring-2 focus:ring-red-500 focus:border-transparent shadow-sm placeholder-gray-400 transition-all duration-300 ease-in-out" placeholder="Tìm kiếm sản phẩm..." style="box-shadow: rgba(240, 46, 170, 0.4) 5px 5px, rgba(240, 46, 170, 0.3) 10px 10px, rgba(240, 46, 170, 0.2) 15px 15px, rgba(240, 46, 170, 0.1) 20px 20px, rgba(240, 46, 170, 0.05) 25px 25px; width: 300px" />
            </form>
            <a href="<c:url value='/gio-hang' />" class="hover:text-red-500" style="position: relative">
                <img src="<c:url value='/assets/user/icons/cart-icon.png'/>" alt="Cart" />
                <span class="quanty">1</span>
            </a>
            <div class="relative login-container">
                <c:choose>
                    <c:when test="${not empty sessionScope.loggedInUser}"> 
                        <img src="<c:url value='/assets/user/icons/login.png'/>" alt="Logged In" class="cursor-pointer" />
                        <div class="login-dropdown absolute bg-white shadow-lg rounded-md py-2 mt-2 right-0 w-48 hiddenDrop">
                            <a href="<c:url value='/thong-tin-cua-toi' />" class="block px-4 py-2 text-gray-700 hover:bg-gray-100">Thông tin của tôi</a>
                            <a href="<c:url value='/dang-xuat' />" class="block px-4 py-2 text-gray-700 hover:bg-gray-100">Đăng xuất</a>
                        </div>
                    </c:when>
                    <c:otherwise> 
                        <img src="<c:url value='/assets/user/icons/login.png'/>" alt="Login" class="cursor-pointer" /> 
                        <div class="login-dropdown absolute bg-white shadow-lg rounded-md py-2 mt-2 right-0 w-48 hiddenDrop">
                            <a href="<c:url value='/dang-nhap' />" class="block px-4 py-2 text-gray-700 hover:bg-gray-100">Đăng nhập</a>
                            <a href="<c:url value='/dang-ky' />" class="block px-4 py-2 text-gray-700 hover:bg-gray-100">Đăng ký tài khoản</a>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="flex space-x-2" style="margin-left: 20px">
                <a href="#" class="hover:text-red-500 flex items-center">
                    <img src="<c:url value='/assets/user/icons/vn.png'/>" alt="VN Flag" class="mr-1" style="width: 16px; height: 15px" />
                </a>
                <a href="#" class="hover:text-red-500 flex items-center">
                    <img src="<c:url value='/assets/user/icons/us.png'/>" alt="EN Flag" class="mr-1" style="width: 16px; height: 15px" />
                </a>
            </div>
        </div>
    </div>
</header>

<style>
    .search-input {
        display: none; /* Ẩn ô input ban đầu */
        opacity: 0; /* Để tạo hiệu ứng fade-in */
        transform: translateY(-10px); /* Hiệu ứng trượt nhẹ từ trên xuống */
        transition: all 0.3s ease-in-out; /* Hiệu ứng chuyển tiếp mượt mà */
    }

    .search-input.show {
        display: block; /* Hiển thị ô input */
        opacity: 1; /* Hiển thị hoàn toàn */
        transform: translateY(0); /* Đưa về vị trí ban đầu */
    }

    .search-input:focus {
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1); /* Bóng đổ nhẹ khi focus */
    }

    .search-input::placeholder {
        color: #9ca3af; /* Màu placeholder nhẹ nhàng */
        font-style: italic; /* Chữ nghiêng cho placeholder */
    }
</style>

<script>
document.addEventListener('DOMContentLoaded', function () {
    const searchIcon = document.querySelector('.search-icon');
    const searchInput = document.querySelector('.search-input');

    // Toggle hiển thị ô input khi nhấn vào biểu tượng tìm kiếm
    searchIcon.addEventListener('click', function (e) {
        e.preventDefault(); // Ngăn chặn hành vi mặc định của thẻ <a>
        searchInput.classList.toggle('show'); // Toggle hiển thị ô input
        if (searchInput.classList.contains('show')) {
            searchInput.focus(); // Tự động focus vào ô input khi hiển thị
        }
    });

    // Ẩn ô input khi nhấn ra ngoài
    document.addEventListener('click', function (e) {
        if (!searchIcon.contains(e.target) && !searchInput.contains(e.target)) {
            searchInput.classList.remove('show');
        }
    });

    // Xử lý tìm kiếm khi nhấn Enter
    
});
</script>