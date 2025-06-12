package AppleZone.Service.user;

import java.util.List;

import org.springframework.stereotype.Service;

import AppleZone.Dto.SanPhamDto;
import AppleZone.Entity.LoaiSanPham;

@Service
public interface IHomeService {
    List<LoaiSanPham> GetDataCategorys();
    List<SanPhamDto> GetAllProducts();
}