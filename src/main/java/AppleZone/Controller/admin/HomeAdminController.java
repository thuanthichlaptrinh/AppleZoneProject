package AppleZone.Controller.admin;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import AppleZone.Controller.user.BaseController;
import AppleZone.Dto.DonHangDto;
import AppleZone.Dto.NguoiDungDto;
import AppleZone.Dto.SanPhamDto;
import AppleZone.Dto.ThanhToanDto;
import AppleZone.Entity.LoaiSanPham;
import AppleZone.Entity.NhaCungCap;
import AppleZone.Service.user.DonHangServiceImpl;
import AppleZone.Service.user.LoaiSanPhamServiceImpl;
import AppleZone.Service.user.NguoiDungServiceImpl;
import AppleZone.Service.user.NhaCungCapServiceImpl;
import AppleZone.Service.user.SanPhamServiceImpl;
import AppleZone.Service.user.ThanhToanServiceImpl;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

@Controller
public class HomeAdminController extends BaseController {
	
	@Autowired
	private SanPhamServiceImpl sanPhamServiceImpl;
	
	@Autowired
	private NguoiDungServiceImpl nguoiDungServiceImpl;
	
	@Autowired 
	private LoaiSanPhamServiceImpl loaiSanPhamServiceImpl; 
	
	@Autowired
	private NhaCungCapServiceImpl nhaCungCapServiceImpl;
	
	@Autowired 
	private DonHangServiceImpl donHangServiceImpl;
	
	@Autowired 
	private ThanhToanServiceImpl  thanhToanServiceImpl;
    
	@RequestMapping(value = "/quan-tri")
    public ModelAndView Index(HttpSession session) { 
        NguoiDungDto user = (NguoiDungDto) session.getAttribute("loggedInUser");
        
        if (user == null) {
            return new ModelAndView("redirect:/dang-nhap");
        }
        
        if (!"Admin".equals(user.getChucVu())) { 
            return new ModelAndView("redirect:/loi-dang-nhap");
        }

        try {
            // Thống kê số liệu
            int totalProducts = sanPhamServiceImpl.countTotalProducts();
            int totalOrders = donHangServiceImpl.countCompletedOrders();
            double totalRevenue = thanhToanServiceImpl.getTotalRevenue();
            int totalUsers = nguoiDungServiceImpl.countTotalUsers();
            int totalSuppliers = nhaCungCapServiceImpl.countTotalSuppliers();

            // Dữ liệu biểu đồ doanh thu theo tháng
            List<Map<String, Object>> revenueByMonth = thanhToanServiceImpl.getRevenueByMonth();

            // Dữ liệu biểu đồ trạng thái đơn hàng
            Map<String, Integer> orderStatusStats = donHangServiceImpl.getOrderStatusStats();

            // Truyền dữ liệu vào view
            _mvShare.addObject("userHinhAnh", user.getHinhAnh());
            _mvShare.addObject("totalProducts", totalProducts);
            _mvShare.addObject("totalOrders", totalOrders);
            _mvShare.addObject("totalRevenue", totalRevenue);
            _mvShare.addObject("totalUsers", totalUsers);
            _mvShare.addObject("totalSuppliers", totalSuppliers);
            _mvShare.addObject("revenueByMonth", revenueByMonth);
            _mvShare.addObject("orderStatusStats", orderStatusStats);
            _mvShare.setViewName("admin/index"); 
            return _mvShare;
        } catch (Exception e) {
            System.out.println("Error loading dashboard: " + e.getMessage());
            _mvShare.addObject("error", "Lỗi khi tải dữ liệu thống kê: " + e.getMessage());
            _mvShare.setViewName("error");
            return _mvShare;
        }
    }
    
    @RequestMapping(value = "/nguoi-dung-admin")
    public ModelAndView getNguoiDungAdmin(HttpSession session) { 
        NguoiDungDto user = (NguoiDungDto) session.getAttribute("loggedInUser");
        
        if (user == null) {
            System.out.println("No logged-in user found, redirecting to /dang-nhap");
            return new ModelAndView("redirect:/dang-nhap");
        }
        
        if (!"Admin".equals(user.getChucVu())) { 
            System.out.println("User role is not Admin, redirecting to /loi-dang-nhap");
            return new ModelAndView("redirect:/loi-dang-nhap");
        }  
        
        try {
            List<NguoiDungDto> nguoiDungList = nguoiDungServiceImpl.getAllNguoiDung();  
            System.out.println("Loaded " + (nguoiDungList != null ? nguoiDungList.size() : 0) + " users");
            _mvShare.addObject("nguoiDungList", nguoiDungList); 
            _mvShare.setViewName("admin/NguoiDungAdmin/nguoi-dung-admin"); 
            return _mvShare;
        } catch (Exception e) {
            System.out.println("Error loading users: " + e.getMessage());
            _mvShare.addObject("error", "Lỗi khi tải danh sách người dùng: " + e.getMessage());
            _mvShare.addObject("userHinhAnh", user.getHinhAnh());
            _mvShare.setViewName("error");
            return _mvShare;
        }
    }
    
