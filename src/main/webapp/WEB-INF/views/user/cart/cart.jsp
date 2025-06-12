<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Giỏ hàng - AppleZone E-Commerce</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" />
        <link href="<c:url value='/assets/user/css/index.css'/>" rel="stylesheet" />  
        <style>
            .hiddenDrop { display: none; }
            .login-container:hover .hiddenDrop { display: block; }
            .color-option {
                width: 24px; height: 24px; border-radius: 50%; border: 2px solid transparent; cursor: pointer; transition: all 0.2s;
            }
            .color-option.selected { border-color: #3b82f6; box-shadow: 0 0 0 2px #dbeafe; }
            .color-option:hover { transform: scale(1.1); }
            .product-card { background: white; border-radius: 12px; padding: 20px; box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1); }
            .quantity-btn {
                width: 28px; height: 28px; border: 1px solid #d1d5db; background: #f9fafb;
                display: flex; align-items: center; justify-content: center; cursor: pointer; transition: all 0.2s;
            }
            .quantity-btn:hover { background: #e5e7eb; }
            .quantity-input { width: 28px; height: 28px; text-align: center; border: 1px solid #d1d5db; border-left: none; border-right: none; }
            .btn-primary { background: #2563eb; color: white; padding: 12px 24px; border-radius: 8px; font-weight: 500; transition: all 0.2s; border: none; cursor: pointer; width: 100%; }
            .btn-primary:hover { background: #1d4ed8; }
            .qr-code-container { display: none; margin-top: 20px; text-align: center; }
            .qr-code-container img { max-width: 150px; height: auto; margin-bottom: 10px; }
            .qr-code-container p { color: #374151; font-size: 14px; margin: 5px 0; }
            .discount-section { display: none; margin-top: 10px; }
            .discount-section input { width: 70%; padding: 8px; border: 1px solid #d1d5db; border-right: none; border-radius: 4px 0 0 4px; }
            .discount-section button { width: 30%; padding: 8px; background-color: #d1d5db; border: 1px solid #d1d5db; border-radius: 0 4px 4px 0; cursor: pointer; }
            .discount-section button:hover { background-color: #b3b7bc; }
        </style>
    </head>
    <body class="bg-gray-100" style="font-family: 'Roboto', sans-serif">
        <main class="container mx-auto py-4" style="width: 600px">
            <!-- Breadcrumb -->
            <div class="flex items-center justify-between mb-4 text-sm text-gray-600">
                <a href="<c:url value='/trang-chu'/>" class="hover:text-blue-600">
                    <i class="fas fa-arrow-left mr-2"></i>
                    Về trang chủ AppleZone
                </a>
                <span class="text-gray-800 font-medium">Giỏ hàng của anh ${user.tenNguoiDung}</span>
            </div>

            <!-- Products List -->
            <div class="lg:col-span-2">
                <div class="product-card pr-8">
                    <c:if test="${not empty error}">
                        <p class="text-center text-red-500">${error}</p>
                    </c:if>
                    <c:if test="${not empty status}">
                        <p class="text-center text-red-500">${status}</p>
                    </c:if>
                    <c:if test="${not empty cartItems}">
                    <c:forEach var="item" items="${cartItems}" varStatus="loop">
                        <div class="flex items-start space-x-4 py-4" id="product-${loop.index}">
                            <div class="w-20 rounded-lg flex flex-col items-center justify-center" style="height: 100px">
                                <img src="<c:url value='${item.hinhAnh}'/>" class="flex items-center justify-center" alt="${item.tenSanPham}" />
                                <form action="<c:url value='/remove-from-cart'/>" method="post">
                                    <input type="hidden" name="idGioHang" value="${item.idGioHang}" />
                                    <button type="submit" class="text-xs text-gray-500 cursor-pointer" onclick="return confirm('Bạn có chắc muốn xóa sản phẩm này khỏi giỏ hàng?');">✕ Xóa</button>
                                </form>
                            </div>
                            <div class="flex-1">
                                <h3 class="text-sm text-gray-800 mb-2">${item.tenSanPham}</h3>
                                <div class="mb-3">
                                    <span class="text-xs text-gray-600">Màu sắc: </span>
                                    <span class="text-xs font-medium text-gray-800">Space Gray</span>
                                </div>
                                <div class="flex items-center space-x-2">
                                    <div class="flex space-x-2">
                                        <div class="color-option" style="background-color: #1a1a1a" title="Midnight"></div>
                                        <div class="color-option" style="background-color: #c0c0c0" title="Silver"></div>
                                        <div class="color-option selected" style="background-color: #4a5568" title="Space Gray"></div>
                                        <div class="color-option" style="background-color: #f5f5f0" title="Starlight"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="flex flex-col items-center justify-between" style="height: 100px">
                                <div class="flex items-center">
                                    <form action="<c:url value='/update-cart-quantity'/>" method="post">
                                        <input type="hidden" name="idGioHang" value="${item.idGioHang}" />
                                        <input type="hidden" name="action" value="decrease" />
                                        <button type="submit" class="quantity-btn" ${item.soLuong <= 1 ? 'disabled' : ''}>−</button>
                                    </form>
                                    <input type="text" class="quantity-input" value="${item.soLuong}" id="qty-${loop.index}" readonly />
                                    <form action="<c:url value='/update-cart-quantity'/>" method="post">
                                        <input type="hidden" name="idGioHang" value="${item.idGioHang}" />
                                        <input type="hidden" name="action" value="increase" />
                                        <button type="submit" class="quantity-btn">+</button>
                                    </form>
                                </div>
                                <div>
                                    <span class="font-bold"><fmt:formatNumber value="${item.tongTien}" type="number" pattern="#,##0"/>₫</span>
                                </div>
                            </div>
                        </div>
                        <c:if test="${not loop.last}"><hr /></c:if>
                    </c:forEach>
                </c:if>

                    <!-- Summary -->
                    <div class="bg-white rounded-lg py-6 px-2 mt-6 pb-3">
                        <div class="flex justify-between items-center text-lg font-semibold">
                            <span>Tạm tính (<c:out value="${cartItems != null ? cartItems.size() : 0}"/> sản phẩm):</span>
                            <span class="text-red-600" id="total-price">
                                <fmt:formatNumber value="${totalAmount}" type="number" pattern="#,##0"/>₫
                            </span>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Customer Info -->
            <div class="lg:col-span-1 mt-2">
                <div class="bg-white p-6 sticky top-24">
                    <div>
                        <h3 class="text-lg font-semibold mb-4">Thông tin khách hàng</h3>
                        <div class="text-sm text-gray-600">
                            <span>Anh </span>
                            <span class="font-medium text-gray-800">${user.tenNguoiDung}</span>
                            <span> - ${user.sdt}</span>
                            <a href="#" class="text-blue-600 hover:text-blue-800 ml-2">Sửa</a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Order Summary -->
            <div class="lg:col-span-1 mt-2">
                <div class="bg-white rounded-lg p-6 sticky top-24">
                    <!-- Delivery Options -->
                    <div class="mb-6">
                        <h3 class="text-lg font-semibold mb-4">Hình thức nhận hàng</h3>
                        <div>
                            <label class="flex items-center">
                                <input type="radio" name="delivery" value="home" class="mr-3" />
                                <span class="text-sm">Giao tận nơi</span>
                            </label>
                            <label class="flex items-center mt-2">
                                <input type="radio" name="delivery" value="store" class="mr-3" checked />
                                <span class="text-sm">Nhận tại cửa hàng</span>
                            </label>
                        </div>

                        <div class="mt-4 p-3 bg-blue-50 rounded-lg">
                            <div class="flex items-center mb-2">
                                <input type="radio" name="store" value="hn3" class="mr-2" checked />
                                <span class="text-sm font-medium">SHOPTHUAN (172 Le Trong Tan)</span>
                            </div>
                            <a href="#" class="text-xs text-blue-600 hover:text-blue-800">Thêm địa chỉ khác</a>
                        </div>

                        <div class="mt-4">
                            <textarea
                                placeholder="Nhập ghi chú (nếu có)"
                                class="w-full p-3 border border-gray-300 rounded-lg text-sm resize-none"
                                rows="3"
                                style="height: 50px"
                                id="orderNote"
                            ></textarea>
                        </div>

                        <div class="mt-4">
                            <label class="flex items-start">
                                <input type="checkbox" class="mr-2 mt-1" id="invoiceCheckbox" />
                                <span class="text-xs text-gray-600">Xuất hóa đơn công ty</span>
                            </label>
                        </div>
                    </div>

                    <!-- Payment Options -->
                    <div class="mb-6">
                        <h3 class="text-lg font-semibold mb-4">Hình thức thanh toán</h3>
                        <div>
                            <label class="flex items-center">
                                <input
                                    type="radio"
                                    name="payment"
                                    value="cod"
                                    class="mr-3"
                                    checked
                                    onchange="toggleQRCode()"
                                />
                                <span class="text-sm">Thanh toán khi nhận hàng</span>
                            </label>
                            <label class="flex items-center mt-2">
                                <input
                                    type="radio"
                                    name="payment"
                                    value="online"
                                    class="mr-3"
                                    onchange="toggleQRCode()"
                                />
                                <span class="text-sm">Thanh toán trực tuyến</span>
                            </label>
                        </div>
                        <div
                            id="qr-code"
                            class="qr-code-container"
                            style="border: 1px solid #e1e1e1; padding: 10px; border-radius: 4px"
                        >
                            <p style="text-align: left">Số tài khoản: 0783363383</p>
                            <p style="text-align: left">Ngân hàng: MB Bank</p>
                            <p style="text-align: left">Chủ tài khoản: Ngô Minh Thuận</p>
                            <img src="/assets/images/qrcode.jpg" class="block mx-auto" alt="QR Code" />
                            <p style="text-align: center">Dùng ứng dụng để quét mã QR để chuyển khoảng</p>
                        </div>
                    </div>

                    <!-- Discount Code -->
                    <div class="mb-6">
                        <div
                            class="flex items-center p-3 bg-blue-50 rounded-lg cursor-pointer"
                            onclick="toggleDiscountSection()"
                        >
                            <i class="fas fa-tag text-blue-600 mr-2"></i>
                            <span class="text-sm text-blue-600 font-medium">Sử dụng mã giảm giá</span>
                        </div>
                        <div id="discount-section" class="discount-section">
                            <input type="text" id="discount-code" placeholder="Mã giảm giá" />
                            <button onclick="applyDiscount()">Áp dụng</button>
                        </div>
                    </div>

                    <!-- Total -->
                    <div class="mb-6">
                        <div class="flex justify-between items-center text-lg font-bold">
                            <span>Tổng tiền:</span>
                            <span class="text-red-600" id="final-total">
                                <fmt:formatNumber value="${totalAmount}" type="number" pattern="#,##0"/>₫
                            </span>
                        </div>
                    </div>

                    <!-- Terms -->
                    <div class="mb-6">
                        <label class="flex items-start text-sm">
                            <input type="checkbox" class="mr-2 mt-1" checked id="termsCheckbox" />
                            <span class="text-gray-600">
                                Tôi đã đọc và đồng ý với
                                <a href="#" class="text-blue-600 hover:text-blue-800">điều khoản và điều kiện</a>
                                <a href="#" class="text-blue-600 hover:text-blue-800">điều khoản và điều kiện của website</a>
                            </span>
                        </label>
                    </div>

                    <!-- Order Form -->
                    <form action="<c:url value='/process-order'/>" method="post" id="orderForm">
                        <input type="hidden" name="deliveryMethod" id="deliveryMethod" value="store" />
                        <input type="hidden" name="storeLocation" id="storeLocation" value="hn3" />
                        <input type="hidden" name="paymentMethod" id="paymentMethod" value="cod" />
                        <input type="hidden" name="orderNote" id="hiddenOrderNote" />
                        <input type="hidden" name="invoice" id="invoice" value="false" />
                        <button type="submit" class="btn-primary" id="orderButton" onclick="return validateOrder()">Tiến hành đặt hàng</button>
                    </form>

                    <p class="text-xs text-gray-500 text-center mt-3">
                        Bạn có thể lựa chọn các hình thức thanh toán ở bước sau
                    </p>
                </div>
            </div>
        </main>

        <script>
            function toggleQRCode() {
                const paymentMethod = document.querySelector('input[name="payment"]:checked').value;
                const qrCodeContainer = document.getElementById('qr-code');
                qrCodeContainer.style.display = paymentMethod === 'online' ? 'block' : 'none';
                document.getElementById('paymentMethod').value = paymentMethod;
            }

            function toggleDiscountSection() {
                const discountSection = document.getElementById('discount-section');
                discountSection.style.display = discountSection.style.display === 'none' ? 'flex' : 'none';
            }

            function applyDiscount() {
                const discountCode = document.getElementById('discount-code').value;
                let discount = 0;
                if (discountCode === 'DISCOUNT50') {
                    discount = 16500000;
                } else {
                    alert('Mã giảm giá không hợp lệ!');
                    return;
                }
                alert('Mã giảm giá đã được áp dụng!');
            }

            document.querySelectorAll('.color-option').forEach(option => {
                option.addEventListener('click', function() {
                    this.parentNode.querySelectorAll('.color-option').forEach(sibling => sibling.classList.remove('selected'));
                    this.classList.add('selected');
                });
            });

            function validateOrder() {
                const termsCheckbox = document.getElementById('termsCheckbox');
                if (!termsCheckbox.checked) {
                    alert('Vui lòng đồng ý với điều khoản và điều kiện!');
                    return false;
                }

                const deliveryMethod = document.querySelector('input[name="delivery"]:checked');
                document.getElementById('deliveryMethod').value = deliveryMethod ? deliveryMethod.value : 'store';

                const storeLocation = document.querySelector('input[name="store"]:checked');
                document.getElementById('storeLocation').value = storeLocation ? storeLocation.value : 'hn3';

                const paymentMethod = document.querySelector('input[name="payment"]:checked');
                document.getElementById('paymentMethod').value = paymentMethod ? paymentMethod.value : 'cod';

                const orderNote = document.getElementById('orderNote').value;
                document.getElementById('hiddenOrderNote').value = orderNote;

                const invoiceCheckbox = document.getElementById('invoiceCheckbox');
                document.getElementById('invoice').value = invoiceCheckbox.checked ? 'true' : 'false';

                return true;
            }

            // Update delivery method on radio change
            document.querySelectorAll('input[name="delivery"]').forEach(radio => {
                radio.addEventListener('change', function() {
                    document.getElementById('deliveryMethod').value = this.value;
                });
            });

            // Update store location on radio change
            document.querySelectorAll('input[name="store"]').forEach(radio => {
                radio.addEventListener('change', function() {
                    document.getElementById('storeLocation').value = this.value;
                });
            });
        </script>
    </body>
</html>