/*package AppleZone.Controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping; 
import org.springframework.web.servlet.ModelAndView;

import AppleZone.Service.user.ISanPhamService;

@Controller
public class ProductController extends BaseController {

    @Autowired
    private ISanPhamService sanPhamService;

    @RequestMapping(value = {"/chi-tiet-san-pham"})
    public ModelAndView Index() {
        _mvShare.setViewName("user/products/product"); 
        return _mvShare;
    }
}
*/

package AppleZone.Controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import AppleZone.Service.user.ISanPhamService;
import AppleZone.Service.user.ILoaiSanPhamService;
import AppleZone.Dto.SanPhamDto;
import AppleZone.Dto.ThongSoKyThuatDto;
import AppleZone.Entity.LoaiSanPham;
import AppleZone.Dao.LoaiSanPhamDao;
import AppleZone.Dto.HinhAnhSanPhamDto;
import java.util.List;

@Controller
public class ProductController extends BaseController {

    @Autowired
    private ISanPhamService sanPhamService;

    @Autowired
    private ILoaiSanPhamService loaiSanPhamService;

    @RequestMapping(value = {"/chi-tiet-san-pham"})
    public ModelAndView Index(@RequestParam(value = "idSanPham", required = true) int idSanPham) {
        _mvShare.setViewName("user/products/product");
        
        // Lấy thông tin sản phẩm
        SanPhamDto sanPham = sanPhamService.getSanPhamById(idSanPham);
        if (sanPham != null) {
            _mvShare.addObject("sanPham", sanPham);

            // Lấy thông số kỹ thuật
            ThongSoKyThuatDto thongSo = sanPhamService.getThongSoByIdSanPham(idSanPham);
            _mvShare.addObject("thongSo", thongSo);

            // Lấy danh sách hình ảnh bổ sung
            List<HinhAnhSanPhamDto> hinhAnhList = sanPhamService.getHinhAnhByIdSanPham(idSanPham);
            _mvShare.addObject("hinhAnhList", hinhAnhList);

            // Lấy danh sách sản phẩm tương tự
            List<SanPhamDto> allProducts = sanPhamService.getAllSanPham(); // Giả sử có phương thức này
            _mvShare.addObject("allProducts", allProducts);

            // Lấy danh sách danh mục
            List<LoaiSanPham> categories = loaiSanPhamService.GetDataCategorys();
            _mvShare.addObject("categories", categories);
        } else {
            _mvShare.setViewName("error");
        }

        return _mvShare;
    }
}