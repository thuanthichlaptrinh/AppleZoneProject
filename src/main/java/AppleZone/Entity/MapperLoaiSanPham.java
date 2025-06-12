package AppleZone.Entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MapperLoaiSanPham implements RowMapper<LoaiSanPham> {
	@Override
	public LoaiSanPham mapRow(ResultSet rs, int rowNum) throws SQLException {
        LoaiSanPham category = new LoaiSanPham();
        category.setIdLoaiSP(rs.getInt("IDLoaiSP"));
        category.setTenLoaiSP(rs.getString("TenLoaiSP"));
        return category;
    }
}
