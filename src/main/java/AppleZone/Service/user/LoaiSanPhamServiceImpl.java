package AppleZone.Service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import AppleZone.Dao.LoaiSanPhamDao;
import AppleZone.Entity.LoaiSanPham;

@Service
public class LoaiSanPhamServiceImpl implements ILoaiSanPhamService {

    @Autowired
    private LoaiSanPhamDao loaiSanPhamDao;

    @Override
    public List<LoaiSanPham> GetDataCategorys() {
        return loaiSanPhamDao.GetDataCategorys();
    }

	@Override
	public LoaiSanPham GetDataCategoryById(int idLoaiSP) {
		return loaiSanPhamDao.GetDataCategoryById(idLoaiSP);
	}
    
    
}