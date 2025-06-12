package AppleZone.Dto;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MapperGioHangDto implements RowMapper<GioHangDto> {
    @Override
    public GioHangDto mapRow(ResultSet rs, int rowNum) throws SQLException {
        GioHangDto item = new GioHangDto();
        item.setIdGioHang(rs.getInt("IDGioHang"));
        item.setNgayTao(rs.getTimestamp("NgayTao"));
        item.setTrangThai(rs.getString("TrangThai"));
        item.setSoLuong(rs.getInt("SoLuong"));
        item.setIdNguoiDung(rs.getInt("IDNguoiDung"));
        item.setIdSanPham(rs.getInt("IDSanPham"));
        item.setTenSanPham(rs.getString("TenSanPham"));
        item.setHinhAnh(rs.getString("HinhAnh"));
        item.setGia(rs.getDouble("Gia"));
        item.setTongTien(rs.getDouble("Gia") * rs.getInt("SoLuong"));
        return item;
    }
}