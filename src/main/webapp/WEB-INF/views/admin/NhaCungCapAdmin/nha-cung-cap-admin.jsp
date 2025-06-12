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
    <title>Quản lý Nhà Cung Cấp</title>
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
            <li><a href="<c:url value='/nha-cung-cap-admin' />" class="active"><i class="fa-solid fa-comment icon"></i> Quản lý nhà cung cấp</a></li> 
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
            <h1 class="title">Quản lý Nhà Cung Cấp</h1>
            <div style="justify-content: space-between; display: flex; align-items: center;">
                <ul class="breadcrumbs">
                    <li><a href="<c:url value='/quan-tri'/>">Home</a></li>
                    <li class="divider">/</li>
                    <li><a href="#" class="active">Nhà Cung Cấp</a></li>
                </ul>
                <button id="openModalBtn" class="btn btn-primary" style="font-size: 14px">Thêm mới</button>
            </div>
            <div class="container">
                <div class="card">
                    <div class="card-header">
                        <h6>Danh sách Nhà Cung Cấp</h6>
                    </div>
                    <div class="table-wrapper">
                        <table class="authors-table">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Tên Nhà Cung Cấp</th>
                                    <th>Địa Chỉ</th>
                                    <th>SĐT</th>
                                    <th>Email</th>
                                    <th>Ghi Chú</th>
                                    <th>Thao Tác</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:if test="${not empty nhaCungCap}">
                                    <c:forEach var="ncc" items="${nhaCungCap}" varStatus="loop">
                                        <tr>
                                            <td>${ncc.idNhaCungCap}</td>
                                            <td><small>${ncc.tenNhaCungCap}</small></td>
                                            <td><small>${ncc.diaChi}</small></td>
                                            <td><small>${ncc.sdt}</small></td>
                                            <td><small>${ncc.email}</small></td>
                                            <td><small>${ncc.ghiChu}</small></td>
                                            <td>
                                                <!-- Chỉnh sửa nhà cung cấp -->
                                                <button class="edit-btn"
                                                        data-id="${ncc.idNhaCungCap}"
                                                        data-ten="${ncc.tenNhaCungCap}"
                                                        data-diachi="${ncc.diaChi}"
                                                        data-sdt="${ncc.sdt}"
                                                        data-email="${ncc.email}"
                                                        data-ghichu="${ncc.ghiChu}"
                                                        style="color: #007bff">
                                                    <i class="fa-solid fa-pen-to-square"></i>
                                                </button>
                                                <!-- Xóa nhà cung cấp -->
                                                <button class="delete-btn"
                                                        data-id="${ncc.idNhaCungCap}"
                                                        onclick="deleteNhaCungCap(${ncc.idNhaCungCap})"
                                                        style="color: red;">
                                                    <i class="fa-solid fa-trash"></i>
                                                </button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${empty nhaCungCap}">
                                    <tr>
                                        <td colspan="7" class="text-center text-gray-500">Không có nhà cung cấp nào.</td>
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

    <!-- Modal Thêm Nhà Cung Cấp -->
    <div id="addNhaCungCapModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h1 style="font-weight: bold; font-size: 18px">Thêm mới nhà cung cấp</h1>
                <span id="closeModalBtn" class="close">×</span>
            </div>
            <div class="modal-body">
                <form id="addNhaCungCapForm" action="<c:url value='/them-nha-cung-cap-admin'/>" method="post">
                    <c:if test="${_csrf != null}">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    </c:if>
                    <div class="form-group1">
                        <label for="tenNhaCungCap">Tên Nhà Cung Cấp:</label>
                        <input type="text" name="tenNhaCungCap" id="tenNhaCungCap" class="form-control" required />
                    </div>
                    <div class="form-group1">
                        <label for="diaChi">Địa Chỉ:</label>
                        <input type="text" name="diaChi" id="diaChi" class="form-control" required />
                    </div>
                    <div class="form-group1">
                        <label for="sdt">SĐT:</label>
                        <input type="text" name="sdt" id="sdt" class="form-control" required pattern="\d{10,11}" title="Số điện thoại phải có 10-11 chữ số" />
                    </div>
                    <div class="form-group1">
                        <label for="email">Email:</label>
                        <input type="email" name="email" id="email" class="form-control" required />
                    </div>
                    <div class="form-group1">
                        <label for="ghiChu">Ghi Chú:</label>
                        <textarea name="ghiChu" id="ghiChu" class="form-control"></textarea>
                    </div>
                    <button type="submit" id="submitBtn" class="btn btn-primary mx-auto block">Thêm</button>
                </form>
            </div>
        </div>
    </div>

    <!-- Modal Chỉnh Sửa Nhà Cung Cấp -->
    <div id="editNhaCungCapModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h1 style="font-weight: bold; font-size: 18px">Chỉnh sửa nhà cung cấp</h1>
                <span id="closeEditModalBtn" class="close">×</span>
            </div>
            <div class="modal-body">
                <form id="editNhaCungCapForm" action="<c:url value='/sua-nha-cung-cap-admin'/>" method="post">
                    <c:if test="${_csrf != null}">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    </c:if>
                    <input type="hidden" name="idNhaCungCap" id="editIdNhaCungCap" />
                    <div class="form-group1">
                        <label for="editTenNhaCungCap">Tên Nhà Cung Cấp:</label>
                        <input type="text" name="tenNhaCungCap" id="editTenNhaCungCap" class="form-control" required />
                    </div>
                    <div class="form-group1">
                        <label for="editDiaChi">Địa Chỉ:</label>
                        <input type="text" name="diaChi" id="editDiaChi" class="form-control" required />
                    </div>
                    <div class="form-group1">
                        <label for="editSdt">SĐT:</label>
                        <input type="text" name="sdt" id="editSdt" class="form-control" required pattern="\d{10,11}" title="Số điện thoại phải có 10-11 chữ số" />
                    </div>
                    <div class="form-group1">
                        <label for="editEmail">Email:</label>
                        <input type="email" name="email" id="editEmail" class="form-control" required />
                    </div>
                    <div class="form-group1">
                        <label for="editGhiChu">Ghi Chú:</label>
                        <textarea name="ghiChu" id="editGhiChu" class="form-control"></textarea>
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
            color: #007bff;
        }
    </style>

    <script>
        // Modal Thêm Nhà Cung Cấp
        var addModal = document.getElementById("addNhaCungCapModal");
        var openModalBtn = document.getElementById("openModalBtn");
        var closeModalBtn = document.getElementById("closeModalBtn");
        var addForm = document.getElementById("addNhaCungCapForm");
        var submitBtn = document.getElementById("submitBtn");

        // Modal Chỉnh Sửa Nhà Cung Cấp
        var editModal = document.getElementById("editNhaCungCapModal");
        var closeEditModalBtn = document.getElementById("closeEditModalBtn");
        var editForm = document.getElementById("editNhaCungCapForm");
        var editSubmitBtn = document.getElementById("editSubmitBtn");

        // Mở modal thêm nhà cung cấp
        openModalBtn.onclick = function() {
            addModal.style.display = "block";
            addForm.reset();
        }

        // Đóng modal thêm nhà cung cấp
        closeModalBtn.onclick = function() {
            addModal.style.display = "none";
            addForm.reset();
        }

        // Đóng modal chỉnh sửa nhà cung cấp
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

        document.getElementById("addNhaCungCapForm").addEventListener("submit", function () {
            document.getElementById("addNhaCungCapModal").style.display = "none";
        })

        // Xử lý nút chỉnh sửa
        document.querySelectorAll('.edit-btn').forEach(button => {
            button.onclick = function() {
                editModal.style.display = "block";
                document.getElementById('editIdNhaCungCap').value = button.dataset.id;
                document.getElementById('editTenNhaCungCap').value = button.dataset.ten;
                document.getElementById('editDiaChi').value = button.dataset.diachi;
                document.getElementById('editSdt').value = button.dataset.sdt;
                document.getElementById('editEmail').value = button.dataset.email;
                document.getElementById('editGhiChu').value = button.dataset.ghichu || '';
            }
        });

        // Xử lý form thêm nhà cung cấp
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
                    errorDiv.textContent = "Lỗi khi thêm nhà cung cấp: " + data;
                    addForm.prepend(errorDiv);
                    submitBtn.disabled = false;
                }
            })
            .catch(error => {
                var errorDiv = document.createElement("div");
                errorDiv.className = "alert alert-danger";
                errorDiv.textContent = "Lỗi khi thêm nhà cung cấp: " + error.message;
                addForm.prepend(errorDiv);
                submitBtn.disabled = false;
            });
        }

        // Xử lý form chỉnh sửa nhà cung cấp
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
                    errorDiv.textContent = "Lỗi khi cập nhật nhà cung cấp: " + data;
                    editForm.prepend(errorDiv);
                    editSubmitBtn.disabled = false;
                }
            })
            .catch(error => {
                var errorDiv = document.createElement("div");
                errorDiv.className = "alert alert-danger";
                errorDiv.textContent = "Lỗi khi cập nhật nhà cung cấp: " + error.message;
                editForm.prepend(errorDiv);
                editSubmitBtn.disabled = false;
            });
        }

        // Xử lý xóa nhà cung cấp
        function deleteNhaCungCap(id) {
            if (!confirm('Bạn có chắc chắn muốn xóa nhà cung cấp này?')) {
                return;
            }

            fetch('<c:url value="/xoa-nha-cung-cap-admin/"/>' + id, {
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
                    alert('Lỗi khi xóa nhà cung cấp: ' + data);
                }
            })
            .catch(error => {
                alert('Lỗi khi xóa nhà cung cấp: ' + error.message);
            });
        }
    </script>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="<c:url value='/assets/admin/script.js' />"></script>
</body>
</html>