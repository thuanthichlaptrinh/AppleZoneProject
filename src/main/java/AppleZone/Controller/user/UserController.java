package AppleZone.Controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import AppleZone.Dto.DonHangDto;
import AppleZone.Dto.NguoiDungDto;
import AppleZone.Service.user.DonHangServiceImpl;
import AppleZone.Service.user.NguoiDungServiceImpl;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

@Controller
public class UserController extends BaseController {

    @Autowired
    private NguoiDungServiceImpl nguoiDungService;
    @Autowired
    private DonHangServiceImpl donHangService; 

    @RequestMapping(value = "/dang-ky", method = RequestMethod.GET)
    public ModelAndView Register() {
        _mvShare.setViewName("user/account/register");
        _mvShare.addObject("user", new NguoiDungDto());
        return _mvShare;
    }

    @RequestMapping(value = "/dang-ky", method = RequestMethod.POST)
    public ModelAndView RegisterProcess(@ModelAttribute("user") NguoiDungDto user) {
        NguoiDungDto existingBySdt = nguoiDungService.getNguoiDungBySdt(user.getSdt());
        NguoiDungDto existingByEmail = nguoiDungService.getNguoiDungByEmail(user.getEmail());
        
        if (existingBySdt != null || existingByEmail != null) {
            _mvShare.addObject("error", "Số điện thoại hoặc email đã được sử dụng!");
            _mvShare.setViewName("user/account/register");
            return _mvShare;
        }

        user.setNgayTao(new Date());  
        user.setChucVu("User");
        nguoiDungService.saveNguoiDung(user);

        _mvShare.addObject("success", "Đăng ký thành công! Vui lòng đăng nhập.");
        _mvShare.setViewName("user/account/register");
        return _mvShare;
    }

    @RequestMapping(value = "/dang-nhap", method = RequestMethod.GET)
    public ModelAndView Login() {
        _mvShare.setViewName("user/account/login");
        _mvShare.addObject("user", new NguoiDungDto());
        return _mvShare;
    }

    @RequestMapping(value = "/dang-nhap", method = RequestMethod.POST)
    public ModelAndView LoginProcess(@ModelAttribute("user") NguoiDungDto user, HttpSession session) {
        NguoiDungDto dbUser = nguoiDungService.getNguoiDungBySdt(user.getSdt());
        
        if (dbUser == null) {
            _mvShare.addObject("error", "Số điện thoại không tồn tại!");
            _mvShare.setViewName("user/account/login");
            return _mvShare;
        }

        if (!BCrypt.checkpw(user.getMatKhau(), dbUser.getMatKhau())) {
            _mvShare.addObject("error", "Số điện thoại hoặc mật khẩu không đúng!");
            _mvShare.setViewName("user/account/login");
            return _mvShare;
        }
 
        session.setAttribute("loggedInUser", dbUser);
        if ("Admin".equals(dbUser.getChucVu())) {
            return new ModelAndView("redirect:/quan-tri");
        } else {
            return new ModelAndView("redirect:/trang-chu");
        }
    }
    
    
    @RequestMapping(value = "/dang-xuat", method = RequestMethod.GET)
    public ModelAndView Logout(HttpSession session) {
        session.invalidate(); 
        return new ModelAndView("redirect:/dang-nhap");
    }
      
    @RequestMapping(value = "/thong-tin-cua-toi", method = RequestMethod.GET)
    public ModelAndView UserProfile(HttpSession session) {
        NguoiDungDto user = (NguoiDungDto) session.getAttribute("loggedInUser");
        
        if (user == null) {
            return new ModelAndView("redirect:/dang-nhap");
        }
        
        _mvShare.addObject("user", user);
        _mvShare.setViewName("user/account/profile");
        
        return _mvShare;
    } 
    
    @RequestMapping(value = "/don-dat-hang", method = RequestMethod.GET)
    public ModelAndView DonDaDat(HttpSession session) {  
        NguoiDungDto user = (NguoiDungDto) session.getAttribute("loggedInUser");
        if (user == null) {
            return new ModelAndView("redirect:/dang-nhap");
        }

        List<DonHangDto> orders = donHangService.getOrdersByUserId(user.getIdNguoiDung());
        _mvShare.addObject("orders", orders);
        _mvShare.setViewName("user/orders/order");  
        return _mvShare;
    }
}