<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="/WEB-INF/views/layouts/user/taglib.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="<c:url value='/assets/admin/style.css' />" />
    <link rel="stylesheet" href="<c:url value='/assets/admin/products.css' />" />
    <style>
        header { display: none }
        footer { display: none }
        .alert-danger { display: none }
    </style>
    <title>Quản lý Thanh Toán</title>
</head>
<body>
    <!-- SIDEBAR -->
    <section id="sidebar">
        <a href="#" class="brand"><i class="bx bxs-smile icon"></i> AppleZone</a>
        <ul class="side-menu">
            <li><a href="<c:url value='/quan-tri' />"><i class="fa-solid fa-gauge icon"></i> Thống kê</a></li>
            <li class="divider" data-text="main">Main</li>
            <li><a href="<c:url value='/nguoi-dung-admin' />"><i class="fa-solid fa-users-line icon"></i> Quản lý người dùng</a></li>
            <li><a href="<c:url value='/san-pham-admin' />"><i class="fa-solid fa-shirt icon"></i> Quản lý sản phẩm</a></li>
            <li><a href="<c:url value='/loai-san-pham-admin' />"><i class="fa-solid fa-layer-group icon"></i> Quản lý danh mục</a></li>
            <li><a href="<c:url value='/don-hang-admin' />"><i class="fa-solid fa-briefcase icon"></i> Quản lý đơn hàng</a></li>
            <li><a href="<c:url value='/nha-cung-cap-admin' />"><i class="fa-solid fa-comment icon"></i> Quản lý nhà cung cấp</a></li>
            <li><a href="<c:url value='/thanh-toan-admin' />" class="active"><i class="fa-solid fa-chart-area icon"></i> Quản lý thanh toán</a></li>
        </ul>
    </section>
    <!-- SIDEBAR -->

    <!-- NAVBAR -->
    <section id="content">
        <!-- NAVBAR -->
        <nav>
            <i class='bx bx-menu toggle-sidebar'></i>
            <form action="#">
                <div class="form-group">
                    <input type="text" placeholder="Search...">
                    <i class='bx bx-search icon'></i>
                </div>
            </form>
            <a href="#" class="nav-link">
                <i class='bx bxs-bell icon'></i>
                <span class="badge">5</span>
            </a>
            <a href="#" class="nav-link">
                <i class='bx bxs-message-square-dots icon'></i>
                <span class="badge">8</span>
            </a>
            <span class="divider"></span>
            <div class="profile">
                <img src="<c:url value='/assets/user/images/avatar-null.jpg' />" alt="">
                <ul class="profile-link">
                    <li><a href="#"><i class='bx bxs-user-circle icon'></i> Profile</a></li>
                    <li><a href="#"><i class='bx bxs-cog'></i> Settings</a></li>
                    <li><a href="#"><i class='bx bxs-log-out-circle'></i> Logout</a></li>
                </ul>
            </div>
        </nav>
        <!-- NAVBAR -->

        <!-- MAIN -->
        <main>
            <h1 class="title">Quản lý Thanh Toán</h1>
            <div style="justify-content: space-between; display: flex; align-items: center;">
                <ul class="breadcrumbs">
                    <li><a href="<c:url value='/quan-tri'/>">Home</a></li>
                    <li class="divider">/</li>
                    <li><a href="#" class="active">Thanh Toán</a></li>
                </ul>
                <button id="openModalBtn" class="btn btn-primary" style="font-size: 14px">Thêm mới</button>
            </div>
            <div class="container">
                <div class="card">
                    <div class="card-header">
                        <h6>Danh sách Thanh Toán</h6>
                    </div>
                    <div class="table-wrapper">
                        <table class="authors-table">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>ID Đơn Hàng</th>
                                    <th>Phương Thức</th>
                                    <th>Tổng Tiền</th>
                                    <th>Trạng Thái</th>
                                    <th>Ngày Thanh Toán</th>
                                    <th>Thao Tác</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:if test="${not empty thanhToanList}">
                                    <c:forEach var="thanhToan" items="${thanhToanList}" varStatus="loop">
                                        <tr>
                                            <td>${thanhToan.idThanhToan}</td>
                                            <td>${thanhToan.idDonHang}</td>
                                            <td><small>${thanhToan.phuongThuc}</small></td>
                                            <td><small><fmt:formatNumber value="${thanhToan.tongTienThanhToan}" pattern="#,##0 VNĐ"/></small></td>
                                            <td><small>${thanhToan.trangThai}</small></td>
                                            <td><small><fmt:formatDate value="${thanhToan.ngayThanhToan}" pattern="dd/MM/yyyy HH:mm"/></small></td>
                                            <td>
                                                <!-- Chỉnh sửa thanh toán -->
                                                <button class="edit-btn"
                                                        data-id="${thanhToan.idThanhToan}"
                                                        data-iddonhang="${thanhToan.idDonHang}"
                                                        data-phuongthuc="${thanhToan.phuongThuc}"
                                                        data-tongtien="${thanhToan.tongTienThanhToan}"
                                                        data-trangthai="${thanhToan.trangThai}"
                                                        data-ngaythanhtoan="${thanhToan.ngayThanhToan}"
                                                        style="color: #007bff">
                                                    <i class="fa-solid fa-pen-to-square"></i>
                                                </button>
                                                <!-- Xóa thanh toán -->
                                                <button class="delete-btn"
                                                        data-id="${thanhToan.idThanhToan}"
                                                        onclick="deleteThanhToan(${thanhToan.idThanhToan})"
                                                        style="color: red;">
                                                    <i class="fa-solid fa-trash"></i>
                                                </button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${empty thanhToanList}">
                                    <tr>
                                        <td colspan="7" class="text-center text-gray-500">Không có giao dịch thanh toán nào.</td>
                                    </tr>
                                </c:if>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </main>
        <!-- MAIN -->
    </section>

    <!-- Modal Thêm Thanh Toán -->
    <div id="addThanhToanModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h1 style="font-weight: bold; font-size: 18px">Thêm mới thanh toán</h1>
                <span id="closeModalBtn" class="close">×</span>
            </div>
            <div class="modal-body">
                <form id="addThanhToanForm" action="<c:url value='/them-thanh-toan-admin'/>" method="post">
                    <c:if test="${_csrf != null}">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    </c:if>
                    <div class="form-group1">
                        <label for="idDonHang">ID Đơn Hàng:</label>
                        <input type="number" name="idDonHang" id="idDonHang" class="form-control" required min="1" />
                    </div>
                    <div class="form-group1">
                        <label for="phuongThuc">Phương Thức:</label>
                        <select name="phuongThuc" id="phuongThuc" class="form-control" required>
                            <option value="Tiền mặt">Tiền mặt</option>
                            <option value="Chuyển khoản">Chuyển khoản</option>
                            <option value="Thẻ tín dụng">Thẻ tín dụng</option>
                        </select>
                    </div>
                    <div class="form-group1">
                        <label for="tongTienThanhToan">Tổng Tiền:</label>
                        <input type="number" name="tongTienThanhToan" id="tongTienThanhToan" class="form-control" required min="0" step="0.01" />
                    </div>
                    <div class="form-group1">
                        <label for="trangThai">Trạng Thái:</label>
                        <select name="trangThai" id="trangThai" class="form-control" required>
                            <option value="Hoàn thành">Hoàn thành</option>
                            <option value="Đang xử lý">Đang xử lý</option>
                            <option value="Thất bại">Thất bại</option>
                        </select>
                    </div>
                    <div class="form-group1">
                        <label for="ngayThanhToan">Ngày Thanh Toán:</label>
                        <input type="datetime-local" name="ngayThanhToan" id="ngayThanhToan" class="form-control" />
                    </div>
                    <button type="submit" id="submitBtn" class="btn btn-primary mx-auto block">Thêm</button>
                </form>
            </div>
        </div>
    </div>

    <!-- Modal Chỉnh Sửa Thanh Toán -->
    <div id="editThanhToanModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h1 style="font-weight: bold; font-size: 18px">Chỉnh sửa thanh toán</h1>
                <span id="closeEditModalBtn" class="close">×</span>
            </div>
            <div class="modal-body">
                <form id="editThanhToanForm" action="<c:url value='/sua-thanh-toan-admin'/>" method="post">
                    <c:if test="${_csrf != null}">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    </c:if>
                    <input type="hidden" name="idThanhToan" id="editIdThanhToan" />
                    <div class="form-group1">
                        <label for="editIdDonHang">ID Đơn Hàng:</label>
                        <input type="number" name="idDonHang" id="editIdDonHang" class="form-control" required min="1" />
                    </div>
                    <div class="form-group1">
                        <label for="editPhuongThuc">Phương Thức:</label>
                        <select name="phuongThuc" id="editPhuongThuc" class="form-control" required>
                            <option value="Tiền mặt">Tiền mặt</option>
                            <option value="Chuyển khoản">Chuyển khoản</option>
                            <option value="Thẻ tín dụng">Thẻ tín dụng</option>
                        </select>
                    </div>
                    <div class="form-group1">
                        <label for="editTongTienThanhToan">Tổng Tiền:</label>
                        <input type="number" name="tongTienThanhToan" id="editTongTienThanhToan" class="form-control" required min="0" step="0.01" />
                    </div>
                    <div class="form-group1">
                        <label for="editTrangThai">Trạng Thái:</label>
                        <select name="trangThai" id="editTrangThai" class="form-control" required>
                            <option value="Hoàn thành">Hoàn thành</option>
                            <option value="Đang xử lý">Đang xử lý</option>
                            <option value="Thất bại">Thất bại</option>
                        </select>
                    </div>
                    <div class="form-group1">
                        <label for="editNgayThanhToan">Ngày Thanh Toán:</label>
                        <input type="datetime-local" name="ngayThanhToan" id="editNgayThanhToan" class="form-control" />
                    </div>
                    <button type="submit" id="editSubmitBtn" class="btn btn-primary mx-auto block">Cập nhật</button>
                </form>
            </div>
        </div>
    </div>

    <!-- CSS for Modal -->
    <style>
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
            width: 70%;
            max-width: 500px;
            border-radius: 5px;
            position: relative;
        }
        .modal-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid #ddd;
            padding-bottom: 10px;
        }
        .close {
            cursor: pointer;
            font-size: 24px;
            color: #888;
        }
        .close:hover {
            color: #000;
        }
        .modal-body {
            padding-top: 20px;
        }
        .form-group1 {
            margin-bottom: 15px;
        }
        .form-control {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .btn {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #0056b3;
        }
        .alert {
            padding: 10px;
            margin-top: 10px;
            border-radius: 4px;
        }
        .alert-success {
            background-color: #d4edda;
            color: #155724;
        }
        .alert-danger {
            background-color: #f8d7da;
            color: #721c24;
        }
        .edit-btn, .delete-btn {
            background: none;
            border: none;
            cursor: pointer;
            margin: 0 5px;
        }
        .edit-btn:hover i, .delete-btn:hover i {
            color: #0056b3;
        }
    </style>

    <script>
        // Modal Thêm Thanh Toán
        var addModal = document.getElementById("addThanhToanModal");
        var openModalBtn = document.getElementById("openModalBtn");
        var closeModalBtn = document.getElementById("closeModalBtn");
        var addForm = document.getElementById("addThanhToanForm");
        var submitBtn = document.getElementById("submitBtn");

        // Modal Chỉnh Sửa Thanh Toán
        var editModal = document.getElementById("editThanhToanModal");
        var closeEditModalBtn = document.getElementById("closeEditModalBtn");
        var editForm = document.getElementById("editThanhToanForm");
        var editSubmitBtn = document.getElementById("editSubmitBtn");

        // Mở modal thêm thanh toán
        openModalBtn.onclick = function() {
            addModal.style.display = "block";
            addForm.reset();
        }

        // Đóng modal thêm thanh toán
        closeModalBtn.onclick = function() {
            addModal.style.display = "none";
            addForm.reset();
        }

        // Đóng modal chỉnh sửa thanh toán
        closeEditModalBtn.onclick = function() {
            editModal.style.display = "none";
            editForm.reset();
        }

        // Đóng modal khi click bên ngoài
        window.onclick = function(event) {
            if (event.target == addModal) {
                addModal.style.display = "none";
                addForm.reset();
            }
            if (event.target == editModal) {
                editModal.style.display = "none";
                editForm.reset();
            }
        }

        // Ẩn modal sau khi submit form thêm
        addForm.addEventListener("submit", function () {
            addModal.style.display = "none";
        });

        // Xử lý nút chỉnh sửa
        document.querySelectorAll('.edit-btn').forEach(button => {
            button.onclick = function() {
                editModal.style.display = "block";
                document.getElementById('editIdThanhToan').value = button.dataset.id;
                document.getElementById('editIdDonHang').value = button.dataset.iddonhang;
                document.getElementById('editPhuongThuc').value = button.dataset.phuongthuc;
                document.getElementById('editTongTienThanhToan').value = button.dataset.tongtien;
                document.getElementById('editTrangThai').value = button.dataset.trangthai;
                // Format ngày thanh toán cho input datetime-local
                if (button.dataset.ngaythanhtoan) {
                    let date = new Date(button.dataset.ngaythanhtoan);
                    let formattedDate = date.toISOString().slice(0, 16); // Format: YYYY-MM-DDTHH:mm
                    document.getElementById('editNgayThanhToan').value = formattedDate;
                } else {
                    document.getElementById('editNgayThanhToan').value = '';
                }
            }
        });

        // Xử lý form thêm thanh toán
        addForm.onsubmit = function(event) {
            event.preventDefault();
            submitBtn.disabled = true;
            var formData = new FormData(addForm);

            fetch(addForm.action, {
                method: 'POST',
                body: formData
            })
            .then(response => {
                if (response.redirected) {
                    window.location.href = response.url;
                } else {
                    return response.text();
                }
            })
            .then(data => {
                if (data) {
                    var errorDiv = document.createElement("div");
                    errorDiv.className = "alert alert-danger";
                    errorDiv.textContent = "Lỗi khi thêm thanh toán: " + data;
                    addForm.prepend(errorDiv);
                    submitBtn.disabled = false;
                }
            })
            .catch(error => {
                var errorDiv = document.createElement("div");
                errorDiv.className = "alert alert-danger";
                errorDiv.textContent = "Lỗi khi thêm thanh toán: " + error.message;
                addForm.prepend(errorDiv);
                submitBtn.disabled = false;
            });
        }

        // Xử lý form chỉnh sửa thanh toán
        editForm.onsubmit = function(event) {
            event.preventDefault();
            editSubmitBtn.disabled = true;
            var formData = new FormData(editForm);

            fetch(editForm.action, {
                method: 'POST',
                body: formData
            })
            .then(response => {
                if (response.redirected) {
                    window.location.href = response.url;
                } else {
                    return response.text();
                }
            })
            .then(data => {
                if (data) {
                    var errorDiv = document.createElement("div");
                    errorDiv.className = "alert alert-danger";
                    errorDiv.textContent = "Lỗi khi cập nhật thanh toán: " + data;
                    editForm.prepend(errorDiv);
                    editSubmitBtn.disabled = false;
                }
            })
            .catch(error => {
                var errorDiv = document.createElement("div");
                errorDiv.className = "alert alert-danger";
                errorDiv.textContent = "Lỗi khi cập nhật thanh toán: " + error.message;
                editForm.prepend(errorDiv);
                editSubmitBtn.disabled = false;
            });
        }

        // Xử lý xóa thanh toán
        function deleteThanhToan(id) {
            if (!confirm('Bạn có chắc chắn muốn xóa thanh toán này?')) {
                return;
            }

            fetch('<c:url value="/xoa-thanh-toan-admin/"/>' + id, {
                method: 'GET'
            })
            .then(response => {
                if (response.redirected) {
                    window.location.href = response.url;
                } else {
                    return response.text();
                }
            })
            .then(data => {
                if (data) {
                    alert('Lỗi khi xóa thanh toán: ' + data);
                }
            })
            .catch(error => {
                alert('Lỗi khi xóa thanh toán: ' + error.message);
            });
        }
    </script>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="<c:url value='/assets/admin/script.js' />"></script>
</body>
</html>