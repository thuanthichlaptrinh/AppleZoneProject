package AppleZone.Dto;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class MapperChiTietDonHangDto implements RowMapper<ChiTietDonHangDto> {
    @Override
    public ChiTietDonHangDto mapRow(ResultSet rs, int rowNum) throws SQLException {
        ChiTietDonHangDto dto = new ChiTietDonHangDto();
        dto.setIdDonHang(rs.getInt("IDDonHang"));
        dto.setIdSanPham(rs.getInt("IDSanPham"));
        dto.setSoLuong(rs.getInt("SoLuong"));
        dto.setGiaBan(rs.getDouble("GiaBan"));
        dto.setThanhTien(rs.getDouble("ThanhTien"));
        return dto;
    }
}