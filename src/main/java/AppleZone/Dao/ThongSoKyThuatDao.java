package AppleZone.Dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import AppleZone.Dto.MapperSanPhamDto;
import AppleZone.Dto.MapperThongSoKyThuat;
import AppleZone.Dto.SanPhamDto;
import AppleZone.Dto.ThongSoKyThuatDto;

@Repository
public class ThongSoKyThuatDao extends BaseDao {

	public List<SanPhamDto> GetAllThongso() {
		String sql = "SELECT * FROM ThongSoKyThuat";
		return _jdbcTemplate.query(sql, new MapperSanPhamDto());
	}

	public List<SanPhamDto> GetThongSoTheoLoai(int idLoaiSP) {
		String sql = "SELECT * FROM ThongSoKyThuat WHERE IDSanPham = '" + idLoaiSP + "'";
		return _jdbcTemplate.query(sql, new MapperSanPhamDto());
	}

	public ThongSoKyThuatDto getThongSoByIdSanPham(int idSanPham) {
		return _jdbcTemplate.queryForObject(
				"SELECT * FROM ThongSoKyThuat WHERE IDSanPham = ?",
				new Object[] { idSanPham },
				new MapperThongSoKyThuat());
	}

}