    @RequestMapping(value = "/them-nguoi-dung-admin", method = RequestMethod.POST)
    public ModelAndView addNguoiDungAdmin(
            HttpSession session,
            @ModelAttribute NguoiDungDto newUser,
            @RequestParam(value = "hinhAnhSP") MultipartFile hinhAnh) {

        NguoiDungDto user = (NguoiDungDto) session.getAttribute("loggedInUser");

        if (user == null) {
            System.out.println("No logged-in user found, redirecting to /dang-nhap");
            return new ModelAndView("redirect:/dang-nhap");
        }

        if (!"Admin".equals(user.getChucVu())) {
            System.out.println("User role is not Admin, redirecting to /loi-dang-nhap");
            return new ModelAndView("redirect:/loi-dang-nhap");
        }

        try {
            if (newUser.getTenNguoiDung() == null || newUser.getTenNguoiDung().trim().isEmpty()) {
                throw new IllegalArgumentException("Tên người dùng không được để trống.");
            }
            if (newUser.getSdt() == null || !newUser.getSdt().matches("\\d{10,11}")) {
                throw new IllegalArgumentException("Số điện thoại không hợp lệ (phải có 10-11 chữ số).");
            }
            if (newUser.getEmail() == null || !newUser.getEmail().matches("^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$")) {
                throw new IllegalArgumentException("Email không hợp lệ.");
            }
            if (newUser.getDiaChi() == null || newUser.getDiaChi().trim().isEmpty()) {
                throw new IllegalArgumentException("Địa chỉ không được để trống.");
            }
            if (newUser.getChucVu() == null || (!newUser.getChucVu().equals("User") && !newUser.getChucVu().equals("Admin"))) {
                throw new IllegalArgumentException("Chức vụ không hợp lệ.");
            }

            newUser.setNgayTao(new Date());

            if (hinhAnh != null && !hinhAnh.isEmpty()) {
                String contentType = hinhAnh.getContentType();
                if (contentType == null || !contentType.startsWith("image/")) {
                    throw new IllegalArgumentException("Tệp tải lên phải là hình ảnh.");
                }
                String fileName = newUser.getSdt() + "_" + hinhAnh.getOriginalFilename();
                String uploadDir = session.getServletContext().getRealPath("/assets/user/images/");
                File uploadDirFile = new File(uploadDir);
                if (!uploadDirFile.exists()) {
                    boolean created = uploadDirFile.mkdirs();
                    System.out.println("Created upload directory: " + uploadDir + " (Success: " + created + ")");
                }
                String uploadPath = uploadDir + File.separator + fileName;
                System.out.println("Saving file to: " + uploadPath);
                hinhAnh.transferTo(new File(uploadPath));
                newUser.setHinhAnh("/assets/user/images/" + fileName);
                System.out.println("Image saved successfully: " + fileName);
            } else {
                newUser.setHinhAnh(null);
                System.out.println("No image uploaded, setting hinhAnh to null");
            }

            nguoiDungServiceImpl.saveNguoiDung(newUser);
            System.out.println("New user added successfully: " + newUser.getTenNguoiDung());

            List<NguoiDungDto> nguoiDungList = nguoiDungServiceImpl.getAllNguoiDung();
            _mvShare.addObject("nguoiDungList", nguoiDungList);
            _mvShare.addObject("success", "Thêm người dùng thành công!");
            _mvShare.setViewName("admin/NguoiDungAdmin/nguoi-dung-admin");
            return _mvShare;
        } catch (IllegalArgumentException e) {
            System.out.println("Validation error: " + e.getMessage());
            _mvShare.addObject("error", e.getMessage());
            _mvShare.addObject("nguoiDungList", nguoiDungServiceImpl.getAllNguoiDung());
            _mvShare.setViewName("admin/NguoiDungAdmin/nguoi-dung-admin");
            return _mvShare;
        } catch (Exception e) {
            System.out.println("Error adding user: " + e.getMessage());
            _mvShare.addObject("error", "Lỗi khi thêm người dùng: " + e.getMessage());
            _mvShare.addObject("nguoiDungList", nguoiDungServiceImpl.getAllNguoiDung());
            _mvShare.setViewName("admin/NguoiDungAdmin/nguoi-dung-admin");
            return _mvShare;
        }
    }
    
    @RequestMapping(value = "/sua-nguoi-dung", method = RequestMethod.POST)
    public ModelAndView saveEditedNguoiDung(
            HttpSession session,
            @ModelAttribute("editUser") NguoiDungDto editedUser,
            @RequestParam(value = "hinhAnhSP", required = false) MultipartFile hinhAnh,
            RedirectAttributes redirectAttributes) {
        System.out.println("=== Form Submission (Edit User) ===");
        System.out.println("NguoiDungDto: " + editedUser);
        System.out.println("hinhAnhSP: " + (hinhAnh != null ? hinhAnh.getOriginalFilename() : "null"));

        NguoiDungDto user = (NguoiDungDto) session.getAttribute("loggedInUser");
        if (user == null) {
            return new ModelAndView("redirect:/dang-nhap");
        }
        if (!"Admin".equals(user.getChucVu())) {
            return new ModelAndView("redirect:/loi-dang-nhap");
        } 

        try { 
            if (editedUser == null || editedUser.getIdNguoiDung() == 0) {
                throw new IllegalArgumentException("ID người dùng không hợp lệ.");
            }
            if (editedUser.getTenNguoiDung() == null || editedUser.getTenNguoiDung().trim().isEmpty()) {
                throw new IllegalArgumentException("Tên người dùng không được để trống.");
            }
            if (editedUser.getSdt() == null || !editedUser.getSdt().matches("\\d{10,11}")) {
                throw new IllegalArgumentException("Số điện thoại không hợp lệ (phải có 10-11 chữ số).");
            }
            if (editedUser.getEmail() == null || !editedUser.getEmail().matches("^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$")) {
                throw new IllegalArgumentException("Email không hợp lệ.");
            }
            if (editedUser.getDiaChi() == null || editedUser.getDiaChi().trim().isEmpty()) {
                throw new IllegalArgumentException("Địa chỉ không được để trống.");
            }
            if (editedUser.getChucVu() == null || (!editedUser.getChucVu().equals("User") && !editedUser.getChucVu().equals("Admin"))) {
                throw new IllegalArgumentException("Chức vụ không hợp lệ.");
            }
     
            NguoiDungDto existingUser = nguoiDungServiceImpl.getNguoiDungBySdt(editedUser.getSdt()); 
            if (existingUser != null && existingUser.getIdNguoiDung() != editedUser.getIdNguoiDung()) {
                throw new IllegalArgumentException("Số điện thoại đã tồn tại.");
            }
            existingUser = nguoiDungServiceImpl.getNguoiDungByEmail(editedUser.getEmail());
            if (existingUser != null && existingUser.getIdNguoiDung() != editedUser.getIdNguoiDung()) {
                throw new IllegalArgumentException("Email đã tồn tại.");
            }
     
            if (editedUser.getMatKhau() != null && !editedUser.getMatKhau().isEmpty()) { 
                editedUser.setMatKhau(BCrypt.hashpw(editedUser.getMatKhau(), BCrypt.gensalt()));
            } else { 
                NguoiDungDto currentUser = nguoiDungServiceImpl.getNguoiDungById(editedUser.getIdNguoiDung());
                if (currentUser == null) {
                    throw new IllegalArgumentException("Không tìm thấy người dùng.");
                }
                editedUser.setMatKhau(currentUser.getMatKhau());
            }
     
            if (hinhAnh != null && !hinhAnh.isEmpty()) {
                String contentType = hinhAnh.getContentType();
                if (contentType == null || !contentType.startsWith("image/")) {
                    throw new IllegalArgumentException("Tệp tải lên phải là hình ảnh.");
                } 
                NguoiDungDto currentUser = nguoiDungServiceImpl.getNguoiDungById(editedUser.getIdNguoiDung());
                if (currentUser.getHinhAnh() != null) {
                    String oldImagePath = session.getServletContext().getRealPath(currentUser.getHinhAnh());
                    File oldImageFile = new File(oldImagePath);
                    if (oldImageFile.exists()) {
                        oldImageFile.delete();
                        System.out.println("Deleted old image: " + oldImagePath);
                    }
                } 
                String fileName = editedUser.getSdt() + "_" + hinhAnh.getOriginalFilename();
                String uploadDir = session.getServletContext().getRealPath("/assets/user/images/");
                File uploadDirFile = new File(uploadDir);
                if (!uploadDirFile.exists()) {
                    uploadDirFile.mkdirs();
                }
                String uploadPath = uploadDir + File.separator + fileName;
                hinhAnh.transferTo(new File(uploadPath));
                editedUser.setHinhAnh("/assets/user/images/" + fileName);
            } else { 
                NguoiDungDto currentUser = nguoiDungServiceImpl.getNguoiDungById(editedUser.getIdNguoiDung());
                if (currentUser == null) {
                    throw new IllegalArgumentException("Không tìm thấy người dùng.");
                }
                editedUser.setHinhAnh(currentUser.getHinhAnh());
            }
     
            nguoiDungServiceImpl.updateNguoiDung(editedUser);
            redirectAttributes.addFlashAttribute("success", "Cập nhật người dùng thành công!");
            return new ModelAndView("redirect:/nguoi-dung-admin");
        } catch (IllegalArgumentException e) {
            System.out.println("Validation error: " + e.getMessage());
            _mvShare.addObject("error", e.getMessage());
            _mvShare.addObject("editUser", editedUser);
            _mvShare.addObject("nguoiDungList", nguoiDungServiceImpl.getAllNguoiDung());
            _mvShare.setViewName("admin/NguoiDungAdmin/nguoi-dung-admin");
            return _mvShare;
        } catch (IOException e) {
            System.out.println("IO error updating user: " + e.getMessage());
            e.printStackTrace();
            _mvShare.addObject("error", "Lỗi khi xử lý tệp hình ảnh: " + e.getMessage());
            _mvShare.addObject("editUser", editedUser);
            _mvShare.addObject("nguoiDungList", nguoiDungServiceImpl.getAllNguoiDung());
            _mvShare.setViewName("admin/NguoiDungAdmin/nguoi-dung-admin");
            return _mvShare;
        } catch (Exception e) {
            System.out.println("Error updating user: " + e.getMessage());
            e.printStackTrace();
            _mvShare.addObject("error", "Lỗi khi cập nhật người dùng: " + e.getMessage());
            _mvShare.addObject("editUser", editedUser);
            _mvShare.addObject("nguoiDungList", nguoiDungServiceImpl.getAllNguoiDung());
            _mvShare.setViewName("admin/NguoiDungAdmin/nguoi-dung-admin");
            return _mvShare;
        }
    } 
    
