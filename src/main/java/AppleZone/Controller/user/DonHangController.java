package AppleZone.Controller.user;

import AppleZone.Dao.SanPhamDao;
import AppleZone.Dto.ChiTietDonHangDto;
import AppleZone.Dto.DonHangDto;
import AppleZone.Dto.GioHangDto;
import AppleZone.Dto.NguoiDungDto;
import AppleZone.Dto.SanPhamDto;
import AppleZone.Dto.ThanhToanDto;
import AppleZone.Service.user.DonHangServiceImpl;
import AppleZone.Service.user.GioHangServiceImpl;
import AppleZone.Service.user.ThanhToanServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller; 
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.dao.DataAccessException;

import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.List;

@Controller
public class DonHangController extends BaseController {
    @Autowired
    private GioHangServiceImpl gioHangService;
    @Autowired
    private DonHangServiceImpl donHangService;
    @Autowired
    private ThanhToanServiceImpl thanhToanService;
    @Autowired
    private SanPhamDao sanPhamDao;

    @RequestMapping(value = {"/xac-nhan-dat-hang"})
    public ModelAndView DonDaDat(@RequestParam(value = "donHangId", required = false) Integer donHangId, HttpSession session) {
        NguoiDungDto user = (NguoiDungDto) session.getAttribute("loggedInUser");
        if (user == null) {
            return new ModelAndView("redirect:/dang-nhap");
        }

        _mvShare.setViewName("user/orders/order-confirmation");
        if (donHangId != null) {
            DonHangDto donHang = donHangService.getOrderById(donHangId);
            if (donHang == null) {
                _mvShare.addObject("error", "Đơn hàng không tồn tại.");
                return _mvShare;
            }
            List<ChiTietDonHangDto> chiTietDonHangs = donHangService.getOrderDetailsByOrderId(donHangId);
            ThanhToanDto thanhToan = thanhToanService.getPaymentByOrderId(donHangId);

            _mvShare.addObject("donHang", donHang);
            _mvShare.addObject("chiTietDonHangs", chiTietDonHangs);
            _mvShare.addObject("thanhToan", thanhToan);
            _mvShare.addObject("loggedInUser", user);
        } else {
            _mvShare.addObject("error", "Không tìm thấy thông tin đơn hàng.");
        }
        return _mvShare;
    }

    //@Transactional(rollbackOn = {DataAccessException.class, IllegalArgumentException.class})
    @RequestMapping(value = "/process-order", method = RequestMethod.POST)
    public ModelAndView processOrder(
            @RequestParam(value = "deliveryMethod", required = false, defaultValue = "store") String deliveryMethod,
            @RequestParam(value = "storeLocation", required = false, defaultValue = "hn3") String storeLocation,
            @RequestParam(value = "paymentMethod", required = false, defaultValue = "cod") String paymentMethod,
            @RequestParam(value = "orderNote", required = false) String orderNote,
            @RequestParam(value = "invoice", required = false, defaultValue = "false") String invoice,
            HttpSession session) {

        NguoiDungDto user = (NguoiDungDto) session.getAttribute("loggedInUser");
       
        if (user == null) {
            return new ModelAndView("redirect:/dang-nhap");
        }

        try {
            // Get cart items
            List<GioHangDto> cartItems = gioHangService.getCartItems(user.getIdNguoiDung());
            if (cartItems == null || cartItems.isEmpty()) {
                _mvShare.addObject("error", "Giỏ hàng trống, không thể đặt hàng.");
                _mvShare.setViewName("redirect:/gio-hang");
                return _mvShare;
            }

            // Validate cart items and calculate total amount
            double totalAmount = 0;
            for (GioHangDto item : cartItems) {
                if (item.getSoLuong() <= 0 || item.getGia() < 0) {
                    throw new IllegalArgumentException("Số lượng hoặc giá sản phẩm không hợp lệ: sản phẩm ID " + item.getIdSanPham());
                }
                totalAmount += item.getSoLuong() * item.getGia();
            }

            // Validate inventory
            for (GioHangDto item : cartItems) {
                SanPhamDto sanPham = sanPhamDao.getSanPhamById(item.getIdSanPham());
                if (sanPham == null || sanPham.getSoLuongTon() < item.getSoLuong()) {
                    throw new IllegalArgumentException("Số lượng tồn kho không đủ cho sản phẩm ID: " + item.getIdSanPham());
                }
            }

            // Determine address based on delivery method
            String diaChi = user.getDiaChi();

            // Create order DTO
            Timestamp ngayDat = new Timestamp(System.currentTimeMillis());
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(ngayDat);
            calendar.add(Calendar.DAY_OF_MONTH, 3);
            Timestamp ngayGiao = new Timestamp(calendar.getTimeInMillis());

            DonHangDto donHangDto = new DonHangDto();
            donHangDto.setIdNguoiDung(user.getIdNguoiDung());
            donHangDto.setTongTien(totalAmount);
            donHangDto.setTrangThai("Chờ duyệt");
            donHangDto.setDiaChi(diaChi);
            donHangDto.setNgayDat(ngayDat);
            donHangDto.setNgayGiao(ngayGiao);

            int idDonHang = donHangService.createOrder(donHangDto);

            // Create order details and update inventory
            for (GioHangDto item : cartItems) {
                donHangService.addOrderDetail(idDonHang, item.getIdSanPham(), item.getSoLuong(), item.getGia());
                sanPhamDao.updateSoLuongTon(item.getIdSanPham(), item.getSoLuong());
            }

            // Create payment record
            thanhToanService.createPayment(idDonHang, paymentMethod, totalAmount, "Chưa thanh toán", null);

            // Clear cart
            gioHangService.clearCart(user.getIdNguoiDung());

            // Prepare data for confirmation page
            _mvShare.addObject("donHangId", idDonHang);
            _mvShare.setViewName("redirect:/xac-nhan-dat-hang?donHangId=" + idDonHang);
            return _mvShare;

        } catch (IllegalArgumentException e) {
            _mvShare.addObject("error", "Lỗi dữ liệu: " + e.getMessage());
            _mvShare.setViewName("redirect:/gio-hang");
            return _mvShare;
        } catch (DataAccessException e) {
            _mvShare.addObject("error", "Lỗi cơ sở dữ liệu khi đặt hàng: " + e.getMessage());
            _mvShare.setViewName("redirect:/gio-hang");
            return _mvShare;
        } catch (Exception e) {
            _mvShare.addObject("error", "Lỗi hệ thống khi đặt hàng: " + e.getMessage());
            _mvShare.setViewName("redirect:/gio-hang");
            return _mvShare;
        }
    }
}