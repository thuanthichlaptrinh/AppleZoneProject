package AppleZone.Service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import AppleZone.Dao.ThongSoKyThuatDao;
import AppleZone.Dto.SanPhamDto;
import AppleZone.Dto.ThongSoKyThuatDto;

@Service
public class ThongSoServiceImpl implements IThongSoService {
	
	@Autowired
	private ThongSoKyThuatDao thongSoKyThuatDao;

	@Override
	public List<SanPhamDto> GetAllThongso() {
		return thongSoKyThuatDao.GetAllThongso();
	}

	@Override
	public List<SanPhamDto> GetThongSoTheoLoai(int idLoaiSP) {
		return thongSoKyThuatDao.GetThongSoTheoLoai(idLoaiSP);
	}

	@Override
	public ThongSoKyThuatDto getThongSoByIdSanPham(int idSanPham) {
		return thongSoKyThuatDao.getThongSoByIdSanPham(idSanPham);
	}

}
