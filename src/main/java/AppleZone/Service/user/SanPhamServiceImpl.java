package AppleZone.Service.user;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import AppleZone.Dao.SanPhamDao;
import AppleZone.Dao.ThongSoKyThuatDao;
import AppleZone.Dao.BaseDao;
import AppleZone.Dao.HinhAnhSanPhamDao;
import AppleZone.Dto.SanPhamDto;
import AppleZone.Dto.ThongSoKyThuatDto;
import AppleZone.Dto.HinhAnhSanPhamDto;
import AppleZone.Dto.MapperSanPhamDto;
import AppleZone.Dto.MapperThongSoKyThuat;

@Service
public class SanPhamServiceImpl implements ISanPhamService {

	@Autowired
    private SanPhamDao sanPhamDao;

    @Autowired
    private ThongSoKyThuatDao thongSoKyThuatDao;

    @Autowired
    private HinhAnhSanPhamDao hinhAnhSanPhamDao;

    @Override
    public SanPhamDto getSanPhamById(int idSanPham) { 
        return sanPhamDao.getSanPhamById(idSanPham);
    }

    @Override
    public ThongSoKyThuatDto getThongSoByIdSanPham(int idSanPham) {
        return thongSoKyThuatDao.getThongSoByIdSanPham(idSanPham);
    }

    @Override
    public List<HinhAnhSanPhamDto> getHinhAnhByIdSanPham(int idSanPham) {
        return hinhAnhSanPhamDao.GetHinhAnhByIdSanPham(idSanPham);
    }

    @Override
    public List<SanPhamDto> getAllSanPham() { 
        return sanPhamDao.getAllSanPham();
    } 
    
    @Override
    public List<SanPhamDto> getSanPhamByLoaiSP(int idLoaiSP) { 
        return sanPhamDao.getSanPhamByLoaiSP(idLoaiSP);
    }

	@Override
	public List<SanPhamDto> getSanPhamByName(String keyword, String sort) { 
		return sanPhamDao.getSanPhamByName(keyword, sort);
	}

	@Override
	public void saveSanPham(SanPhamDto sanPham) {
		sanPhamDao.saveSanPham(sanPham);
	}

	@Override
	public void updateSanPham(SanPhamDto sanPhamDto) {
		sanPhamDao.updateSanPham(sanPhamDto);
	}

	@Override
	public boolean xoaSanPham(int idSanPham) {
		return sanPhamDao.xoaSanPham(idSanPham);
	}

	@Override
	public boolean hasAssociatedOrders(int idSanPham) {
		return sanPhamDao.hasAssociatedOrders(idSanPham);
	}

	@Override
	public void updateSoLuongTon(int idSanPham, int soLuong) {
		sanPhamDao.updateSoLuongTon(idSanPham, soLuong);
	}

	@Override
	public int countTotalProducts() {
		return sanPhamDao.countTotalProducts();
	}

	@Override
	public List<SanPhamDto> getPaginatedSanPham(int page, int size) {
		return sanPhamDao.getPaginatedSanPham(page, size);
	}

	@Override
	public int getTotalSanPhamCount() {
		return sanPhamDao.getTotalSanPhamCount();
	}
 
}