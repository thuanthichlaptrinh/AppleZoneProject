<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    <!DOCTYPE html>
    <html lang="en">
        <head>
            <meta charset="UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <link href="https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css" rel="stylesheet" />
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
            <link rel="stylesheet" href="<c:url value='/assets/admin/style.css' />" /> 
            <link rel="stylesheet" href="<c:url value='/assets/admin/products.css' />" />
            <script src="https://cdn.ckeditor.com/4.22.1/standard/ckeditor.js"></script>
            <style>
                header {display: none}
                footer {display: none}
                #cke_notifications_area_moTa { display: none !important} 
                .btn {
                    padding: 10px 20px;
                    background-color: #007bff;
                    color: white;
                    border: none;
                    border-radius: 4px;
                    cursor: pointer;
                    margin-right: 5px;
                }
                .btn:hover { background-color: #0056b3; }
                .btn-danger { background-color: #dc3545; }
                .btn-danger:hover { background-color: #c82333; }
                .btn-approve { background-color: #28a745; padding: 5px 10px; font-size: 12px; }
                .btn-approve:hover { background-color: #218838; }
                .btn-complete { background-color: #17a2b8; padding: 5px 10px; font-size: 12px; }
                .btn-complete:hover { background-color: #138496; }
                .btn-edit { background-color: #ffc107; padding: 5px 10px; font-size: 12px; }
                .btn-edit:hover { background-color: #e0a800; }
                .modal {
                    display: none;
                    position: fixed;
                    top: 0;
                    left: 0;
                    width: 100%;
                    height: 100%;
                    background-color: rgba(0, 0, 0, 0.5);
                    z-index: 1000;
                }
                .modal-content {
                    background-color: white;
                    margin: 40px auto;
                    padding: 20px;
                    width: 90%;
                    max-width: 900px;
                    border-radius: 5px;
                    position: relative;
                    max-height: 80vh;
                    overflow-y: auto;
                    padding-top: 0;
                }
                .modal-header {
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    border-bottom: 1px solid #ddd;
                    padding-bottom: 10px;
                    position: sticky;
                    top: 0;
                    background-color: white;
                    z-index: 1;
                }
                .close { cursor: pointer; font-size: 24px; color: #888; }
                .close:hover { color: #000; }
                .modal-body { padding-top: 20px; }
                .form-group1 { margin-bottom: 15px; width: 100%; }
                .form-row { display: flex; gap: 20px; margin-bottom: 15px; }
                .form-control {
                    width: 100%;
                    padding: 8px;
                    border: 1px solid #ddd;
                    border-radius: 4px;
                    box-sizing: border-box;
                }
                .full-width { width: 100%; }
                .alert { padding: 10px; margin-top: 10px; border-radius: 4px; }
                .alert-danger { background-color: #f8d7da; color: #721c24; }
                .alert-success { background-color: #d4edda; color: #155724; }
                .order-detail-item { display: flex; gap: 10px; margin-bottom: 10px; align-items: center; }
                .order-detail-item select, .order-detail-item input { flex: 1; }
                .order-detail-item .btn-danger { padding: 8px; font-size: 12px; }
            </style>
            <title>Trang admin</title>
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
                    <li><a href="<c:url value="/loai-san-pham-admin" />"><i class="fa-solid fa-layer-group icon"></i> Quản lý danh mục</a></li>
                    <li><a href="<c:url value="/don-hang-admin" />" class="active"><i class="fa-solid fa-briefcase icon"></i> Quản lý đơn hàng</a></li>
                      <li><a href="<c:url value="nha-cung-cap-admin" />"><i class="fa-solid fa-comment icon"></i> Quản lý nhà cung cấp</a></li> 
                </ul>
            </section>
            <!-- SIDEBAR -->

            <!-- NAVBAR -->
            <section id="content">
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

                <main>
                    <h1 class="title">Quản lý Đơn hàng</h1> 
                    <div style="justify-content: space-between; display: flex; align-items: center;">
                        <ul class="breadcrumbs">
                            <li><a href="<c:url value='/quan-tri'/>">Home</a></li>
                            <li class="divider">/</li>
                            <li><a href="#" class="active">Đơn hàng</a></li>
                        </ul> 
                        <button id="openModalBtn" class="btn btn-primary" style="font-size: 14px">Thêm mới</button>
                    </div> 
                    <c:if test="${not empty error}">
                        <div class="alert alert-danger">${error}</div>
                    </c:if>
                    <div class="container">
                        <div class="card">
                            <div class="card-header">
                                <h6>Danh sách Đơn hàng</h6>
                            </div>
                            <div class="table-wrapper">
                                <table class="authors-table">
                                    <thead>
                                        <tr> 
                                            <th>Mã Đơn hàng</th>
                                            <th>Ngày Đặt</th>
                                            <th>Tổng Tiền</th>
                                            <th>Trạng Thái</th>
                                            <th>Người Đặt</th>
                                            <th>Thao tác</th>	
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:if test="${not empty donHangs}">
                                            <c:forEach var="donHang" items="${donHangs}" varStatus="loop">
                                                <tr> 
                                                    <td>${donHang.idDonHang}</td>
                                                    <td><fmt:formatDate value="${donHang.ngayDat}" pattern="dd/MM/yyyy HH:mm" /></td>
                                                    <td><fmt:formatNumber value="${donHang.tongTien}" type="number" pattern="#,##0"/>₫</td>
                                                    <td>
                                                        <span class="status-${donHang.trangThai == 'Hoàn thành' ? 'completed' : donHang.trangThai == 'Đã hủy' ? 'cancelled' : 'pending'}">
                                                            ${donHang.trangThai}
                                                        </span>
                                                    </td>
                                                    <td>
                                                        <small>
                                                            <c:choose>
                                                                <c:when test="${empty nguoiDungList or empty donHang.idNguoiDung}">
                                                                    Không xác định
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <c:forEach var="user" items="${nguoiDungList}">
                                                                        <c:if test="${user.idNguoiDung == donHang.idNguoiDung}">${user.tenNguoiDung}</c:if>
                                                                    </c:forEach>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </small>
                                                    </td>
                                                    <td>
                                                    <!-- 
                                                        <button class="edit-link" data-id="${donHang.idDonHang}"><i class="fa-solid fa-pen-to-square"></i></button>
                                                        <button class="delete-link" data-id="${donHang.idDonHang}"><i class="fa-solid fa-trash"></i></button>  -->
                                                        <c:if test="${donHang.trangThai == 'Chờ duyệt'}">
                                                            <button class="btn btn-approve approve-btn" data-id="${donHang.idDonHang}">Duyệt</button>
                                                        </c:if>
                                                        <c:if test="${donHang.trangThai == 'Chờ giao'}">
                                                            <button class="btn btn-complete complete-btn" data-id="${donHang.idDonHang}">Hoàn tất</button>
                                                        </c:if>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:if>
                                        <c:if test="${empty donHangs}">
                                            <tr>
                                                <td colspan="7" class="text-center text-gray-500">Không có đơn hàng nào.</td>
                                            </tr>
                                        </c:if>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <!-- Modal thêm đơn hàng -->
                    <div id="addOrderModal" class="modal">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h2>Thêm Đơn Hàng Mới</h2>
                                <span class="close">×</span>
                            </div>
                            <div class="modal-body">
                                <form id="addOrderForm">
                                    <div class="form-row">
                                        <div class="form-group1">
                                            <label for="idNguoiDung">Người đặt hàng:</label>
                                            <select id="idNguoiDung" name="idNguoiDung" class="form-control" required>
                                                <option value="">Chọn người dùng</option>
                                                <c:forEach var="user" items="${nguoiDungList}">
                                                    <option value="${user.idNguoiDung}">${user.tenNguoiDung} (${user.email})</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="form-group1">
                                            <label for="tongTien">Tổng tiền:</label>
                                            <input type="number" id="tongTien" name="tongTien" class="form-control" step="0.01" readonly required />
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group1">
                                            <label for="trangThai">Trạng thái:</label>
                                            <select id="trangThai" name="trangThai" class="form-control" required>
                                                <option value="Chờ duyệt">Chờ duyệt</option>
                                                <option value="Chờ giao">Chờ giao</option>
                                                <option value="Hoàn thành">Hoàn thành</option>
                                                <option value="Đã hủy">Đã hủy</option>
                                            </select>
                                        </div>
                                        <div class="form-group1">
                                            <label for="diaChi">Địa chỉ giao hàng:</label>
                                            <input type="text" id="diaChi" name="diaChi" class="form-control" required />
                                        </div>
                                    </div>
                                    <div class="form-group1">
                                        <label for="ngayGiao">Ngày giao (tùy chọn):</label>
                                        <input type="datetime-local" id="ngayGiao" name="ngayGiao" class="form-control" />
                                    </div>
                                    <div class="form-group1">
                                        <label>Chi tiết đơn hàng:</label>
                                        <div id="orderDetails">
                                            <div class="order-detail-item">
                                                <select name="idSanPham[]" class="form-control product-select" required>
                                                    <option value="">Chọn sản phẩm</option>
                                                    <c:forEach var="product" items="${products}">
                                                        <option value="${product.idSanPham}" data-gia-ban="${product.gia}">${product.tenSanPham} (Giá: ${product.gia}₫)</option>
                                                    </c:forEach>
                                                </select>
                                                <input type="number" name="soLuong[]" class="form-control so-luong" placeholder="Số lượng" min="1" required />
                                                <input type="number" name="gia[]" class="form-control gia-ban" placeholder="Giá bán" step="0.01" required readonly />
                                                <button type="button" class="btn btn-danger remove-detail">Xóa</button>
                                            </div>
                                        </div>
                                        <button type="button" id="addDetailBtn" class="btn">Thêm sản phẩm</button>
                                    </div>
                                    <button type="submit" class="btn btn-primary full-width">Thêm đơn hàng</button>
                                </form>
                                <div id="formMessage" class="alert" style="display: none;"></div>
                            </div>
                        </div>
                    </div>

                    <!-- Modal chỉnh sửa đơn hàng -->
                    <div id="editOrderModal" class="modal">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h2>Sửa Đơn Hàng</h2>
                                <span class="close">×</span>
                            </div>
                            <div class="modal-body">
                                <form id="editOrderForm">
                                    <input type="hidden" id="editIdDonHang" name="idDonHang">
                                    <div class="form-row">
                                        <div class="form-group1">
                                            <label for="editIdNguoiDung">Người đặt hàng:</label>
                                            <select id="editIdNguoiDung" name="idNguoiDung" class="form-control" required>
                                                <option value="">Chọn người dùng</option>
                                                <c:forEach var="user" items="${nguoiDungList}">
                                                    <option value="${user.idNguoiDung}">${user.tenNguoiDung} (${user.email})</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="form-group1">
                                            <label for="editTongTien">Tổng tiền:</label>
                                            <input type="number" id="editTongTien" name="tongTien" class="form-control" step="0.01" readonly required />
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group1">
                                            <label for="editTrangThai">Trạng thái:</label>
                                            <select id="editTrangThai" name="trangThai" class="form-control" required>
                                                <option value="Chờ duyệt">Chờ duyệt</option>
                                                <option value="Chờ giao">Chờ giao</option>
                                                <option value="Hoàn thành">Hoàn thành</option>
                                                <option value="Đã hủy">Đã hủy</option>
                                            </select>
                                        </div>
                                        <div class="form-group1">
                                            <label for="editDiaChi">Địa chỉ giao hàng:</label>
                                            <input type="text" id="editDiaChi" name="diaChi" class="form-control" required />
                                        </div>
                                    </div>
                                    <div class="form-group1">
                                        <label for="editNgayGiao">Ngày giao (tùy chọn):</label>
                                        <input type="datetime-local" id="editNgayGiao" name="ngayGiao" class="form-control" />
                                    </div>
                                    <div class="form-group1">
                                        <label>Chi tiết đơn hàng:</label>
                                        <div id="editOrderDetails">
                                            <!-- Chi tiết sẽ được tải động khi mở modal -->
                                        </div>
                                        <button type="button" id="addEditDetailBtn" class="btn">Thêm sản phẩm</button>
                                    </div>
                                    <button type="submit" class="btn btn-primary full-width">Cập nhật đơn hàng</button>
                                </form>
                                <div id="editFormMessage" class="alert" style="display: none;"></div>
                            </div>
                        </div>
                    </div>
                </main>
            </section>

            <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
            <script src="<c:url value='/assets/admin/script.js' />"></script>
            <script>
                // Xử lý modal thêm
                const addModal = document.getElementById('addOrderModal');
                const openModalBtn = document.getElementById('openModalBtn');
                const closeAddModal = document.querySelector('#addOrderModal .close');

                openModalBtn.onclick = function() {
                    addModal.style.display = 'block';
                    document.getElementById('formMessage').style.display = 'none';
                    document.getElementById('addOrderForm').reset();
                    const orderDetails = document.getElementById('orderDetails');
                    orderDetails.innerHTML = `
                        <div class="order-detail-item">
                            <select name="idSanPham[]" class="form-control product-select" required>
                                <option value="">Chọn sản phẩm</option>
                                <c:forEach var="product" items="${products}">
                                    <option value="${product.idSanPham}" data-gia-ban="${product.gia}">${product.tenSanPham} (Giá: ${product.gia}₫)</option>
                                </c:forEach>
                            </select>
                            <input type="number" name="soLuong[]" class="form-control so-luong" placeholder="Số lượng" min="1" required />
                            <input type="number" name="gia[]" class="form-control gia-ban" placeholder="Giá bán" step="0.01" required readonly />
                            <button type="button" class="btn btn-danger remove-detail">Xóa</button>
                        </div>
                    `;
                    calculateTotal();
                    addEventListenersToDetails();
                };
                closeAddModal.onclick = function() {
                    addModal.style.display = 'none';
                };
                window.onclick = function(event) {
                    if (event.target == addModal) {
                        addModal.style.display = 'none';
                    }
                };

                // Xử lý modal sửa
                const editModal = document.getElementById('editOrderModal');
                const closeEditModal = document.querySelector('#editOrderModal .close');

                // Xử lý nút Sửa
                document.querySelectorAll('.edit-link').forEach(button => {
                    button.addEventListener('click', function(e) {
                        e.preventDefault();
                        const idDonHang = this.getAttribute('data-id');
                        fetch('<c:url value="/get-order-details/' + idDonHang + '" />', {
                            headers: {
                                'Content-Type': 'application/json',
                                'X-CSRF-Token': '${_csrf.token}'
                            }
                        })
                        .then(response => response.json())
                        .then(data => {
                            editModal.style.display = 'block';
                            document.getElementById('editIdDonHang').value = data.idDonHang;
                            document.getElementById('editIdNguoiDung').value = data.idNguoiDung;
                            document.getElementById('editTongTien').value = data.tongTien;
                            document.getElementById('editTrangThai').value = data.trangThai;
                            document.getElementById('editDiaChi').value = data.diaChi;
                            if (data.ngayGiao) {
                                document.getElementById('editNgayGiao').value = new Date(data.ngayGiao).toISOString().slice(0, 16);
                            }

                            const editOrderDetails = document.getElementById('editOrderDetails');
                            editOrderDetails.innerHTML = '';
                            data.chiTietDonHang.forEach(detail => {
                                const detailItem = document.createElement('div');
                                detailItem.className = 'order-detail-item';
                                detailItem.innerHTML = `
                                    <select name="idSanPham[]" class="form-control product-select" required>
                                        <option value="">Chọn sản phẩm</option>
                                        <c:forEach var="product" items="${products}">
                                            <option value="${product.idSanPham}" data-gia-ban="${product.gia}" ${detail.idSanPham == product.idSanPham ? 'selected' : ''}>
                                                ${product.tenSanPham} (Giá: ${product.gia}₫)
                                            </option>
                                        </c:forEach>
                                    </select>
                                    <input type="number" name="soLuong[]" class="form-control so-luong" value="${detail.soLuong}" min="1" required />
                                    <input type="number" name="gia[]" class="form-control gia-ban" value="${detail.giaBan}" step="0.01" required readonly />
                                    <button type="button" class="btn btn-danger remove-detail">Xóa</button>
                                `;
                                editOrderDetails.appendChild(detailItem);
                            });
                            calculateEditTotal();
                            addEditEventListenersToDetails();
                        })
                        .catch(error => console.error('Error fetching order details:', error));
                    });
                });

                closeEditModal.onclick = function() {
                    editModal.style.display = 'none';
                };
                window.onclick = function(event) {
                    if (event.target == editModal) {
                        editModal.style.display = 'none';
                    }
                };

                // Xử lý thêm/xóa chi tiết đơn hàng (thêm)
                document.getElementById('addDetailBtn').addEventListener('click', function() {
                    const orderDetails = document.getElementById('orderDetails');
                    const newDetail = document.createElement('div');
                    newDetail.className = 'order-detail-item';
                    newDetail.innerHTML = `
                        <select name="idSanPham[]" class="form-control product-select" required>
                            <option value="">Chọn sản phẩm</option>
                            <c:forEach var="product" items="${products}">
                                <option value="${product.idSanPham}" data-gia-ban="${product.gia}">${product.tenSanPham} (Giá: ${product.gia}₫)</option>
                            </c:forEach>
                        </select>
                        <input type="number" name="soLuong[]" class="form-control so-luong" placeholder="Số lượng" min="1" required />
                        <input type="number" name="gia[]" class="form-control gia-ban" placeholder="Giá bán" step="0.01" required readonly />
                        <button type="button" class="btn btn-danger remove-detail">Xóa</button>
                    `;
                    orderDetails.appendChild(newDetail);
                    addEventListenersToDetails();
                    calculateTotal();
                });

                // Xử lý thêm/xóa chi tiết đơn hàng (sửa)
                document.getElementById('addEditDetailBtn').addEventListener('click', function() {
                    const editOrderDetails = document.getElementById('editOrderDetails');
                    const newDetail = document.createElement('div');
                    newDetail.className = 'order-detail-item';
                    newDetail.innerHTML = `
                        <select name="idSanPham[]" class="form-control product-select" required>
                            <option value="">Chọn sản phẩm</option>
                            <c:forEach var="product" items="${products}">
                                <option value="${product.idSanPham}" data-gia-ban="${product.gia}">${product.tenSanPham} (Giá: ${product.gia}₫)</option>
                            </c:forEach>
                        </select>
                        <input type="number" name="soLuong[]" class="form-control so-luong" placeholder="Số lượng" min="1" required />
                        <input type="number" name="gia[]" class="form-control gia-ban" placeholder="Giá bán" step="0.01" required readonly />
                        <button type="button" class="btn btn-danger remove-detail">Xóa</button>
                    `;
                    editOrderDetails.appendChild(newDetail);
                    addEditEventListenersToDetails();
                    calculateEditTotal();
                });

                // Hàm thêm event listeners cho các chi tiết đơn hàng (thêm)
                function addEventListenersToDetails() {
                    document.querySelectorAll('#orderDetails .order-detail-item').forEach(item => {
                        const select = item.querySelector('.product-select');
                        const soLuong = item.querySelector('.so-luong');
                        const gia = item.querySelector('.gia-ban');
                        const removeBtn = item.querySelector('.remove-detail');

                        select.removeEventListener('change', handleProductChange);
                        soLuong.removeEventListener('input', calculateTotal);
                        gia.removeEventListener('input', calculateTotal);
                        removeBtn.removeEventListener('click', handleRemoveDetail);

                        select.addEventListener('change', handleProductChange);
                        soLuong.addEventListener('input', calculateTotal);
                        gia.addEventListener('input', calculateTotal);
                        removeBtn.addEventListener('click', handleRemoveDetail);
                    });
                }

                // Hàm thêm event listeners cho các chi tiết đơn hàng (sửa)
                function addEditEventListenersToDetails() {
                    document.querySelectorAll('#editOrderDetails .order-detail-item').forEach(item => {
                        const select = item.querySelector('.product-select');
                        const soLuong = item.querySelector('.so-luong');
                        const gia = item.querySelector('.gia-ban');
                        const removeBtn = item.querySelector('.remove-detail');

                        select.removeEventListener('change', handleEditProductChange);
                        soLuong.removeEventListener('input', calculateEditTotal);
                        gia.removeEventListener('input', calculateEditTotal);
                        removeBtn.removeEventListener('click', handleEditRemoveDetail);

                        select.addEventListener('change', handleEditProductChange);
                        soLuong.addEventListener('input', calculateEditTotal);
                        gia.addEventListener('input', calculateEditTotal);
                        removeBtn.addEventListener('click', handleEditRemoveDetail);
                    });
                }

                // Xử lý thay đổi sản phẩm (thêm)
                function handleProductChange() {
                    const selectedOption = this.options[this.selectedIndex];
                    const giaValue = parseFloat(selectedOption.getAttribute('data-gia-ban')) || 0;
                    const giaInput = this.parentElement.querySelector('.gia-ban');
                    giaInput.value = giaValue.toFixed(2);
                    calculateTotal();
                }

                // Xử lý thay đổi sản phẩm (sửa)
                function handleEditProductChange() {
                    const selectedOption = this.options[this.selectedIndex];
                    const giaValue = parseFloat(selectedOption.getAttribute('data-gia-ban')) || 0;
                    const giaInput = this.parentElement.querySelector('.gia-ban');
                    giaInput.value = giaValue.toFixed(2);
                    calculateEditTotal();
                }

                // Xử lý xóa chi tiết (thêm)
                function handleRemoveDetail() {
                    if (document.querySelectorAll('#orderDetails .order-detail-item').length > 1) {
                        this.parentElement.remove();
                        calculateTotal();
                    }
                }

                // Xử lý xóa chi tiết (sửa)
                function handleEditRemoveDetail() {
                    if (document.querySelectorAll('#editOrderDetails .order-detail-item').length > 1) {
                        this.parentElement.remove();
                        calculateEditTotal();
                    }
                }

                // Tính tổng tiền (thêm)
                function calculateTotal() {
                    let total = 0;
                    document.querySelectorAll('#orderDetails .order-detail-item').forEach(item => {
                        const soLuong = parseInt(item.querySelector('.so-luong').value) || 0;
                        const gia = parseFloat(item.querySelector('.gia-ban').value) || 0;
                        total += soLuong * gia;
                    });
                    document.getElementById('tongTien').value = total.toFixed(2);
                }

                // Tính tổng tiền (sửa)
                function calculateEditTotal() {
                    let total = 0;
                    document.querySelectorAll('#editOrderDetails .order-detail-item').forEach(item => {
                        const soLuong = parseInt(item.querySelector('.so-luong').value) || 0;
                        const gia = parseFloat(item.querySelector('.gia-ban').value) || 0;
                        total += soLuong * gia;
                    });
                    document.getElementById('editTongTien').value = total.toFixed(2);
                }

                // Áp dụng event listeners cho các phần tử hiện tại khi trang tải (thêm)
                addEventListenersToDetails();

                // Áp dụng event listeners cho các phần tử hiện tại khi trang tải (sửa)
                addEditEventListenersToDetails();

                // Xử lý gửi form (thêm)
                document.getElementById('addOrderForm').addEventListener('submit', function(e) {
                    e.preventDefault();
                    const formData = new FormData(this);
                    const orderData = {
                        idNguoiDung: formData.get('idNguoiDung'),
                        tongTien: parseFloat(formData.get('tongTien')),
                        trangThai: formData.get('trangThai'),
                        diaChi: formData.get('diaChi'),
                        ngayGiao: formData.get('ngayGiao') || null,
                        chiTietDonHang: []
                    };

                    const idSanPhams = formData.getAll('idSanPham[]');
                    const soLuongs = formData.getAll('soLuong[]');
                    const gias = formData.getAll('gia[]');

                    for (let i = 0; i < idSanPhams.length; i++) {
                        orderData.chiTietDonHang.push({
                            idSanPham: parseInt(idSanPhams[i]),
                            soLuong: parseInt(soLuongs[i]),
                            gia: parseFloat(gias[i])
                        });
                    }

                    fetch('<c:url value="/them-don-hang" />', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json',
                            'X-CSRF-Token': '${_csrf.token}'
                        },
                        body: JSON.stringify(orderData)
                    })
                    .then(response => {
                        if (response.ok) {
                            document.getElementById('formMessage').style.display = 'block';
                            document.getElementById('formMessage').className = 'alert alert-success';
                            document.getElementById('formMessage').innerText = 'Thêm đơn hàng thành công!';
                            setTimeout(() => {
                                window.location.href = '<c:url value="/don-hang-admin" />';
                            }, 1000);
                        } else {
                            return response.text();
                        }
                    })
                    .then(errorMessage => {
                        if (errorMessage) {
                            document.getElementById('formMessage').style.display = 'block';
                            document.getElementById('formMessage').className = 'alert alert-danger';
                            document.getElementById('formMessage').innerText = 'Lỗi: ' + errorMessage;
                        }
                    })
                    .catch(error => {
                        document.getElementById('formMessage').style.display = 'block';
                        document.getElementById('formMessage').className = 'alert alert-danger';
                        document.getElementById('formMessage').innerText = 'Lỗi khi thêm đơn hàng: ' + error.message;
                    });
                });

                // Xử lý gửi form (sửa)
                document.getElementById('editOrderForm').addEventListener('submit', function(e) {
                    e.preventDefault();
                    const formData = new FormData(this);
                    const orderData = {
                        idDonHang: formData.get('idDonHang'),
                        idNguoiDung: formData.get('idNguoiDung'),
                        tongTien: parseFloat(formData.get('tongTien')),
                        trangThai: formData.get('trangThai'),
                        diaChi: formData.get('diaChi'),
                        ngayGiao: formData.get('ngayGiao') || null,
                        chiTietDonHang: []
                    };

                    const idSanPhams = formData.getAll('idSanPham[]');
                    const soLuongs = formData.getAll('soLuong[]');
                    const gias = formData.getAll('gia[]');

                    for (let i = 0; i < idSanPhams.length; i++) {
                        orderData.chiTietDonHang.push({
                            idSanPham: parseInt(idSanPhams[i]),
                            soLuong: parseInt(soLuongs[i]),
                            gia: parseFloat(gias[i])
                        });
                    }

                    fetch('<c:url value="/sua-don-hang" />', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json',
                            'X-CSRF-Token': '${_csrf.token}'
                        },
                        body: JSON.stringify(orderData)
                    })
                    .then(response => {
                        if (response.ok) {
                            document.getElementById('editFormMessage').style.display = 'block';
                            document.getElementById('editFormMessage').className = 'alert alert-success';
                            document.getElementById('editFormMessage').innerText = 'Cập nhật đơn hàng thành công!';
                            setTimeout(() => {
                                window.location.href = '<c:url value="/don-hang-admin" />';
                            }, 1000);
                        } else {
                            return response.text();
                        }
                    })
                    .then(errorMessage => {
                        if (errorMessage) {
                            document.getElementById('editFormMessage').style.display = 'block';
                            document.getElementById('editFormMessage').className = 'alert alert-danger';
                            document.getElementById('editFormMessage').innerText = 'Lỗi: ' + errorMessage;
                        }
                    })
                    .catch(error => {
                        document.getElementById('editFormMessage').style.display = 'block';
                        document.getElementById('editFormMessage').className = 'alert alert-danger';
                        document.getElementById('editFormMessage').innerText = 'Lỗi khi cập nhật đơn hàng: ' + error.message;
                    });
                });

                // Xử lý nút Duyệt
                document.querySelectorAll('.approve-btn').forEach(button => {
                    button.addEventListener('click', function() {
                        const idDonHang = this.getAttribute('data-id');
                        if (confirm('Bạn có chắc chắn muốn duyệt đơn hàng này?')) {
                            fetch('<c:url value="/duyet-don-hang" />/' + idDonHang, {
                                method: 'POST',
                                headers: {
                                    'Content-Type': 'application/json',
                                    'X-CSRF-Token': '${_csrf.token}'
                                }
                            })
                            .then(response => {
                                if (response.ok) {
                                    alert('Đơn hàng đã được duyệt và chuyển sang Chờ giao!');
                                    location.reload();
                                } else {
                                    return response.text();
                                }
                            })
                            .then(errorMessage => {
                                if (errorMessage) {
                                    alert('Lỗi khi duyệt đơn hàng: ' + errorMessage);
                                }
                            })
                            .catch(error => {
                                alert('Lỗi khi duyệt đơn hàng: ' + error.message);
                            });
                        }
                    });
                });

                // Xử lý nút Hoàn tất
                document.querySelectorAll('.complete-btn').forEach(button => {
                    button.addEventListener('click', function() {
                        const idDonHang = this.getAttribute('data-id');
                        if (confirm('Bạn có chắc chắn muốn hoàn tất đơn hàng này?')) {
                            fetch('<c:url value="/hoan-tat-don-hang" />/' + idDonHang, {
                                method: 'POST',
                                headers: {
                                    'Content-Type': 'application/json',
                                    'X-CSRF-Token': '${_csrf.token}'
                                }
                            })
                            .then(response => {
                                if (response.ok) {
                                    alert('Đơn hàng đã được hoàn tất!');
                                    location.reload();
                                } else {
                                    return response.text();
                                }
                            })
                            .then(errorMessage => {
                                if (errorMessage) {
                                    alert('Lỗi khi hoàn tất đơn hàng: ' + error.message);
                                }
                            })
                            .catch(error => {
                                alert('Lỗi khi hoàn tất đơn hàng: ' + error.message);
                            });
                        }
                    });
                });
            </script>
        </body>
    </html>