    @RequestMapping(value = "/xoa-nguoi-dung-admin/{id}", method = RequestMethod.GET)
    public ModelAndView deleteNguoiDung(
            @PathVariable("id") int idNguoiDung,
            HttpSession session,
            RedirectAttributes redirectAttributes) {
        System.out.println("=== Attempting to delete user with ID: " + idNguoiDung + " at " + new java.util.Date());

        NguoiDungDto loggedInUser = (NguoiDungDto) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            System.out.println("No logged-in user found, redirecting to /dang-nhap");
            return new ModelAndView("redirect:/dang-nhap");
        }
        if (!"Admin".equals(loggedInUser.getChucVu())) {
            System.out.println("User role is not Admin, redirecting to /loi-dang-nhap");
            return new ModelAndView("redirect:/loi-dang-nhap");
        }

        try {
            NguoiDungDto userToDelete = nguoiDungServiceImpl.getNguoiDungById(idNguoiDung);
            if (userToDelete == null) {
                System.out.println("User with ID " + idNguoiDung + " not found");
                redirectAttributes.addFlashAttribute("error", "Người dùng không tồn tại.");
                return new ModelAndView("redirect:/nguoi-dung-admin");
            }

            if (loggedInUser.getIdNguoiDung() == idNguoiDung) {
                System.out.println("Attempted self-deletion by user: " + loggedInUser.getTenNguoiDung());
                redirectAttributes.addFlashAttribute("error", "Không thể xóa tài khoản của chính bạn.");
                return new ModelAndView("redirect:/nguoi-dung-admin");
            }

            if (nguoiDungServiceImpl.hasAssociatedOrders(idNguoiDung)) {
                System.out.println("User with ID " + idNguoiDung + " has associated orders");
                redirectAttributes.addFlashAttribute("error", "Không thể xóa người dùng vì tài khoản này có đơn hàng liên quan.");
                return new ModelAndView("redirect:/nguoi-dung-admin");
            }

            if (userToDelete.getHinhAnh() != null) {
                String imagePath = session.getServletContext().getRealPath(userToDelete.getHinhAnh());
                File imageFile = new File(imagePath);
                if (imageFile.exists()) {
                    if (imageFile.delete()) {
                        System.out.println("Successfully deleted image: " + imagePath);
                    } else {
                        System.out.println("Failed to delete image: " + imagePath);
                    }
                }
            }
 
            nguoiDungServiceImpl.DeleteNguoiDung(idNguoiDung);
            System.out.println("User with ID " + idNguoiDung + " soft-deleted successfully");
            redirectAttributes.addFlashAttribute("success", "Xóa người dùng thành công! Dữ liệu người dùng được lưu trữ để tham khảo trong tương lai.");

            return new ModelAndView("redirect:/nguoi-dung-admin");
        } catch (Exception e) {
            System.out.println("Error during user deletion: " + e.getMessage());
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("error", "Lỗi khi xóa người dùng: " + e.getMessage());
            return new ModelAndView("redirect:/nguoi-dung-admin");
        }
    }
    
    @RequestMapping(value = "/san-pham-admin")
    public ModelAndView SanPhamAdmin(HttpSession session) {  
        NguoiDungDto user = (NguoiDungDto) session.getAttribute("loggedInUser");
        
        if (user == null) { 
            return new ModelAndView("redirect:/dang-nhap");
        }
        
        if (user.getChucVu() == null || !"Admin".equals(user.getChucVu())) { 
            return new ModelAndView("redirect:/loi-dang-nhap");
        }  
        
        try {
            List<SanPhamDto> products = sanPhamServiceImpl.getAllSanPham(); 
            List<LoaiSanPham> categorys = loaiSanPhamServiceImpl.GetDataCategorys();
            List<NhaCungCap> nhaCungCaps = nhaCungCapServiceImpl.getAllNhaCungCap(); // Assume this service exists
            _mvShare.addObject("products", products);
            _mvShare.addObject("categorys", categorys);
            _mvShare.addObject("nhaCungCaps", nhaCungCaps);
            _mvShare.setViewName("admin/SanPhamAdmin/san-pham-admin");  
            return _mvShare;
        } catch (Exception e) { 
            _mvShare.addObject("error", "Lỗi khi tải sản phẩm: " + e.getMessage());
            _mvShare.addObject("userHinhAnh", user.getHinhAnh());
            _mvShare.setViewName("error"); 
            return _mvShare;
        }
    } 
    
    @RequestMapping(value = "/them-san-pham-admin", method = RequestMethod.POST)
    public ModelAndView addSanPhamAdmin(
            HttpSession session,
            @ModelAttribute SanPhamDto newProduct,
            @RequestParam(value = "hinhAnhSP") MultipartFile hinhAnh) {

        NguoiDungDto user = (NguoiDungDto) session.getAttribute("loggedInUser");

        if (user == null) {
            System.out.println("No logged-in user found, redirecting to /dang-nhap");
            return new ModelAndView("redirect:/dang-nhap");
        }

        if (!"Admin".equals(user.getChucVu())) {
            System.out.println("User role is not Admin, redirecting to /loi-dang-nhap");
            return new ModelAndView("redirect:/loi-dang-nhap");
        }

        try {
            // Validate form fields
            if (newProduct.getTenSanPham() == null || newProduct.getTenSanPham().trim().isEmpty()) {
                throw new IllegalArgumentException("Tên sản phẩm không được để trống.");
            }
            if (newProduct.getGia() < 0) {
                throw new IllegalArgumentException("Giá sản phẩm không được âm.");
            }
            if (newProduct.getSoLuongTon() < 0) {
                throw new IllegalArgumentException("Số lượng tồn không được âm.");
            }
            if (newProduct.getDonViTinh() == null || newProduct.getDonViTinh().trim().isEmpty()) {
                throw new IllegalArgumentException("Đơn vị tính không được để trống.");
            }
            if (newProduct.getIdLoaiSP() <= 0) {
                throw new IllegalArgumentException("Loại sản phẩm không hợp lệ.");
            }
            if (newProduct.getIdNhaCungCap() <= 0) {
                throw new IllegalArgumentException("Nhà cung cấp không hợp lệ.");
            }

            // Set creation date and default values
            newProduct.setNgayTao(new Date());
            newProduct.setTrangThai(true); // Default active status

            // Handle image upload
            if (hinhAnh != null && !hinhAnh.isEmpty()) {
                String contentType = hinhAnh.getContentType();
                if (contentType == null || !contentType.startsWith("image/")) {
                    throw new IllegalArgumentException("Tệp tải lên phải là hình ảnh.");
                }
                String fileName = newProduct.getTenSanPham().replaceAll("\\s+", "_") + "_" + hinhAnh.getOriginalFilename();
                String uploadDir = session.getServletContext().getRealPath("/assets/user/images/");
                File uploadDirFile = new File(uploadDir);
                if (!uploadDirFile.exists()) {
                    boolean created = uploadDirFile.mkdirs();
                    System.out.println("Created upload directory: " + uploadDir + " (Success: " + created + ")");
                }
                String uploadPath = uploadDir + File.separator + fileName;
                System.out.println("Saving file to: " + uploadPath);
                hinhAnh.transferTo(new File(uploadPath));
                newProduct.setHinhAnh("/assets/user/images/" + fileName);
                System.out.println("Image saved successfully: " + fileName);
            } else {
                newProduct.setHinhAnh(null);
                System.out.println("No image uploaded, setting hinhAnh to null");
            }

            // Save to database
            sanPhamServiceImpl.saveSanPham(newProduct);
            System.out.println("New product added successfully: " + newProduct.getTenSanPham());

            // Refresh the product list
            List<SanPhamDto> products = sanPhamServiceImpl.getAllSanPham();
            _mvShare.addObject("products", products);
            _mvShare.addObject("success", "Thêm sản phẩm thành công!");
            _mvShare.setViewName("admin/SanPhamAdmin/san-pham-admin");
            return _mvShare;
        } catch (IllegalArgumentException e) {
            System.out.println("Validation error: " + e.getMessage());
            _mvShare.addObject("error", e.getMessage());
            _mvShare.addObject("products", sanPhamServiceImpl.getAllSanPham());
            _mvShare.setViewName("admin/SanPhamAdmin/san-pham-admin");
            return _mvShare;
        } catch (Exception e) {
            System.out.println("Error adding product: " + e.getMessage());
            _mvShare.addObject("error", "Lỗi khi thêm sản phẩm: " + e.getMessage());
            _mvShare.addObject("products", sanPhamServiceImpl.getAllSanPham());
            _mvShare.setViewName("admin/SanPhamAdmin/san-pham-admin");
            return _mvShare;
        }
    }
    
    @RequestMapping(value = "/sua-san-pham-admin", method = RequestMethod.POST)
    public ModelAndView editSanPhamAdmin(
            HttpSession session,
            @ModelAttribute("editProduct") SanPhamDto editedProduct,
            @RequestParam(value = "hinhAnhSP", required = false) MultipartFile hinhAnh,
            RedirectAttributes redirectAttributes) {
        System.out.println("=== Form Submission (Edit Product) ===");
        System.out.println("SanPhamDto: " + editedProduct);
        System.out.println("hinhAnhSP: " + (hinhAnh != null ? hinhAnh.getOriginalFilename() : "null"));

        NguoiDungDto user = (NguoiDungDto) session.getAttribute("loggedInUser");
        if (user == null) {
            System.out.println("No logged-in user found, redirecting to /dang-nhap");
            return new ModelAndView("redirect:/dang-nhap");
        }
        if (!"Admin".equals(user.getChucVu())) {
            System.out.println("User role is not Admin, redirecting to /loi-dang-nhap");
            return new ModelAndView("redirect:/loi-dang-nhap");
        }

        try {
            if (editedProduct == null || editedProduct.getIdSanPham() == 0) {
                throw new IllegalArgumentException("ID sản phẩm không hợp lệ.");
            }
            if (editedProduct.getTenSanPham() == null || editedProduct.getTenSanPham().trim().isEmpty()) {
                throw new IllegalArgumentException("Tên sản phẩm không được để trống.");
            }
            if (editedProduct.getGia() < 0) {
                throw new IllegalArgumentException("Giá sản phẩm không được âm.");
            }
            if (editedProduct.getSoLuongTon() < 0) {
                throw new IllegalArgumentException("Số lượng tồn không được âm.");
            }
            if (editedProduct.getDonViTinh() == null || editedProduct.getDonViTinh().trim().isEmpty()) {
                throw new IllegalArgumentException("Đơn vị tính không được để trống.");
            }
            if (editedProduct.getIdLoaiSP() <= 0) {
                throw new IllegalArgumentException("Loại sản phẩm không hợp lệ.");
            }
            if (editedProduct.getIdNhaCungCap() <= 0) {
                throw new IllegalArgumentException("Nhà cung cấp không hợp lệ.");
            }

            SanPhamDto currentProduct = sanPhamServiceImpl.getSanPhamById(editedProduct.getIdSanPham());
            if (currentProduct == null) {
                throw new IllegalArgumentException("Không tìm thấy sản phẩm.");
            }

            if (hinhAnh != null && !hinhAnh.isEmpty()) {
                String contentType = hinhAnh.getContentType();
                if (contentType == null || !contentType.startsWith("image/")) {
                    throw new IllegalArgumentException("Tệp tải lên phải là hình ảnh.");
                }
                if (currentProduct.getHinhAnh() != null) {
                    String oldImagePath = session.getServletContext().getRealPath(currentProduct.getHinhAnh());
                    File oldImageFile = new File(oldImagePath);
                    if (oldImageFile.exists()) {
                        oldImageFile.delete();
                        System.out.println("Deleted old image: " + oldImagePath);
                    }
                }
                String fileName = editedProduct.getTenSanPham().replaceAll("\\s+", "_") + "_" + hinhAnh.getOriginalFilename();
                String uploadDir = session.getServletContext().getRealPath("/assets/user/images/");
                File uploadDirFile = new File(uploadDir);
                if (!uploadDirFile.exists()) {
                    uploadDirFile.mkdirs();
                }
                String uploadPath = uploadDir + File.separator + fileName;
                hinhAnh.transferTo(new File(uploadPath));
                editedProduct.setHinhAnh("/assets/user/images/" + fileName);
            } else {
                editedProduct.setHinhAnh(currentProduct.getHinhAnh());
            }

            editedProduct.setNgayTao(currentProduct.getNgayTao());
            editedProduct.setTrangThai(currentProduct.isTrangThai());

            sanPhamServiceImpl.updateSanPham(editedProduct);
            System.out.println("Product updated successfully: " + editedProduct.getTenSanPham());

            redirectAttributes.addFlashAttribute("success", "Cập nhật sản phẩm thành công!");
            return new ModelAndView("redirect:/san-pham-admin");
        } catch (IllegalArgumentException e) {
            System.out.println("Validation error: " + e.getMessage());
            _mvShare.addObject("error", e.getMessage());
            _mvShare.addObject("products", sanPhamServiceImpl.getAllSanPham());
            _mvShare.addObject("categorys", loaiSanPhamServiceImpl.GetDataCategorys());
            _mvShare.addObject("nhaCungCaps", nhaCungCapServiceImpl.getAllNhaCungCap());
            _mvShare.setViewName("admin/SanPhamAdmin/san-pham-admin");
            return _mvShare;
        } catch (IOException e) {
            System.out.println("IO error updating product: " + e.getMessage());
            e.printStackTrace();
            _mvShare.addObject("error", "Lỗi khi xử lý tệp hình ảnh: " + e.getMessage());
            _mvShare.addObject("products", sanPhamServiceImpl.getAllSanPham());
            _mvShare.addObject("categorys", loaiSanPhamServiceImpl.GetDataCategorys());
            _mvShare.addObject("nhaCungCaps", nhaCungCapServiceImpl.getAllNhaCungCap());
            _mvShare.setViewName("admin/SanPhamAdmin/san-pham-admin");
            return _mvShare;
        } catch (Exception e) {
            System.out.println("Error updating product: " + e.getMessage());
            e.printStackTrace();
            _mvShare.addObject("error", "Lỗi khi cập nhật sản phẩm: " + e.getMessage());
            _mvShare.addObject("products", sanPhamServiceImpl.getAllSanPham());
            _mvShare.addObject("categorys", loaiSanPhamServiceImpl.GetDataCategorys());
            _mvShare.addObject("nhaCungCaps", nhaCungCapServiceImpl.getAllNhaCungCap());
            _mvShare.setViewName("admin/SanPhamAdmin/san-pham-admin");
            return _mvShare;
        }
    }
    
 // Phương thức xóa sản phẩm
    @PostMapping("/xoa-san-pham-admin/{id}")
    @ResponseBody
    public Map<String, Object> deleteSanPham(
            @PathVariable("id") int idSanPham,
            HttpSession session) {
        Map<String, Object> response = new HashMap<>();

        NguoiDungDto user = (NguoiDungDto) session.getAttribute("loggedInUser");
        if (user == null) {
            response.put("success", false);
            response.put("message", "Vui lòng đăng nhập.");
            return response;
        }
        if (!"Admin".equals(user.getChucVu())) {
            response.put("success", false);
            response.put("message", "Bạn không có quyền xóa sản phẩm.");
            return response;
        }

        try {
            SanPhamDto productToDelete = sanPhamServiceImpl.getSanPhamById(idSanPham);
            if (productToDelete == null) {
                response.put("success", false);
                response.put("message", "Sản phẩm không tồn tại.");
                return response;
            }

            if (sanPhamServiceImpl.hasAssociatedOrders(idSanPham)) {
                response.put("success", false);
                response.put("message", "Không thể xóa sản phẩm vì có đơn hàng liên quan.");
                return response;
            }

            if (productToDelete.getHinhAnh() != null) {
                String imagePath = session.getServletContext().getRealPath(productToDelete.getHinhAnh());
                File imageFile = new File(imagePath);
                if (imageFile.exists() && imageFile.delete()) {
                    System.out.println("Successfully deleted image: " + imagePath);
                }
            }

            sanPhamServiceImpl.xoaSanPham(idSanPham);
            System.out.println("Product with ID " + idSanPham + " deleted successfully");
            response.put("success", true);
            response.put("message", "Xóa sản phẩm thành công!");
            return response;
        } catch (Exception e) {
            System.out.println("Error during product deletion: " + e.getMessage());
            e.printStackTrace();
            response.put("success", false);
            response.put("message", "Lỗi khi xóa sản phẩm: " + e.getMessage());
            return response;
        }
    }
    
    @RequestMapping(value = "/loai-san-pham-admin")
    public ModelAndView LoaiSanPhamAdmin(HttpSession session) {  
        NguoiDungDto user = (NguoiDungDto) session.getAttribute("loggedInUser");
        
        if (user == null) { 
            return new ModelAndView("redirect:/dang-nhap");
        }
        
        if (user.getChucVu() == null || !"Admin".equals(user.getChucVu())) { 
            return new ModelAndView("redirect:/loi-dang-nhap");
        }  
        
        try {
            List<LoaiSanPham> category = loaiSanPhamServiceImpl.GetDataCategorys();
            _mvShare.addObject("categorys", category);
            _mvShare.setViewName("admin/LoaiSanPhamAdmin/loai-san-pham-admin");  
            return _mvShare;
        } catch (Exception e) { 
            _mvShare.addObject("error", "Lỗi khi tải sản phẩm: " + e.getMessage());
            _mvShare.addObject("userHinhAnh", user.getHinhAnh());
            _mvShare.setViewName("error"); 
            return _mvShare;
        }
    }
    
    @RequestMapping(value = "/don-hang-admin")
    public ModelAndView DonHangAdmin(HttpSession session) {  
        NguoiDungDto user = (NguoiDungDto) session.getAttribute("loggedInUser");
        
        if (user == null) { 
            return new ModelAndView("redirect:/dang-nhap");
        }
        
        if (user.getChucVu() == null || !"Admin".equals(user.getChucVu())) { 
            return new ModelAndView("redirect:/loi-dang-nhap");
        }  
        
        try {
            List<DonHangDto> donHangs = donHangServiceImpl.getAllDonHang();
            List<NguoiDungDto> nguoiDungList = nguoiDungServiceImpl.getAllNguoiDung();  
            List<SanPhamDto> products = sanPhamServiceImpl.getAllSanPham();
            if (products == null) {
                products = new ArrayList<>();  
            }
            _mvShare.addObject("donHangs", donHangs);
            _mvShare.addObject("nguoiDungList", nguoiDungList);
            _mvShare.addObject("products", products);
            _mvShare.setViewName("admin/DonHangAdmin/don-hang-admin"); 
            return _mvShare;
        } catch (Exception e) { 
            _mvShare.addObject("error", "Lỗi khi tải đơn hàng: " + e.getMessage());
            _mvShare.addObject("userHinhAnh", user.getHinhAnh());
            _mvShare.setViewName("error"); 
            return _mvShare;
        }
    }
    
    @PostMapping("/duyet-don-hang/{id}")
    public ModelAndView approveOrder(@PathVariable("id") int idDonHang, HttpSession session) {
        ModelAndView mv = new ModelAndView();
        NguoiDungDto user = (NguoiDungDto) session.getAttribute("loggedInUser");

        if (user == null || user.getChucVu() == null || !"Admin".equals(user.getChucVu())) {
            mv.setViewName("redirect:/loi-dang-nhap");
            return mv;
        }

        try {
            DonHangDto donHang = donHangServiceImpl.getOrderById(idDonHang);
            if (donHang == null) {
                mv.addObject("error", "Đơn hàng không tồn tại.");
                mv.setViewName("error");
                return mv;
            }

            if (!"Chờ duyệt".equals(donHang.getTrangThai())) {
                mv.addObject("error", "Đơn hàng không ở trạng thái Chờ duyệt.");
                mv.setViewName("error");
                return mv;
            }
 
            donHang.setTrangThai("Chờ giao");
            donHangServiceImpl.updateOrderStatus(donHang);  
            mv.setViewName("redirect:/don-hang-admin");  
        } catch (Exception e) {
            mv.addObject("error", "Lỗi khi duyệt đơn hàng: " + e.getMessage());
            mv.setViewName("error");
            System.err.println("Exception in approveOrder: " + e.getMessage());
            e.printStackTrace();
        }

        return mv;
    }
    
    @PostMapping("/hoan-tat-don-hang/{id}")
    public ModelAndView completeOrder(@PathVariable("id") int idDonHang, HttpSession session) {
        System.out.println("Received request to complete order with ID: " + idDonHang);
        ModelAndView mv = new ModelAndView();
        NguoiDungDto user = (NguoiDungDto) session.getAttribute("loggedInUser");

        if (user == null || user.getChucVu() == null || !"Admin".equals(user.getChucVu())) {
            mv.setViewName("redirect:/loi-dang-nhap");
            return mv;
        }

        try {
            DonHangDto donHang = donHangServiceImpl.getOrderById(idDonHang);
            if (donHang == null) {
                mv.addObject("error", "Đơn hàng không tồn tại.");
                mv.setViewName("error");
                return mv;
            }

            if (!"Chờ giao".equals(donHang.getTrangThai())) {
                mv.addObject("error", "Đơn hàng không ở trạng thái Chờ giao.");
                mv.setViewName("error");
                return mv;
            }

            donHang.setTrangThai("Hoàn thành");
            donHangServiceImpl.updateOrderStatus(donHang);
            mv.setViewName("redirect:/don-hang-admin");
        } catch (Exception e) {
            mv.addObject("error", "Lỗi khi hoàn tất đơn hàng: " + e.getMessage());
            mv.setViewName("error");
            System.err.println("Exception in completeOrder: " + e.getMessage());
            e.printStackTrace();
        }

        return mv;
    }
    
    @PostMapping("/them-don-hang")
    public ModelAndView addDonHang(@RequestBody Map<String, Object> requestData, HttpSession session) {
        ModelAndView mv = new ModelAndView();
        NguoiDungDto user = (NguoiDungDto) session.getAttribute("loggedInUser");

        if (user == null || user.getChucVu() == null || !"Admin".equals(user.getChucVu())) {
            mv.setViewName("redirect:/loi-dang-nhap");
            return mv;
        }

        try {
            DonHangDto donHang = new DonHangDto();
            donHang.setIdNguoiDung(Integer.parseInt(requestData.get("idNguoiDung").toString()));
            donHang.setTongTien(Double.parseDouble(requestData.get("tongTien").toString()));
            donHang.setTrangThai(requestData.get("trangThai").toString());
            donHang.setDiaChi(requestData.get("diaChi").toString());

            // Xử lý ngày giao
            String ngayGiao = (String) requestData.get("ngayGiao"); // Cast trực tiếp
            if (ngayGiao != null && !ngayGiao.isEmpty()) {
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
                donHang.setNgayGiao(new Timestamp(dateFormat.parse(ngayGiao).getTime()));
            } else {
                donHang.setNgayGiao(null);
            }

            // Xử lý ngày đặt
            donHang.setNgayDat(new Timestamp(System.currentTimeMillis()));

            // Xác thực dữ liệu
            if (nguoiDungServiceImpl.getNguoiDungById(donHang.getIdNguoiDung()) == null) {
                throw new IllegalArgumentException("Người dùng không tồn tại.");
            }
            if (donHang.getDiaChi() == null || donHang.getDiaChi().trim().isEmpty()) {
                throw new IllegalArgumentException("Địa chỉ không được để trống.");
            }
            if (!Arrays.asList("Chờ duyệt", "Chờ giao", "Hoàn thành", "Đã hủy").contains(donHang.getTrangThai())) {
                throw new IllegalArgumentException("Trạng thái không hợp lệ.");
            }

            // Lưu đơn hàng
            int idDonHang = donHangServiceImpl.createOrder(donHang);

            // Lưu chi tiết đơn hàng và cập nhật số lượng tồn kho
            List<Map<String, Object>> chiTietDonHang = (List<Map<String, Object>>) requestData.get("chiTietDonHang");
            for (Map<String, Object> detail : chiTietDonHang) {
                int idSanPham = Integer.parseInt(detail.get("idSanPham").toString());
                int soLuong = Integer.parseInt(detail.get("soLuong").toString());
                double giaBan = Double.parseDouble(detail.get("gia").toString());

                SanPhamDto product = sanPhamServiceImpl.getSanPhamById(idSanPham);
                if (product == null) {
                    throw new IllegalArgumentException("Sản phẩm với ID " + idSanPham + " không tồn tại.");
                }
                if (soLuong <= 0 || soLuong > product.getSoLuongTon()) {
                    throw new IllegalArgumentException("Số lượng không hợp lệ hoặc vượt quá tồn kho.");
                }
                if (giaBan < 0) {
                    throw new IllegalArgumentException("Giá bán không được âm.");
                }

                // Lưu chi tiết đơn hàng
                donHangServiceImpl.addOrderDetail(idDonHang, idSanPham, soLuong, giaBan);

                // Cập nhật số lượng tồn kho
                sanPhamServiceImpl.updateSoLuongTon(idSanPham, soLuong);
            }

            mv.setViewName("redirect:/don-hang-admin");
            mv.addObject("success", "Thêm đơn hàng thành công!");
        } catch (IllegalArgumentException e) {
            mv.addObject("error", e.getMessage());
            mv.setViewName("error");
            System.err.println("Validation error in addDonHang: " + e.getMessage());
        } catch (Exception e) {
            mv.addObject("error", "Lỗi khi thêm đơn hàng: " + e.getMessage());
            mv.setViewName("error");
            System.err.println("Exception in addDonHang: " + e.getMessage());
            e.printStackTrace();
        }

        return mv;
    }
    
    @PostMapping("/sua-don-hang")
    @ResponseBody
    public Map<String, Object> updateDonHang(@RequestBody Map<String, Object> requestData, HttpSession session) {
        Map<String, Object> response = new HashMap<>();
        NguoiDungDto user = (NguoiDungDto) session.getAttribute("loggedInUser");

        if (user == null || user.getChucVu() == null || !"Admin".equals(user.getChucVu())) {
            response.put("success", false);
            response.put("message", "Bạn không có quyền truy cập.");
            return response;
        }

        try {
            int idDonHang = Integer.parseInt(requestData.get("idDonHang").toString());
            DonHangDto donHang = donHangServiceImpl.getOrderById(idDonHang);
            if (donHang == null) {
                throw new IllegalArgumentException("Đơn hàng không tồn tại.");
            }

            donHang.setIdNguoiDung(Integer.parseInt(requestData.get("idNguoiDung").toString()));
            donHang.setTongTien(Double.parseDouble(requestData.get("tongTien").toString()));
            donHang.setTrangThai(requestData.get("trangThai").toString());
            donHang.setDiaChi(requestData.get("diaChi").toString());

            String ngayGiao = (String) requestData.get("ngayGiao");
            if (ngayGiao != null && !ngayGiao.isEmpty()) {
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
                donHang.setNgayGiao(new Timestamp(dateFormat.parse(ngayGiao).getTime()));
            } else {
                donHang.setNgayGiao(null);
            }

            donHangServiceImpl.updateOrder(donHang);

            // Xóa chi tiết cũ và thêm chi tiết mới
            donHangServiceImpl.deleteOrderDetails(idDonHang);
            List<Map<String, Object>> chiTietDonHang = (List<Map<String, Object>>) requestData.get("chiTietDonHang");
            for (Map<String, Object> detail : chiTietDonHang) {
                int idSanPham = Integer.parseInt(detail.get("idSanPham").toString());
                int soLuong = Integer.parseInt(detail.get("soLuong").toString());
                double giaBan = Double.parseDouble(detail.get("gia").toString());

                donHangServiceImpl.addOrderDetail(idDonHang, idSanPham, soLuong, giaBan);

                // Cập nhật tồn kho (giả định)
                SanPhamDto product = sanPhamServiceImpl.getSanPhamById(idSanPham);
                if (product != null && product.getSoLuongTon() < soLuong) {
                    throw new IllegalArgumentException("Số lượng tồn kho không đủ cho sản phẩm ID " + idSanPham);
                }
                sanPhamServiceImpl.updateSoLuongTon(idSanPham, -soLuong); // Giảm tồn kho
            }

            response.put("success", true);
            response.put("message", "Cập nhật đơn hàng thành công!");
        } catch (IllegalArgumentException e) {
            response.put("success", false);
            response.put("message", e.getMessage());
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "Lỗi khi cập nhật đơn hàng: " + e.getMessage());
        }

        return response;
    } 
 
    
    @RequestMapping(value = "/nha-cung-cap-admin")
    public ModelAndView getNhaCungCapAdmin(HttpSession session) {
        NguoiDungDto user = (NguoiDungDto) session.getAttribute("loggedInUser");

        if (user == null) {
            System.out.println("No logged-in user found, redirecting to /dang-nhap");
            return new ModelAndView("redirect:/dang-nhap");
        }

        if (!"Admin".equals(user.getChucVu())) {
            System.out.println("User role is not Admin, redirecting to /loi-dang-nhap");
            return new ModelAndView("redirect:/loi-dang-nhap");
        }

        try {
            List<NhaCungCap> nhaCungCapList = nhaCungCapServiceImpl.getAllNhaCungCap();
            _mvShare.addObject("nhaCungCap", nhaCungCapList);
            _mvShare.setViewName("admin/NhaCungCapAdmin/nha-cung-cap-admin");
            return _mvShare;
        } catch (Exception e) {
            System.out.println("Error loading suppliers: " + e.getMessage());
            _mvShare.addObject("error", "Lỗi khi tải danh sách nhà cung cấp: " + e.getMessage());
            _mvShare.addObject("userHinhAnh", user.getHinhAnh());
            _mvShare.setViewName("error");
            return _mvShare;
        }
    }

    @RequestMapping(value = "/them-nha-cung-cap-admin", method = RequestMethod.POST)
    public ModelAndView addNhaCungCapAdmin(
            HttpSession session,
            @ModelAttribute NhaCungCap newSupplier,
            RedirectAttributes redirectAttributes) {

        NguoiDungDto user = (NguoiDungDto) session.getAttribute("loggedInUser");

        if (user == null) {
            System.out.println("No logged-in user found, redirecting to /dang-nhap");
            return new ModelAndView("redirect:/dang-nhap");
        }

        if (!"Admin".equals(user.getChucVu())) {
            System.out.println("User role is not Admin, redirecting to /loi-dang-nhap");
            return new ModelAndView("redirect:/loi-dang-nhap");
        }

        try {
            if (newSupplier.getTenNhaCungCap() == null || newSupplier.getTenNhaCungCap().trim().isEmpty()) {
                throw new IllegalArgumentException("Tên nhà cung cấp không được để trống.");
            }
            if (newSupplier.getDiaChi() == null || newSupplier.getDiaChi().trim().isEmpty()) {
                throw new IllegalArgumentException("Địa chỉ không được để trống.");
            }
            if (newSupplier.getSdt() == null || !newSupplier.getSdt().matches("\\d{10,11}")) {
                throw new IllegalArgumentException("Số điện thoại không hợp lệ (phải có 10-11 chữ số).");
            }
            if (newSupplier.getEmail() == null || !newSupplier.getEmail().matches("^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$")) {
                throw new IllegalArgumentException("Email không hợp lệ.");
            }

            nhaCungCapServiceImpl.saveNhaCungCap(newSupplier);
            System.out.println("New supplier added successfully: " + newSupplier.getTenNhaCungCap());
            redirectAttributes.addFlashAttribute("success", "Thêm nhà cung cấp thành công!");
            return new ModelAndView("redirect:/nha-cung-cap-admin");
        } catch (IllegalArgumentException e) {
            System.out.println("Validation error: " + e.getMessage());
            _mvShare.addObject("error", e.getMessage());
            _mvShare.addObject("nhaCungCap", nhaCungCapServiceImpl.getAllNhaCungCap());
            _mvShare.setViewName("admin/NhaCungCapAdmin/nha-cung-cap-admin");
            return _mvShare;
        } catch (Exception e) {
            System.out.println("Error adding supplier: " + e.getMessage());
            _mvShare.addObject("error", "Lỗi khi thêm nhà cung cấp: " + e.getMessage());
            _mvShare.addObject("nhaCungCap", nhaCungCapServiceImpl.getAllNhaCungCap());
            _mvShare.setViewName("admin/NhaCungCapAdmin/nha-cung-cap-admin");
            return _mvShare;
        }
    }

    @RequestMapping(value = "/sua-nha-cung-cap-admin", method = RequestMethod.POST)
    public ModelAndView saveEditedNhaCungCap(
            HttpSession session,
            @ModelAttribute("editSupplier") NhaCungCap editedSupplier,
            RedirectAttributes redirectAttributes) {

        NguoiDungDto user = (NguoiDungDto) session.getAttribute("loggedInUser");
        if (user == null) {
            return new ModelAndView("redirect:/dang-nhap");
        }
        if (!"Admin".equals(user.getChucVu())) {
            return new ModelAndView("redirect:/loi-dang-nhap");
        }

        try {
            if (editedSupplier.getIdNhaCungCap() == 0) {
                throw new IllegalArgumentException("ID nhà cung cấp không hợp lệ.");
            }
            if (editedSupplier.getTenNhaCungCap() == null || editedSupplier.getTenNhaCungCap().trim().isEmpty()) {
                throw new IllegalArgumentException("Tên nhà cung cấp không được để trống.");
            }
            if (editedSupplier.getDiaChi() == null || editedSupplier.getDiaChi().trim().isEmpty()) {
                throw new IllegalArgumentException("Địa chỉ không được để trống.");
            }
            if (editedSupplier.getSdt() == null || !editedSupplier.getSdt().matches("\\d{10,11}")) {
                throw new IllegalArgumentException("Số điện thoại không hợp lệ (phải có 10-11 chữ số).");
            }
            if (editedSupplier.getEmail() == null || !editedSupplier.getEmail().matches("^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$")) {
                throw new IllegalArgumentException("Email không hợp lệ.");
            }

            NhaCungCap existingSupplier = nhaCungCapServiceImpl.getNhaCungCapById(editedSupplier.getIdNhaCungCap());
            if (existingSupplier == null) {
                throw new IllegalArgumentException("Không tìm thấy nhà cung cấp.");
            }

            nhaCungCapServiceImpl.updateNhaCungCap(editedSupplier);
            System.out.println("Supplier updated successfully: " + editedSupplier.getTenNhaCungCap());
            redirectAttributes.addFlashAttribute("success", "Cập nhật nhà cung cấp thành công!");
            return new ModelAndView("redirect:/nha-cung-cap-admin");
        } catch (IllegalArgumentException e) {
            System.out.println("Validation error: " + e.getMessage());
            _mvShare.addObject("error", e.getMessage());
            _mvShare.addObject("nhaCungCap", nhaCungCapServiceImpl.getAllNhaCungCap());
            _mvShare.setViewName("admin/NhaCungCapAdmin/nha-cung-cap-admin");
            return _mvShare;
        } catch (Exception e) {
            System.out.println("Error updating supplier: " + e.getMessage());
            _mvShare.addObject("error", "Lỗi khi cập nhật nhà cung cấp: " + e.getMessage());
            _mvShare.addObject("nhaCungCap", nhaCungCapServiceImpl.getAllNhaCungCap());
            _mvShare.setViewName("admin/NhaCungCapAdmin/nha-cung-cap-admin");
            return _mvShare;
        }
    }

    @RequestMapping(value = "/xoa-nha-cung-cap-admin/{id}", method = RequestMethod.GET)
    public ModelAndView deleteNhaCungCap(
            @PathVariable("id") int idNhaCungCap,
            HttpSession session,
            RedirectAttributes redirectAttributes) {
        System.out.println("Attempting to delete supplier with ID: " + idNhaCungCap);

        NguoiDungDto user = (NguoiDungDto) session.getAttribute("loggedInUser");
        if (user == null) {
            System.out.println("No logged-in user found, redirecting to /dang-nhap");
            return new ModelAndView("redirect:/dang-nhap");
        }
        if (!"Admin".equals(user.getChucVu())) {
            System.out.println("User role is not Admin, redirecting to /loi-dang-nhap");
            return new ModelAndView("redirect:/loi-dang-nhap");
        }

        try {
            NhaCungCap supplierToDelete = nhaCungCapServiceImpl.getNhaCungCapById(idNhaCungCap);
            if (supplierToDelete == null) {
                System.out.println("Supplier with ID " + idNhaCungCap + " not found");
                redirectAttributes.addFlashAttribute("error", "Nhà cung cấp không tồn tại.");
                return new ModelAndView("redirect:/nha-cung-cap-admin");
            }

            if (nhaCungCapServiceImpl.hasAssociatedProducts(idNhaCungCap)) {
                System.out.println("Supplier with ID " + idNhaCungCap + " has associated products");
                redirectAttributes.addFlashAttribute("error", "Không thể xóa nhà cung cấp vì có sản phẩm liên quan.");
                return new ModelAndView("redirect:/nha-cung-cap-admin");
            }

            nhaCungCapServiceImpl.deleteNhaCungCap(idNhaCungCap);
            System.out.println("Supplier with ID " + idNhaCungCap + " deleted successfully");
            redirectAttributes.addFlashAttribute("success", "Xóa nhà cung cấp thành công!");
            return new ModelAndView("redirect:/nha-cung-cap-admin");
        } catch (Exception e) {
            System.out.println("Error during supplier deletion: " + e.getMessage());
            redirectAttributes.addFlashAttribute("error", "Lỗi khi xóa nhà cung cấp: " + e.getMessage());
            return new ModelAndView("redirect:/nha-cung-cap-admin");
        }
    }
    
    
}