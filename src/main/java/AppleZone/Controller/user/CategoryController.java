package AppleZone.Controller.user;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import AppleZone.Dto.SanPhamDto;
import AppleZone.Service.user.ISanPhamService;
import AppleZone.Service.user.SanPhamServiceImpl;
import AppleZone.Service.user.ILoaiSanPhamService;
import AppleZone.Entity.LoaiSanPham;

@Controller
public class CategoryController extends BaseController {

    @Autowired
    private ISanPhamService sanPhamService;

    @Autowired
    private ILoaiSanPhamService loaiSanPhamService;
     

    @RequestMapping(value = "/san-pham")
    public ModelAndView Index(@RequestParam(value = "idLoaiSP", required = false) Integer idLoaiSP) {
        _mvShare.setViewName("user/products/category");  

        if (idLoaiSP != null) {
            // Lấy danh sách sản phẩm theo idLoaiSP
            List<SanPhamDto> products = sanPhamService.getSanPhamByLoaiSP(idLoaiSP);
            _mvShare.addObject("products", products);

            // Lấy tên danh mục
            LoaiSanPham category = loaiSanPhamService.GetDataCategoryById(idLoaiSP);
            if (category != null) {
                _mvShare.addObject("categoryName", category.getTenLoaiSP());
            }
        } else {
            _mvShare.addObject("products", sanPhamService.getAllSanPham()); // Hiển thị tất cả sản phẩm nếu không có idLoaiSP
            _mvShare.addObject("categoryName", "Tất cả sản phẩm");
        }

        // Lấy danh sách danh mục để hiển thị breadcrumb
        List<LoaiSanPham> categories = loaiSanPhamService.GetDataCategorys();
        _mvShare.addObject("categories", categories);

        return _mvShare;
    }
    
    @RequestMapping(value = "/tim-kiem", method = RequestMethod.GET)
    public ModelAndView SearchProduct(@RequestParam(value = "keyword", required = false) String keyword,
                                     @RequestParam(value = "sort", required = false) String sort) {
        _mvShare.setViewName("user/searchs/search-product");  
        if (keyword != null && !keyword.trim().isEmpty()) {
            List<SanPhamDto> products = sanPhamService.getSanPhamByName(keyword, sort);
            if (sort != null) {
                if ("price_asc".equals(sort)) {
                    Collections.sort(products, Comparator.comparing(SanPhamDto::getGia));
                } else if ("price_desc".equals(sort)) {
                    Collections.sort(products, Comparator.comparing(SanPhamDto::getGia).reversed());
                } else if ("newest".equals(sort)) {
                    // Assuming idSanPham or ngayTao for newest; use idSanPham if no date
                    Collections.sort(products, Comparator.comparing(SanPhamDto::getIdSanPham).reversed());
                }
            }
            _mvShare.addObject("products", products);
            _mvShare.addObject("categoryName", "Kết quả tìm kiếm cho: " + keyword);
        } else {
            _mvShare.addObject("products", null);
            _mvShare.addObject("categoryName", "Tìm kiếm sản phẩm");
        }
        _mvShare.addObject("selectedSort", sort);
        return _mvShare;
    }
}