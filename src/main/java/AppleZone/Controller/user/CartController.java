package AppleZone.Controller.user;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import AppleZone.Dto.GioHangDto;
import AppleZone.Dto.NguoiDungDto;
import AppleZone.Service.user.IGioHangService;

@Controller
public class CartController extends BaseController {
    @Autowired
    private IGioHangService gioHangService;

    @RequestMapping(value = "/gio-hang")
    public ModelAndView Index(HttpSession session) {
        NguoiDungDto user = (NguoiDungDto) session.getAttribute("loggedInUser");
        if (user == null) {
            return new ModelAndView("redirect:/dang-nhap");
        }

        List<GioHangDto> cartItems = gioHangService.getCartItems(user.getIdNguoiDung());
        double totalAmount = 0.0;
        
        if (cartItems != null && !cartItems.isEmpty()) {
            for (GioHangDto item : cartItems) {
                totalAmount += item.getTongTien();
            }
        } else {
            _mvShare.addObject("status", "Giỏ hàng đang trống");
        }

        _mvShare.addObject("cartItems", cartItems);
        _mvShare.addObject("totalAmount", totalAmount);
        _mvShare.addObject("user", user);
        _mvShare.setViewName("user/cart/cart");
        return _mvShare;
    }

    @RequestMapping(value = "/them-vao-gio-hang", method = RequestMethod.POST)
    public ModelAndView addToCart(@RequestParam("idSanPham") int idSanPham, HttpSession session) {
        NguoiDungDto user = (NguoiDungDto) session.getAttribute("loggedInUser");
        if (user == null) {
            return new ModelAndView("redirect:/dang-nhap");
        }
 
        Timestamp ngayTao = new Timestamp(new Date().getTime());
        gioHangService.addToCart(user.getIdNguoiDung(), idSanPham, 1, ngayTao);
        return new ModelAndView("redirect:/gio-hang");
    }
    
    @RequestMapping(value = "/remove-from-cart", method = RequestMethod.POST)
    public ModelAndView removeFromCart(@RequestParam("idGioHang") int idGioHang, HttpSession session) {
        NguoiDungDto user = (NguoiDungDto) session.getAttribute("loggedInUser");
        
        if (user != null) {
            try {
                gioHangService.removeFromCart(idGioHang);
            } catch (Exception e) {
                _mvShare.addObject("error", "Lỗi khi xóa sản phẩm: " + e.getMessage());
            }
        } else {
            return new ModelAndView("redirect:/dang-nhap");
        }
        
        return new ModelAndView("redirect:/gio-hang");  
    }
    
    @RequestMapping(value = "/update-cart-quantity", method = RequestMethod.POST)
    public ModelAndView updateCartQuantity(@RequestParam("idGioHang") int idGioHang, @RequestParam("action") String action, HttpSession session) {
        NguoiDungDto user = (NguoiDungDto) session.getAttribute("loggedInUser");
        if (user != null) {
            try {
                GioHangDto item = gioHangService.getCartItemById(idGioHang);
                if (item != null) {
                    int currentSoLuong = item.getSoLuong();
                    int newSoLuong = currentSoLuong;
                    if ("increase".equals(action)) {
                        newSoLuong = currentSoLuong + 1;
                    } else if ("decrease".equals(action) && currentSoLuong > 1) {
                        newSoLuong = currentSoLuong - 1;
                    }
                    if (newSoLuong != currentSoLuong) { // Only update if quantity changes
                        gioHangService.updateCartQuantity(idGioHang, newSoLuong);
                    } else {
                        _mvShare.addObject("error", "Số lượng không thay đổi.");
                    }
                } else {
                    _mvShare.addObject("error", "Không tìm thấy sản phẩm trong giỏ hàng.");
                }
            } catch (Exception e) {
                _mvShare.addObject("error", "Lỗi khi cập nhật số lượng: " + e.getMessage());
            }
        } else {
            return new ModelAndView("redirect:/dang-nhap");
        }
        return new ModelAndView("redirect:/gio-hang");  
    }
}