package AppleZone.Dto;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MapperHinhAnhSanPhamDto implements RowMapper<HinhAnhSanPhamDto> {
    
	@Override
    public HinhAnhSanPhamDto mapRow(ResultSet rs, int rowNum) throws SQLException {
    	HinhAnhSanPhamDto hinhAnh = new HinhAnhSanPhamDto();
        hinhAnh.setIdHinhAnh(rs.getInt("IDHinhAnh"));
        hinhAnh.setIdSanPham(rs.getInt("IDSanPham"));
        hinhAnh.setDuongDanHinhAnh(rs.getString("DuongDanHinhAnh"));
        return hinhAnh;
    }

}