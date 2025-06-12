package AppleZone.Service.user;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import AppleZone.Dao.SanPhamDao;
import AppleZone.Dto.SanPhamDto;
import AppleZone.Entity.LoaiSanPham;
import AppleZone.Dao.LoaiSanPhamDao;

@Service
public class HomeServiceImpl implements IHomeService {
    @Autowired
    private LoaiSanPhamDao _loaiSanPhamDao;
    @Autowired
    private SanPhamDao _sanPhamDao;

    @Override
    public List<LoaiSanPham> GetDataCategorys() {
        return _loaiSanPhamDao.GetDataCategorys();
    }

    @Override
    public List<SanPhamDto> GetAllProducts() {
        return _sanPhamDao.getAllSanPham();
    }
}