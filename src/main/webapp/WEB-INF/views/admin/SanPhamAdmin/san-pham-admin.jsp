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
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
            integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
        />
        <link rel="stylesheet" href="<c:url value='/assets/admin/style.css' />" /> 
        <link rel="stylesheet" href="<c:url value='/assets/admin/products.css' />" />
        <script src="https://cdn.ckeditor.com/4.22.1/standard/ckeditor.js"></script>
        <style>
            header {display: none}
            footer {display: none} 
            .cke_notifications_area {display: none} 
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
            .btn-danger {
                background-color: #dc3545;
            }
            .btn-danger:hover {
                background-color: #c82333;
            }
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
                width: 100%;
            }
            .form-row {
                display: flex;
                gap: 20px;
                margin-bottom: 15px;
            }
            .form-control {
                width: 100%;
                padding: 8px;
                border: 1px solid #ddd;
                border-radius: 4px;
                box-sizing: border-box;
            }
            .full-width {
                width: 100%;
            }
            .alert {
                padding: 10px;
                margin-top: 10px;
                border-radius: 4px;
            }
            .alert-danger {
                background-color: #f8d7da;
                color: #721c24;
            }
            .mota {
                width: 400px;
                overflow: hidden;
                text-overflow: ellipsis;
                display: -webkit-box;
                -webkit-line-clamp: 4;
                -webkit-box-orient: vertical;
                word-break: break-all;
                line-height: 1.5;
                height: 85px;
                padding: 10px 0;
                padding-bottom: 20px;
            }
            nav .profile {
                display: flex;
                align-items: center;
            }
            nav .profile img {
                width: 40px;
                height: 40px;
                border-radius: 50%;
                margin-right: 10px;
            }
            nav .profile-link {
                display: none;
                position: absolute;
                top: 100%;
                right: 0;
                background-color: white;
                border: 1px solid #ddd;
                border-radius: 4px;
                padding: 10px 0;
                min-width: 150px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            }
            nav .profile:hover .profile-link {
                display: block;
            }
            nav .profile-link li {
                padding: 5px 20px;
            }
            nav .profile-link li:hover {
                background-color: #f5f5f5;
            }
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
                    <li><a href="<c:url value="/san-pham-admin" />" class="active"><i class="fa-solid fa-shirt icon"></i> Quản lý sản phẩm</a></li>
                    <li><a href="<c:url value="/loai-san-pham-admin" />"><i class="fa-solid fa-layer-group icon"></i> Quản lý danh mục</a></li>
                    <li><a href="<c:url value="/don-hang-admin" />" ><i class="fa-solid fa-briefcase icon"></i> Quản lý đơn hàng</a></li>
                      <li><a href="<c:url value="nha-cung-cap-admin" />"><i class="fa-solid fa-comment icon"></i> Quản lý nhà cung cấp</a></li>
                    <li><a href="<c:url value="thanh-toan-admin" />"><i class="fa-solid fa-chart-area icon"></i> Quản lý thanh toán</a></li> 
                </ul>
            </section>
        <!-- SIDEBAR -->

        <!-- NAVBAR -->
        <section id="content">
            <!-- NAVBAR -->
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
                        <li>
                            <a href="#"><i class="bx bxs-user-circle icon"></i> Profile</a>
                        </li>
                        <li>
                            <a href="#"><i class="bx bxs-cog"></i> Settings</a>
                        </li>
                        <li>
                            <a href="#"><i class="bx bxs-log-out-circle"></i> Logout</a>
                        </li>
                    </ul>
                </div>
            </nav>
            <!-- NAVBAR -->

            <!-- MAIN -->
            <main>
                <h1 class="title">Quản lý Sản phẩm</h1>
                <div style="justify-content: space-between; display: flex; align-items: center;">
                    <ul class="breadcrumbs">
                        <li><a href="<c:url value='/quan-tri'/>">Home</a></li>
                        <li class="divider">/</li>
                        <li><a href="#" class="active">Sản phẩm</a></li> 
                    </ul> 
                    
                    <button id="openModalBtn" class="btn btn-primary" style="font-size: 14px">Thêm mới</button>
                </div>
                <div class="container">
                    <div class="card">
                        <div class="card-header">
                            <h6>Danh sách sản phẩm</h6>
                        </div>
                        <div class="table-wrapper">
                            <table class="authors-table">
                                <thead>
                                    <tr>
                                        <th>STT</th>
                                        <th>Ảnh</th>
                                        <th style="width: 200px">Tên sản phẩm</th>
                                        <th>Giá</th>
                                        <th>Số lượng</th>
                                        <th>Loại</th>
                                        <th>Đơn vị tính</th>
                                        <th>Mô tả</th>
                                        <th>Thao tác</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:if test="${not empty products}">
                                        <c:forEach var="product" items="${products}" varStatus="loop">
                                            <tr>
                                                <td>${product.idSanPham}</td>
                                                <td>
                                                    <div class="author-info">
                                                        <img src="<c:url value='${product.hinhAnh}'/>" alt="${product.tenSanPham}" class="avatarProduct" width="50"/>
                                                    </div>
                                                </td>
                                                <td>
                                                    <small>${product.tenSanPham}</small>
                                                </td>
                                                <td>
                                                    <p><fmt:formatNumber value="${product.gia}" type="number" pattern="#,##0"/>₫</p>
                                                </td>
                                                <td><p>${product.soLuongTon}</p></td>
                                                <td><small>
                                                    <c:forEach var="category" items="${categorys}">
                                                        <c:if test="${category.idLoaiSP == product.idLoaiSP}">${category.tenLoaiSP}</c:if>
                                                    </c:forEach>
                                                </small></td>
                                                <td><small>${product.donViTinh}</small></td>
                                                <td><small class="mota">${product.moTa}</small></td>
                                                <td>
                                                    <button style="color: #007bff" class="btn-sm edit-btn" style="margin-right: 5px;"><i class="fa-solid fa-pen-to-square"></i></button>
                                                    <button style="color: red; margin-left: 10px" class="btn-sm delete-btn" data-id="${product.idSanPham}"><i class="fa-solid fa-trash"></i></button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${empty products}">
                                        <tr>
                                            <td colspan="9" class="text-center text-gray-500">Không có sản phẩm nào.</td>
                                        </tr>
                                    </c:if>
                                </tbody>
                            </table>
                            
                            <!-- Pagination Controls 
		                    <div class="pagination">
		                        <c:if test="${currentPage > 1}">
		                            <a href="<c:url value='/san-pham-admin?page=${currentPage - 1}&size=${pageSize}'/>">&laquo; Trước</a>
		                        </c:if>
		                        <c:if test="${currentPage <= 1}">
		                            <a href="#" class="disabled">&laquo; Trước</a>
		                        </c:if>
		
		                        <c:forEach begin="1" end="${totalPages}" var="i">
		                            <c:choose>
		                                <c:when test="${currentPage == i}">
		                                    <a href="#" class="active">${i}</a>
		                                </c:when>
		                                <c:otherwise>
		                                    <a href="<c:url value='/san-pham-admin?page=${i}&size=${pageSize}'/>">${i}</a>
		                                </c:otherwise>
		                            </c:choose>
		                        </c:forEach>
		
		                        <c:if test="${currentPage < totalPages}">
		                            <a href="<c:url value='/san-pham-admin?page=${currentPage + 1}&size=${pageSize}'/>">Tiếp &raquo;</a>
		                        </c:if>
		                        <c:if test="${currentPage >= totalPages}">
		                            <a href="#" class="disabled">Tiếp &raquo;</a>
		                        </c:if>
		                    </div> -->
                        </div>
                    </div>
                </div>

                <!-- Modal Thêm Sản Phẩm -->
                <div id="addProductModal" class="modal">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 style="font-weight: bold; font-size: 18px; padding-top: 20px;padding-bottom: 10px">Thêm mới sản phẩm</h1>
                            <span id="closeModalBtn" class="close">×</span>
                        </div>
                        <div class="modal-body">
                            <form id="addProductForm" action="<c:url value='/them-san-pham-admin'/>" method="post" enctype="multipart/form-data">
                                <c:if test="${_csrf != null}">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                </c:if>
                                <div class="form-row">
                                    <div class="form-group1">
                                        <label for="tenSanPham">Tên Sản Phẩm:</label>
                                        <input type="text" name="tenSanPham" id="tenSanPham" class="form-control" required />
                                    </div>
                                    <div class="form-group1">
                                        <label for="gia">Giá (VND):</label>
                                        <input type="number" name="gia" id="gia" class="form-control" required min="0" step="1000" />
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group1">
                                        <label for="soLuongTon">Số Lượng Tồn:</label>
                                        <input type="number" name="soLuongTon" id="soLuongTon" class="form-control" required min="0" />
                                    </div>
                                    <div class="form-group1">
                                        <label for="donViTinh">Đơn Vị Tính:</label>
                                        <input type="text" name="donViTinh" id="donViTinh" class="form-control" required />
                                    </div>
                                </div>
                                <div class="form-group1 full-width">
                                    <label for="moTa">Mô Tả:</label>
                                    <textarea name="moTa" id="moTa" class="form-control" required></textarea>
                                </div>
                                <div class="form-row">
                                    <div class="form-group1">
                                        <label for="idLoaiSP">Loại Sản Phẩm:</label>
                                        <select name="idLoaiSP" id="idLoaiSP" class="form-control" required>
                                            <c:forEach var="category" items="${categorys}">
                                                <option value="${category.idLoaiSP}">${category.tenLoaiSP}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="form-group1">
                                        <label for="idNhaCungCap">Nhà Cung Cấp:</label>
                                        <select name="idNhaCungCap" id="idNhaCungCap" class="form-control" required>
                                            <c:forEach var="ncc" items="${nhaCungCaps}">
                                                <option value="${ncc.idNhaCungCap}">${ncc.tenNhaCungCap}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group1">
                                        <label for="moi">Mới:</label>
                                        <input type="checkbox" name="moi" id="moi" value="true" />
                                    </div>
                                    <div class="form-group1">
                                        <label for="noiBat">Nổi Bật:</label>
                                        <input type="checkbox" name="noiBat" id="noiBat" value="true" />
                                    </div>
                                </div>
                                <div class="form-group1 full-width">
                                    <label for="hinhAnhSP">Hình Ảnh Chính:</label>
                                    <input type="file" name="hinhAnhSP" id="hinhAnhSP" class="form-control" accept="image/*" />
                                </div>
                                <button type="submit" id="submitBtn" class="btn btn-primary mx-auto block">Thêm</button>
                            </form>
                        </div>
                    </div>
                </div>

                <!-- Modal Sửa Sản Phẩm -->
                <div id="editProductModal" class="modal">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 style="font-weight: bold; font-size: 18px; padding-top: 20px;padding-bottom: 10px">Chỉnh sửa sản phẩm</h1>
                            <span id="closeEditModalBtn" class="close">×</span>
                        </div>
                        <div class="modal-body">
                            <form id="editProductForm" action="<c:url value='/sua-san-pham-admin'/>" method="post" enctype="multipart/form-data">
                                <c:if test="${_csrf != null}">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                </c:if>
                                <input type="hidden" name="idSanPham" id="editIdSanPham" />
                                <div class="form-row">
                                    <div class="form-group1">
                                        <label for="editTenSanPham">Tên Sản Phẩm:</label>
                                        <input type="text" name="tenSanPham" id="editTenSanPham" class="form-control" required />
                                    </div>
                                    <div class="form-group1">
                                        <label for="editGia">Giá (VND):</label>
                                        <input type="number" name="gia" id="editGia" class="form-control" required min="0" step="1000" />
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group1">
                                        <label for="editSoLuongTon">Số Lượng Tồn:</label>
                                        <input type="number" name="soLuongTon" id="editSoLuongTon" class="form-control" required min="0" />
                                    </div>
                                    <div class="form-group1">
                                        <label for="editDonViTinh">Đơn Vị Tính:</label>
                                        <input type="text" name="donViTinh" id="editDonViTinh" class="form-control" required />
                                    </div>
                                </div>
                                <div class="form-group1 full-width">
                                    <label for="editMoTa">Mô Tả:</label>
                                    <textarea name="moTa" id="editMoTa" class="form-control" required></textarea>
                                </div>
                                <div class="form-row">
                                    <div class="form-group1">
                                        <label for="editIdLoaiSP">Loại Sản Phẩm:</label>
                                        <select name="idLoaiSP" id="editIdLoaiSP" class="form-control" required>
                                            <c:forEach var="category" items="${categorys}">
                                                <option value="${category.idLoaiSP}">${category.tenLoaiSP}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="form-group1">
                                        <label for="editIdNhaCungCap">Nhà Cung Cấp:</label>
                                        <select name="idNhaCungCap" id="editIdNhaCungCap" class="form-control" required>
                                            <c:forEach var="ncc" items="${nhaCungCaps}">
                                                <option value="${ncc.idNhaCungCap}">${ncc.tenNhaCungCap}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group1">
                                        <label for="editMoi">Mới:</label>
                                        <input type="checkbox" name="moi" id="editMoi" value="true" />
                                    </div>
                                    <div class="form-group1">
                                        <label for="editNoiBat">Nổi Bật:</label>
                                        <input type="checkbox" name="noiBat" id="editNoiBat" value="true" />
                                    </div>
                                </div>
                                <div class="form-group1 full-width">
                                    <label for="editHinhAnhSP">Hình Ảnh Chính:</label>
                                    <input type="file" name="hinhAnhSP" id="editHinhAnhSP" class="form-control" accept="image/*" />
                                    <img id="currentImage" src="" alt="Current Image" style="max-width: 100px; margin-top: 10px; display: none;" />
                                </div>
                                <button type="submit" id="editSubmitBtn" class="btn btn-primary mx-auto block">Cập nhật</button>
                            </form>
                        </div>
                    </div>
                </div>
            </main>
            <!-- MAIN -->
        </section>
        <!-- NAVBAR -->

        <script>
            // Khởi tạo CKEditor cho modal thêm sản phẩm
            CKEDITOR.replace('moTa', {
                filebrowserUploadUrl: '<c:url value="/upload-image-ckeditor"/>',
                height: 300
            });

            // Khởi tạo CKEditor cho modal sửa sản phẩm
            CKEDITOR.replace('editMoTa', {
                filebrowserUploadUrl: '<c:url value="/upload-image-ckeditor"/>',
                height: 300
            });

            // Modal Thêm Sản Phẩm
            var addModal = document.getElementById("addProductModal");
            var openAddModalBtn = document.getElementById("openModalBtn");
            var closeAddModalBtn = document.getElementById("closeModalBtn");
            var addForm = document.getElementById("addProductForm");
            var addSubmitBtn = document.getElementById("submitBtn");

            openAddModalBtn.onclick = function() {
                addModal.style.display = "block";
                addForm.reset();
                CKEDITOR.instances.moTa.setData('');
            }

            closeAddModalBtn.onclick = function() {
                addModal.style.display = "none";
                addForm.reset();
                CKEDITOR.instances.moTa.setData('');
            }

            window.onclick = function(event) {
                if (event.target == addModal) {
                    addModal.style.display = "none";
                    addForm.reset();
                    CKEDITOR.instances.moTa.setData('');
                }
                if (event.target == editModal) {
                    editModal.style.display = "none";
                    editForm.reset();
                    CKEDITOR.instances.editMoTa.setData('');
                    document.getElementById("currentImage").style.display = "none";
                }
            }

            addForm.onsubmit = function(event) {
                event.preventDefault();
                addSubmitBtn.disabled = true;
                var formData = new FormData(addForm);
                formData.set('moTa', CKEDITOR.instances.moTa.getData());

                fetch(addForm.action, {
                    method: 'POST',
                    body: formData
                })
                .then(response => {
                    if (response.ok) {  
                        addModal.style.display = "none";  
                        addForm.reset();
                        CKEDITOR.instances.moTa.setData('');
                        location.reload();  
                    } else {
                        return response.text();
                    }
                })
                .then(data => {
                    if (data) {
                        var errorDiv = document.createElement("div");
                        errorDiv.className = "alert alert-danger";
                        errorDiv.textContent = "Lỗi khi thêm sản phẩm: " + data;
                        addForm.prepend(errorDiv);
                        addSubmitBtn.disabled = false;
                    }
                })
                .catch(error => {
                    var errorDiv = document.createElement("div");
                    errorDiv.className = "alert alert-danger";
                    errorDiv.textContent = "Lỗi khi thêm sản phẩm: " + error.message;
                    addForm.prepend(errorDiv);
                    addSubmitBtn.disabled = false;
                });
            }

            // Modal Sửa Sản Phẩm
            var editModal = document.getElementById("editProductModal");
            var closeEditModalBtn = document.getElementById("closeEditModalBtn");
            var editForm = document.getElementById("editProductForm");
            var editSubmitBtn = document.getElementById("editSubmitBtn");
            var editButtons = document.querySelectorAll(".edit-btn");

            editButtons.forEach(button => {
                button.onclick = function() {
                    var row = button.closest("tr");
                    var cells = row.getElementsByTagName("td");

                    var id = cells[0].textContent;
                    var ten = cells[2].querySelector("small").textContent;
                    var gia = cells[3].querySelector("p").textContent.replace("₫", "").replace(/[,]/g, "");
                    var soLuong = cells[4].querySelector("p").textContent;
                    var tenLoaiSP = cells[5].querySelector("small").textContent;
                    var donViTinh = cells[6].querySelector("small").textContent;
                    var moTa = cells[7].querySelector("small").textContent;
                    var hinhAnh = row.querySelector("img").getAttribute("src");

                    document.getElementById("editIdSanPham").value = id;
                    document.getElementById("editTenSanPham").value = ten;
                    document.getElementById("editGia").value = gia;
                    document.getElementById("editSoLuongTon").value = soLuong;
                    document.getElementById("editDonViTinh").value = donViTinh;

                    var selectLoaiSP = document.getElementById("editIdLoaiSP");
                    for (var i = 0; i < selectLoaiSP.options.length; i++) {
                        if (selectLoaiSP.options[i].text === tenLoaiSP) {
                            selectLoaiSP.selectedIndex = i;
                            break;
                        }
                    }

                    CKEDITOR.instances.editMoTa.setData(moTa);
                    document.getElementById("currentImage").src = hinhAnh;
                    document.getElementById("currentImage").style.display = hinhAnh ? "block" : "none";

                    editModal.style.display = "block"; 
                }
            });

            closeEditModalBtn.onclick = function() {
                editModal.style.display = "none";
                editForm.reset();
                CKEDITOR.instances.editMoTa.setData('');
                document.getElementById("currentImage").style.display = "none";
            }

            editForm.onsubmit = function(event) {
                event.preventDefault();
                editSubmitBtn.disabled = true;
                var formData = new FormData(editForm);
                formData.set('moTa', CKEDITOR.instances.editMoTa.getData());

                fetch(editForm.action, {
                    method: 'POST',
                    body: formData
                })
                .then(response => {
                    if (response.ok) {  
                        editModal.style.display = "none";  
                        editForm.reset();
                        CKEDITOR.instances.editMoTa.setData('');
                        document.getElementById("currentImage").style.display = "none";
                        location.reload();  
                    } else {
                        return response.text();
                    }
                })
                .then(data => {
                    if (data) {
                        var errorDiv = document.createElement("div");
                        errorDiv.className = "alert alert-danger";
                        errorDiv.textContent = "Lỗi khi cập nhật sản phẩm: " + data;
                        editForm.prepend(errorDiv);
                        editSubmitBtn.disabled = false;
                    }
                })
                .catch(error => {
                    var errorDiv = document.createElement("div");
                    errorDiv.className = "alert alert-danger";
                    errorDiv.textContent = "Lỗi khi cập nhật sản phẩm: " + error.message;
                    editForm.prepend(errorDiv);
                    editSubmitBtn.disabled = false;
                });
            }

         // Chức năng Xóa Sản Phẩm
            var deleteButtons = document.querySelectorAll(".delete-btn");
            deleteButtons.forEach(button => {
                button.onclick = function() {
                    var id = button.getAttribute("data-id");
                    if (confirm("Bạn có chắc chắn muốn xóa sản phẩm này không?")) {
                        fetch('<c:url value="/xoa-san-pham-admin/' + id + '"/>', {
                            method: 'POST', // Thay DELETE bằng POST
                            headers: {
                                'Content-Type': 'application/json',
                                'X-CSRF-Token': '${_csrf.token}' // Đảm bảo CSRF token
                            }
                        })
                        .then(response => response.json()) // Đọc JSON
                        .then(data => {
                            if (data.success) {
                                button.closest("tr").remove();
                                alert(data.message); // Hiển thị thông báo thành công
                                location.reload(); // Làm mới trang
                            } else {
                                alert("Lỗi: " + data.message); // Hiển thị thông báo lỗi
                            }
                        })
                        .catch(error => {
                            alert("Lỗi khi xóa sản phẩm: " + error.message);
                        });
                    }
                };
            });
            
            
        </script>
        <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
        <script src="script.js"></script>
    </body>
</html>