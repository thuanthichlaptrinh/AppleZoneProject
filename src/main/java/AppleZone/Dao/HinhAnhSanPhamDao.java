package AppleZone.Dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import AppleZone.Dto.HinhAnhSanPhamDto;
import AppleZone.Dto.MapperHinhAnhSanPhamDto;

@Repository
public class HinhAnhSanPhamDao extends BaseDao {

	public List<HinhAnhSanPhamDto> GetHinhAnhByIdSanPham(int idSanPham) {
        String sql = "SELECT * FROM HinhAnhSanPham WHERE IDSanPham = '" + idSanPham + "'";
        
        return _jdbcTemplate.query(sql, new MapperHinhAnhSanPhamDto());
    }
	
}
