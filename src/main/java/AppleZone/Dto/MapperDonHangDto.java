package AppleZone.Dto;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class MapperDonHangDto implements RowMapper<DonHangDto> {
    @Override
    public DonHangDto mapRow(ResultSet rs, int rowNum) throws SQLException {
        DonHangDto dto = new DonHangDto();
        dto.setIdDonHang(rs.getInt("IDDonHang"));
        dto.setNgayDat(rs.getTimestamp("NgayDat"));
        dto.setNgayGiao(rs.getTimestamp("NgayGiao"));
        dto.setTongTien(rs.getDouble("TongTien"));
        dto.setTrangThai(rs.getString("TrangThai"));
        dto.setDiaChi(rs.getString("DiaChi"));
        dto.setIdNguoiDung(rs.getInt("IDNguoiDung"));
        return dto;
    }
}