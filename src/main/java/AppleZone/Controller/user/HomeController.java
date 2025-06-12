package AppleZone.Controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import AppleZone.Service.user.IHomeService;
import AppleZone.Entity.LoaiSanPham;
import AppleZone.Dto.SanPhamDto;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.List;

@Controller
public class HomeController extends BaseController {
    @Autowired
    private IHomeService _homeService;
     
    @RequestMapping(value = {"/", "/trang-chu"})
    public ModelAndView Index() { 
        _mvShare.setViewName("user/index"); 
        
        List<LoaiSanPham> categories = _homeService.GetDataCategorys();
        _mvShare.addObject("categories", categories);

        List<SanPhamDto> allProducts = _homeService.GetAllProducts();
        _mvShare.addObject("allProducts", allProducts);

        return _mvShare;
    }
}