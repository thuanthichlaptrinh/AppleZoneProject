package AppleZone.Service.user;

import java.util.List;

import org.springframework.stereotype.Service;

import AppleZone.Entity.LoaiSanPham;

@Service
public interface ILoaiSanPhamService {
    List<LoaiSanPham> GetDataCategorys(); 
    LoaiSanPham GetDataCategoryById(int idLoaiSP);
}