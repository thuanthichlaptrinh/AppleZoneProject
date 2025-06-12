<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@include file="/WEB-INF/views/layouts/user/taglib.jsp" %>

<body class="bg-gray-100">
    <!-- Banner Carousel -->
    <section class="banner-container">
        <div class="banner-slide active">
            <img src="<c:url value='/assets/user/images/slide1.png'/>" alt="iPad Banner 1" class="w-full" />
        </div>
        <div class="banner-slide">
            <img src="<c:url value='/assets/user/images/slide2.png'/>" alt="iPad Banner 2" class="w-full" />
        </div>
        <div class="banner-slide">
            <img src="<c:url value='/assets/user/images/slide3.png'/>" alt="iPad Banner 2" class="w-full" />
        </div>
        <div class="banner-nav banner-nav-left" onclick="changeSlide(-1)">❮</div>
        <div class="banner-nav banner-nav-right" onclick="changeSlide(1)">❯</div>
        <div class="banner-dots">
            <span class="banner-dot active" onclick="goToSlide(0)"></span>
            <span class="banner-dot" onclick="goToSlide(1)"></span>
            <span class="banner-dot" onclick="goToSlide(2)"></span>
        </div>
    </section> 

    <!-- Promotional Images -->
    <section class="container mx-auto py-8" style="max-width: 1200px">
        <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
            <div class="bg-white rounded-lg shadow-md"> 
                <img src="<c:url value='/assets/user/images/banner1.png'/>" alt="Promo 1" class="w-full h-40 object-cover rounded-t-lg" />
            </div>
            <div class="bg-white rounded-lg shadow-md"> 
                <img src="<c:url value='/assets/user/images/banner2.png'/>" alt="Promo 2" class="w-full h-40 object-cover rounded-t-lg" />
            </div>
            <div class="bg-white rounded-lg shadow-md">
                <img src="<c:url value='/assets/user/images/banner1.png'/>" alt="Promo 3" class="w-full h-40 object-cover rounded-t-lg" />
            </div>
        </div>
    </section>  
    
    <!-- Sản phẩm theo loại -->
    <c:forEach var="category" items="${categories}">
	    <section class="container mx-auto py-8" style="max-width: 1200px">
	        <div class="items-center mb-6">
	            <h2 class="text-3xl font-bold text-center">${category.tenLoaiSP}</h2>
	        </div>
	        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
	            <c:set var="productCount" value="0" />
	            <c:forEach var="sanPham" items="${allProducts}">
	                <c:if test="${sanPham.idLoaiSP == category.idLoaiSP && productCount < 4}">
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
	                           <h3 class="text-lg font-semibold" style="height: 56px; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden; text-overflow: ellipsis; line-height: 28px;">${sanPham.tenSanPham}</h3>
	                            <div style="display: flex; align-items: center; gap: 12px">
	                                <p class="text-red-500 font-bold">
	                                    <fmt:formatNumber value="${sanPham.gia}" type="currency" currencySymbol="₫" groupingUsed="true"/>
	                                </p>
	                            </div>
	                        </div>
	                    </a>
	                    <c:set var="productCount" value="${productCount + 1}" />
	                </c:if>
	            </c:forEach>
	            <c:if test="${productCount == 0}">
	                <p class="text-center text-gray-500 col-span-4">Không có sản phẩm nào thuộc danh mục này.</p>
	            </c:if>
	        </div>
	        <div class="flex justify-center mt-6">
	            <a href='<c:url value="/san-pham?idLoaiSP=${category.idLoaiSP}" />' class="custom-hover-blue">
				    Xem tất cả →
				</a>
	        </div>
	    </section>
	</c:forEach>
    <!--  -->

    <section class="container mx-auto py-8" style="max-width: 1200px">
        <img src="<c:url value='/assets/user/images/banner-home-bottom.jpeg'/>" class="mx-auto" alt="" />
    </section> 

    <!-- Newsfeed Section -->
    <section class="container mx-auto py-8" style="max-width: 1200px">
        <div class="items-center mb-6">
            <h2 class="text-3xl font-bold text-center">Tin tức</h2>
        </div>
        <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
            <div class="bg-white rounded-lg shadow-md overflow-hidden">
                <img src="<c:url value='/assets/user/images/new1.jpeg'/>" alt="Sony WF-710N" class="w-full h-48 object-cover" />
                <div class="p-4"> 
                    <h3 class="text-lg font-semibold" style="height: 60px">
                        5 Lý do nên mua Sony WF-710N đang được giảm giá
                    </h3>
                    <p class="text-gray-600 text-sm mt-2">29/05/2025</p>
                </div>
            </div>
            <div class="bg-white rounded-lg shadow-md overflow-hidden">
                <img src="<c:url value='/assets/user/images/new2.jpeg'/>" alt="Sinh Nhật Hải Phòng" class="w-full h-48 object-cover" />
                <div class="p-4">
                    <h3 class="text-lg font-semibold" style="height: 60px">
                        Sinh Nhật Hải Phòng, ShopDunk chơi lớn!...
                    </h3>
                    <p class="text-gray-600 text-sm mt-2">28/05/2025</p>
                </div>
            </div>
            <div class="bg-white rounded-lg shadow-md overflow-hidden"> 
                <img src="<c:url value='/assets/user/images/new3.jpeg'/>" alt="iPad Hoc" class="w-full h-48 object-cover" />
                <div class="p-4">
                    <h3 class="text-lg font-semibold" style="height: 60px">
                        5 Ứng dụng giáo dục nên dùng trên iPad - Học ngon hơn cả sư!
                    </h3>
                    <p class="text-gray-600 text-sm mt-2">28/05/2025</p>
                </div>
            </div>
        </div>
        <div class="flex justify-center mt-6">
            <a
                href="#"
                class="inline-block px-12 py-1.5 border border-blue-500 text-blue-500 rounded-md hover:underline"
            >
                Xem tất cả Tin tức →
            </a>
        </div>
    </section>
 
    <script src="<c:url value='/assets/user/js/main.js'/>"></script>
</body>