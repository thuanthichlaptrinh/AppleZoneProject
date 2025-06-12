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
        .search-container-1{max-width:1200px;margin:20px auto;padding:20px;border:1px solid #e5e7eb;border-radius:8px;background:#fff;text-align:center;}
        .search-input{padding:8px;border:1px solid #d1d5db;border-radius:4px;}
        .search-btn{background:#2563eb;color:#fff;padding:8px 16px;border:none;border-radius:4px;cursor:pointer;}
        .search-btn:hover{background:#1d4ed8;}
        .filters{display:flex;gap:20px;justify-content:center;margin:10px 0;color:#6b7280;}
        .rating-bar{background:#d1d5db;height:10px;border-radius:5px;overflow:hidden;position:relative;display:flex;align-items:center;}
        .rating-bar-fill{background:#faa614;height:100%;border-radius:5px;position:absolute;top:0;left:0;}
        .rating-star{position:absolute;left:-12px;color:#f59e0b;font-size:16px;}
    </style>
</head>
<body class="bg-gray-100"> 
    <div class="items-center mb-6 mt-9">
        <h3 class="text-2xl text-center">${categoryName}</h3>
    </div>
    <!-- Search Section -->
    <section class="search-container-1">
        <form action="<c:url value='/tim-kiem' />" method="get">
            <p style="text-align: left">Tìm trong khoá:</p>
            <input type="text" name="keyword" value="${param.keyword}" class="p-2 w-full" placeholder="Nhập từ khóa..." style="border-radius: 6px; border: 1px solid #EBEBEB; outline: none" />
            <button type="submit" class="search-btn mt-4 px-8" style="font-size: 12px">TÌM KIẾM</button>
        </form> 
    </section>
    
    <div class="mx-auto mb-6 mt-8" style="max-width: 1200px">
        <form action="<c:url value='/tim-kiem' />" method="get" style="display: flex; align-items: center; gap: 10px;">
            <span style="font-size: 14px">Sắp xếp theo</span>
            <input type="hidden" name="keyword" value="${param.keyword}" />
            <select name="sort" onchange="this.form.submit()" style="border-radius: 6px; border: 1px solid #EBEBEB; padding: 6px">
                <option value="" ${empty selectedSort ? 'selected' : ''}>Mới nhất</option>
                <option value="price_asc" ${selectedSort == 'price_asc' ? 'selected' : ''}>Giá thấp đến cao</option>
                <option value="price_desc" ${selectedSort == 'price_desc' ? 'selected' : ''}>Giá cao đến thấp</option>
            </select>
        </form>
    </div>

    <!-- Products Section -->
    <section class="container mx-auto py-8" style="max-width:1200px;padding-top:8px;">
        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
            <c:choose>
                <c:when test="${not empty products}">
                    <c:forEach var="sanPham" items="${products}">
                        <a href='<c:url value="/chi-tiet-san-pham?idSanPham=${sanPham.idSanPham}" />' class="product-card bg-white rounded-lg shadow-md relative">
                            <span class="discount-label">Giảm 3%</span>
                            <c:if test="${sanPham.moi}">
                                <span class="new-label">Mới</span>
                            </c:if>
                            <img src="<c:url value='${sanPham.hinhAnh}'/>" alt="${sanPham.tenSanPham}" class="w-full h-48 object-cover mt-6 mb-4" style="height:240px;object-fit:contain" />
                            <div class="p-4">
                                <h3 class="text-lg font-semibold" style="height:56px;display:-webkit-box;-webkit-line-clamp:2;-webkit-box-orient:vertical;overflow:hidden;text-overflow:ellipsis;line-height:28px;">
                                    ${sanPham.tenSanPham}
                                </h3>
                                <div style="display:flex;align-items:center;gap:12px">
                                    <p class="text-red-500 font-bold">
                                        <fmt:formatNumber value="${sanPham.gia}" type="currency" currencySymbol="₫" groupingUsed="true"/>
                                    </p>
                                </div>
                            </div>
                        </a>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <p class="text-center text-gray-500 col-span-4">Không có sản phẩm nào khớp với từ khóa "${param.keyword}".</p>
                </c:otherwise>	
            </c:choose>
        </div>
    </section>

    <script src="<c:url value='/assets/user/js/main.js'/>"></script>
    <script>
        function changeSlide(n) {
            // Existing carousel logic (if needed)
        }
        function goToSlide(n) {
            // Existing carousel logic (if needed)
        }
        
        let timeout;
        document.querySelector('input[name="keyword"]').addEventListener('input', function() {
            clearTimeout(timeout);
            timeout = setTimeout(() => {
                const keyword = this.value.trim();
                if (keyword) window.location.href = '<c:url value="/tim-kiem?keyword=" />' + encodeURIComponent(keyword);
            }, 300);
        });
    </script>
</body>
</html>