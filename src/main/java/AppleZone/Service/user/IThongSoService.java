package AppleZone.Service.user;

import java.util.List;

import AppleZone.Dto.SanPhamDto;
import AppleZone.Dto.ThongSoKyThuatDto;

public interface IThongSoService {
	public List<SanPhamDto> GetAllThongso();
	public List<SanPhamDto> GetThongSoTheoLoai(int idLoaiSP);
	public ThongSoKyThuatDto getThongSoByIdSanPham(int idSanPham);
}
