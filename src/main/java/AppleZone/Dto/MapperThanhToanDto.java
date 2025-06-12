package AppleZone.Dto;
 
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class MapperThanhToanDto implements RowMapper<ThanhToanDto> {
    @Override
    public ThanhToanDto mapRow(ResultSet rs, int rowNum) throws SQLException {
        ThanhToanDto dto = new ThanhToanDto();
        dto.setIdThanhToan(rs.getInt("IDThanhToan"));
        dto.setIdDonHang(rs.getInt("IDDonHang"));
        dto.setPhuongThuc(rs.getString("PhuongThuc"));
        dto.setNgayThanhToan(rs.getTimestamp("NgayThanhToan"));
        dto.setTongTienThanhToan(rs.getDouble("TongTienThanhToan"));
        dto.setTrangThai(rs.getString("TrangThai"));
        return dto;
    }
}