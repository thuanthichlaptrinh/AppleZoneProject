<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Chi tiết sản phẩm - ${sanPham.tenSanPham}</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" />
        <link rel="stylesheet" href='<c:url value="/assets/user/css/index.css"/>' />
        <link rel="stylesheet" href='<c:url value="/assets/user/css/detail.css"/>' /> 
    </head>
    <body class="bg-gray-100">  
        <section class="bg-white" style="border-bottom-left-radius: 4px; border-bottom-right-radius: 4px">
            <ul
                class="flex mx-auto items-center px-1 py-3"
                style="
                    max-width: 1200px;
                    gap: 8px;
                    font-size: 14px;
                    color: #515154;
                    font-family: Arial, Helvetica, sans-serif;
                "
            >
                <li><a href="<c:url value='/'/>">Trang chủ</a></li>
                <li>›</li>
                <c:forEach var="category" items="${categories}">
                    <c:if test="${category.idLoaiSP == sanPham.idLoaiSP}">
                        <li>${category.tenLoaiSP}</li>
                    </c:if>
                </c:forEach>
                <li>›</li>
                <li>${sanPham.tenSanPham}</li>
            </ul>
        </section>

        <!-- Product Detail Section -->
        <section class="container mx-auto py-8" style="max-width: 1200px">
            <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
                <!-- Product Images -->
                <div class="product-image-container">
                    <div class="main-image">
                        <img		
                            src="<c:url value='${sanPham.hinhAnh}'/>"
                            alt="${sanPham.tenSanPham}"
                            id="mainImage"
                            class="h-auto object-containt rounded-lg" 
                            style="width: 584px; height: 584px"
                        />
                    </div>
                    <div class="thumbnail-wrapper mt-4 relative bg-white p-2" style="border-radius: 4px">
                        <button class="prev-btn" id="prevBtn">❮</button>
                        <div class="thumbnail-slide" id="thumbnailSlide">
                            <c:choose>
                                <c:when test="${not empty hinhAnhList}">
                                    <c:forEach var="hinhAnh" items="${hinhAnhList}" varStatus="loop">
                                        <img src="<c:url value='${hinhAnh.duongDanHinhAnh}'/>" alt="Thumbnail ${loop.count}" class="thumbnail ${loop.first ? 'active' : ''}" />
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <img src="<c:url value='${sanPham.hinhAnh}'/>" alt="Thumbnail 1" class="thumbnail active" />
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <button class="next-btn" id="nextBtn">❯</button>
                    </div>
                </div>

                <!-- Product Info -->
                <div class="bg-white" style="border-radius: 4px; padding: 30px">
                    <h1 class="text-3xl font-bold mb-2">${sanPham.tenSanPham}</h1>
                    <p class="text-gray-600 mb-4">Khu vực miền Nam</p>
                    <div class="flex items-center space-x-4 mb-4">
                        <p class="text-3xl font-bold text-red-500" id="productPrice"> 
                            <fmt:formatNumber value="${sanPham.gia}" type="number" pattern="#,##0" var="formattedPrice"/> ${formattedPrice}₫
                        </p>
                        <p class="text-lg text-gray-500 line-through" id="originalPrice"> 
                            <fmt:formatNumber value="${sanPham.gia * 1.15}" type="number" pattern="#,##0" var="formattedPrice"/> ${formattedPrice}₫
                        </p>
                        <span class="bg-red-500 text-white text-sm px-2 py-1 rounded">Giảm 13%</span>
                    </div>

                    <!-- Storage Options -->
                    <div class="mb-4">
                        <p class="font-semibold mb-2">Dung lượng</p>
                        <div class="flex space-x-4" id="storageOptions">
                            <c:if test="${not empty thongSo.dungLuong}">
                                <button
                                    class="border border-blue-500 text-blue-500 px-4 py-1 rounded-md active"
                                    data-price="${sanPham.gia}"
                                    data-original="${sanPham.gia * 1.15}"
                                >
                                    ${thongSo.dungLuong}
                                </button>
                            </c:if>
                            <!-- Thêm logic nếu có nhiều tùy chọn dung lượng -->
                        </div>
                    </div>

                    <!-- Color Options -->
                    <div class="mb-4">
                        <p class="font-semibold mb-2">Màu sắc</p>
                        <div class="flex space-x-4" id="colorOptions">
                            <button
                                class="w-8 h-8 bg-black rounded-full border-2 border-gray-300"
                                data-color="Black"
                            ></button>
                            <button
                                class="w-8 h-8 bg-gray-300 rounded-full border-2 border-gray-300"
                                data-color="Gray"
                            ></button>
                            <button
                                class="w-8 h-8 bg-gray-100 rounded-full border-2 border-gray-300"
                                data-color="White"
                            ></button>
                        </div>
                    </div>

                    <!-- Offers -->
                    <div class="offer-box">
                        <p class="font-semibold mb-2">Ưu đãi thanh toán</p>
                        <ul>
                            <li>
                                Mua trả góp giảm thêm 300.000₫
                                <a href="#" class="text-blue-500 hover:underline">(Xem chi tiết)</a>
                            </li>
                            <li>Giảm đến 200.000₫ khi thanh toán qua Kredivo</li>
                            <li>Hỗ trợ trả góp 0% lãi suất, 0đ phí chuyển đổi, 0đ bảo hiểm</li>
                        </ul>
                    </div>

                    <div class="offer-box">
                        <p class="font-semibold mb-2">Ưu đãi mua kèm</p>
                        <ul>
                            <li>Mua combo phụ kiện Apple iPhone 16 series giảm 100.000₫</li>
                            <li>Mua tai nghe Sony giảm đến 1.500.000₫</li>
                            <li>Giảm đến 20% khi mua các gói bảo hành</li>
                        </ul>
                    </div>

                    <div class="offer-box">
                        <p class="font-semibold mb-2">Ưu đãi khác</p>
                        <ul>
                            <li>Thu cũ lên đời iPhone - Voucher 4 triệu</li>
                        </ul>
                    </div>

                    <!-- Action Buttons --> 
                    <div class="space-x-4 mb-4">
	                    <form action="<c:url value='/them-vao-gio-hang' />" method="post">
						    <input type="hidden" name="idSanPham" value="${sanPham.idSanPham}" />  
							<button type="submit" class="bg-blue-500 text-white px-6 py-3 rounded-md block w-full text-center">Thêm vào giỏ</button>
						</form> 
                    </div>
                    <div class="flex space-x-4 mb-4">
                        <button class="border-2 border-blue-500 text-blue-500 px-6 py-1 rounded-md w-full text-center">
                            Mua trả góp 0% qua công ty tài chính
                        </button>
                        <button class="border-2 border-blue-500 text-blue-500 px-6 py-1 rounded-md w-full text-center">
                            Trả góp 0% qua thẻ Visa, Mastercard, JCB, AMEX
                        </button>
                    </div>
                    <div class="flex space-x-4">
                        <button class="border-2 border-blue-500 text-blue-500 px-6 py-3 rounded-md w-full text-center">
                            Mua trả góp 0%
                        </button>
                    </div>
                </div>
            </div>
        </section>

        <!-- Bundle Products (Mua kèm giá sốc) -->
        <div class="mt-8 mx-auto" style="width: 1200px">
            <h2 class="text-2xl font-bold mb-4">Mua kèm giá sốc</h2>
            <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6" style="height: 410px">
                <!-- Giữ nguyên phần này vì cần dữ liệu từ bảng KhuyenMai hoặc SanPham khác -->
                <div class="bg-white rounded-lg shadow-md p-4 relative">
                    <img
                        src="<c:url value='${sanPham.hinhAnh}'/>"
                        alt="${sanPham.tenSanPham}"
                        class="w-full h-32 object-cover mb-2"
                        style="width: 240px; height: 240px"
                    /> 
                    <h3 class="text-lg font-semibold" style="height: 56px; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden; text-overflow: ellipsis; line-height: 28px;">${sanPham.tenSanPham}</h3>
                    <div class="flex items-center gap-3">
                            	<p class="text-red-500 font-bold">	
                                	<fmt:formatNumber value="${sanPham.gia}" type="number" pattern="#,##0" var="formattedPrice"/> ${formattedPrice}₫
	                            </p>
	                            <p class="text-gray-500 line-through text-sm">
	                            	<fmt:formatNumber value="${sanPham.gia * 1.15}" type="number" pattern="#,##0" var="formattedPrice"/> ${formattedPrice}₫
	                            </p>
                            </div>
                    <label class="flex items-center mt-2">
                        <input type="checkbox" class="mr-2" />
                        <span>Chọn sản phẩm</span>
                    </label>
                </div>
                <!-- Thêm logic để hiển thị các sản phẩm mua kèm khác nếu cần -->
            </div>
            <div class="flex justify-between items-center mt-4">
                <p class="text-lg font-semibold">
                    Tổng: <span class="text-red-500">
                        <fmt:formatNumber value="${sanPham.gia}" type="number" pattern="#,##0" var="formattedPrice"/>${formattedPrice}₫
                    </span>
                    <span class="text-gray-500 line-through">Tiết kiệm: 0₫</span>
                </p>
                <button class="bg-blue-500 text-white px-6 py-2 rounded-md">Thêm vào giỏ hàng</button>
            </div>
        </div>

        <!-- Similar Products (Sản phẩm tương tự) -->
        <div class="mt-8 mx-auto" style="width: 1200px">
            <h2 class="text-2xl font-bold mb-4">Sản phẩm tương tự</h2>
            <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
                <c:forEach var="sp" items="${allProducts}">
                    <c:if test="${sp.idLoaiSP == sanPham.idLoaiSP && sp.idSanPham != sanPham.idSanPham}">
                        <div class="bg-white rounded-lg shadow-md p-4 relative" style="height: 410px">
                            <img
                                src="<c:url value='${sp.hinhAnh}'/>"
                                alt="${sp.tenSanPham}"
                                class="w-full h-32 object-cover mb-2"
                                style="width: 240px; height: 240px"
                            /> 
                            <h3 class="text-lg font-semibold" style="height: 56px; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden; text-overflow: ellipsis; line-height: 28px;">${sp.tenSanPham}</h3>
                            <div class="flex items-center gap-3">
                            	<p class="text-red-500 font-bold">
                                	<fmt:formatNumber value="${sp.gia}" type="number" pattern="#,##0" var="formattedPrice"/> ${formattedPrice}₫
	                            </p>
	                            <p class="text-gray-500 line-through text-sm">
	                            	<fmt:formatNumber value="${sp.gia * 1.15}" type="number" pattern="#,##0" var="formattedPrice"/> ${formattedPrice}₫
	                            </p>
                            </div>
                            <button class="bg-blue-500 text-white px-4 py-2 rounded-md mt-2 w-full">
                                <a href="<c:url value='/chi-tiet-san-pham?idSanPham=${sp.idSanPham}'/>">Xem chi tiết</a>
                            </button>
                        </div>
                    </c:if>
                </c:forEach>
            </div>
        </div>

        <!-- Product Description (Phần mô tả) -->
        <div class="mt-8 bg-white mx-auto rounded-lg shadow-md p-6 mb-6" style="width: 1200px">
            <h2 class="text-2xl font-bold mb-4">Mô tả sản phẩm</h2>
            <div class="description-content">
                <p class="mb-4">${sanPham.moTa}</p>
                <h3 class="text-xl font-semibold mb-2">Đặc điểm nổi bật</h3>
                <ul class="list-disc pl-5 mb-4">
                    <c:if test="${not empty thongSo.chip}">
                        <li>Chip ${thongSo.chip} mạnh mẽ, hiệu suất vượt trội</li>
                    </c:if>
                    <c:if test="${not empty thongSo.manHinh}">
                        <li>Màn hình ${thongSo.manHinh}, tần số quét 120Hz</li>
                    </c:if>
                    <c:if test="${not empty thongSo.camera}">
                        <li>Hệ thống camera ${thongSo.camera}</li>
                    </c:if>
                    <c:if test="${not empty thongSo.chongNuoc}">
                        <li>Thiết kế bền bỉ, chống nước ${thongSo.chongNuoc}</li>
                    </c:if>
                    <c:if test="${not empty thongSo.pin}">
                        <li>Pin ${thongSo.pin}</li>
                    </c:if>
                </ul>
                <img src="<c:url value='${sanPham.hinhAnh}'/>" alt="${sanPham.tenSanPham}" class="mb-4" />
                <p class="mb-4">
                    ${sanPham.tenSanPham} không chỉ là một sản phẩm, mà còn là một công cụ mạnh mẽ hỗ trợ bạn trong công việc và giải trí.
                </p>
                <h3 class="text-xl font-semibold mb-2">Thông số kỹ thuật</h3>
                <table class="w-full border-collapse mb-4">
                    <c:if test="${not empty thongSo.manHinh}">
                        <tr class="border-b">
                            <td class="p-2 font-semibold">Màn hình</td>
                            <td class="p-2">${thongSo.manHinh}</td>
                        </tr>
                    </c:if>
                    <c:if test="${not empty thongSo.chip}">
                        <tr class="border-b">
                            <td class="p-2 font-semibold">Chip</td>
                            <td class="p-2">${thongSo.chip}</td>
                        </tr>
                    </c:if>
                    <c:if test="${not empty thongSo.camera}">
                        <tr class="border-b">
                            <td class="p-2 font-semibold">Camera</td>
                            <td class="p-2">${thongSo.camera}</td>
                        </tr>
                    </c:if>
                    <c:if test="${not empty thongSo.pin}">
                        <tr class="border-b">
                            <td class="p-2 font-semibold">Pin</td>
                            <td class="p-2">${thongSo.pin}</td>
                        </tr>
                    </c:if>
                    <c:if test="${not empty thongSo.thongTinKhac}">
                        <tr>
                            <td class="p-2 font-semibold">Hệ điều hành</td>
                            <td class="p-2">${thongSo.thongTinKhac}</td>
                        </tr>
                    </c:if>
                </table>
                <a href="#" class="text-blue-500 hover:underline">Xem thêm thông số chi tiết →</a>
            </div>
        </div>

        <script src='<c:url value="/assets/user/js/detail.js"/>'></script>
    </body>
</html>