package AppleZone.Entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MapperNhaCungCap implements RowMapper<NhaCungCap> {
	@Override
	public NhaCungCap mapRow(ResultSet rs, int rowNum) throws SQLException {
		NhaCungCap nhaCungCap = new NhaCungCap();
		nhaCungCap.setIdNhaCungCap(rs.getInt("IDNhaCungCap"));
		nhaCungCap.setTenNhaCungCap(rs.getString("TenNhaCungCap"));
		nhaCungCap.setDiaChi(rs.getString("DiaChi"));
		nhaCungCap.setSdt(rs.getString("SDT"));
		nhaCungCap.setEmail(rs.getString("Email"));
		nhaCungCap.setGhiChu(rs.getString("GhiChu"));
        return nhaCungCap;
    }
}
