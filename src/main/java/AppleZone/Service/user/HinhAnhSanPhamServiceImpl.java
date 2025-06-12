package AppleZone.Service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import AppleZone.Dao.HinhAnhSanPhamDao;
import AppleZone.Dto.HinhAnhSanPhamDto;

@Service
public class HinhAnhSanPhamServiceImpl implements IHinhAnhSanPhamService {
	
	@Autowired
	private HinhAnhSanPhamDao hinhAnhSanPhamDao;
	
	@Override
	public List<HinhAnhSanPhamDto> GetHinhAnhByIdSanPham(int idSanPham){
		return hinhAnhSanPhamDao.GetHinhAnhByIdSanPham(idSanPham);
	}

}
