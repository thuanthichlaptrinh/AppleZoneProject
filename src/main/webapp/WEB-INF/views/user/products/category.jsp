<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Danh sách sản phẩm ${categoryName}</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" />
    <link rel="stylesheet" href="<c:url value='/assets/css/index.css' />" />
    <style>
        .banner-slide { height: 400px; }
        .rating-bar { background-color: #d1d5db; height: 10px; border-radius: 5px; overflow: hidden; position: relative; display: flex; align-items: center; }
        .rating-bar-fill { background-color: #faa614; height: 100%; border-radius: 5px; position: absolute; top: 0; left: 0; }
        .rating-star { position: absolute; left: -12px; color: #f59e0b; font-size: 16px; }
    </style>
</head>
<body class="bg-gray-100"> 
    <!-- Breadcrumb -->
    <section class="bg-white" style="border-bottom-left-radius: 4px; border-bottom-right-radius: 4px">
        <ul class="flex mx-auto items-center px-1 py-3" style="max-width: 1200px; gap: 8px; font-size: 14px; color: #515154; font-family: Arial, Helvetica, sans-serif;">
            <li><a href="<c:url value='/' />">Trang chủ</a></li>
            <li>›</li>
            <li>Sản phẩm</li>
            <li>›</li>
            <li>${categoryName}</li>
        </ul>
    </section>

    <!-- Banner Carousel -->
    <section class="banner-container mx-auto mt-6" style="max-width: 1200px; border-radius: 4px; overflow: hidden">
        <div class="banner-slide active">
            <img src="<c:url value='/assets/user/images/slide1.png' />" alt="Banner 1" class="w-full" style="height: 420px" />
        </div>
        <div class="banner-slide">
            <img src="<c:url value='/assets/user/images/slide2.png' />" class="w-full" style="height: 420px" />
        </div>
        <div class="banner-slide">
            <img src="<c:url value='/assets/user/images/slide3.png' />" alt="Banner 2" class="w-full" style="height: 420px" />
        </div>
        <div class="banner-nav banner-nav-left" onclick="changeSlide(-1)">&#10094;</div>
        <div class="banner-nav banner-nav-right" onclick="changeSlide(1)">&#10095;</div>
        <div class="banner-dots">
            <span class="banner-dot active" onclick="goToSlide(0)"></span>
            <span class="banner-dot" onclick="goToSlide(1)"></span>
            <span class="banner-dot" onclick="goToSlide(2)"></span>
        </div>
    </section>

    <!-- Sub nav -->
    <section class="container mx-auto py-8" style="max-width: 1200px; padding-bottom: 0">
        <ul class="flex align-items center gap-6">
            <c:forEach var="category" items="${categories}">
                <li class="bg-white p-2 shadow-md" style="border-radius: 8px; font-size: 13px">
                    <a href="<c:url value='/san-pham?idLoaiSP=${category.idLoaiSP}' />">${category.tenLoaiSP}</a>
                </li>
            </c:forEach>
        </ul>
    </section>

    <!-- Products Section -->
    <section class="container mx-auto py-8" style="max-width: 1200px; padding-top: 8px;">
        <div class="items-center mb-6">
            <h2 class="text-3xl font-bold text-center"> </h2>
        </div>
        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
            <c:choose>
                <c:when test="${not empty products}">
                    <c:forEach var="sanPham" items="${products}">
                        <a href='<c:url value="/chi-tiet-san-pham?idSanPham=${sanPham.idSanPham}" />' class="product-card bg-white rounded-lg shadow-md relative">
                            <span class="discount-label">Giảm 3%</span>
                            <c:if test="${sanPham.moi}">
                                <span class="new-label">Mới</span>
                            </c:if>
                            <img
                                src="<c:url value='${sanPham.hinhAnh}'/>"
                                alt="${sanPham.tenSanPham}"
                                class="w-full h-48 object-cover mt-6 mb-4"
                                style="height: 240px; object-fit: contain"
                            />
                            <div class="p-4">
                                <h3 class="text-lg font-semibold" style="height: 56px; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden; text-overflow: ellipsis; line-height: 28px;">
                                    ${sanPham.tenSanPham}
                                </h3>
                                <div style="display: flex; align-items: center; gap: 12px">
                                    <p class="text-red-500 font-bold">
                                        <fmt:formatNumber value="${sanPham.gia}" type="currency" currencySymbol="₫" groupingUsed="true"/>
                                    </p>
                                </div>
                            </div>
                        </a>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <p class="text-center text-gray-500 col-span-4">Không có sản phẩm nào thuộc danh mục này.</p>
                </c:otherwise>	
            </c:choose>
        </div>
    </section>

    <!-- Footer and other sections can remain as is -->
    <script src="<c:url value='/assets/user/js/main.js'/>"></script>
</body>
</html>