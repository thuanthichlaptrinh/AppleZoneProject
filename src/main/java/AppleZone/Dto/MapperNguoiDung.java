package AppleZone.Dto;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

public class MapperNguoiDung implements RowMapper<NguoiDungDto> {
    @Override
    public NguoiDungDto mapRow(ResultSet rs, int rowNum) throws SQLException {
        NguoiDungDto nguoiDung = new NguoiDungDto();
        nguoiDung.setIdNguoiDung(rs.getInt("IDNguoiDung"));
        nguoiDung.setTenNguoiDung(rs.getString("TenNguoiDung"));
        nguoiDung.setSdt(rs.getString("SDT"));
        nguoiDung.setEmail(rs.getString("Email"));
        nguoiDung.setMatKhau(rs.getString("MatKhau"));
        nguoiDung.setDiaChi(rs.getString("DiaChi"));
        nguoiDung.setNgayTao(rs.getTimestamp("NgayTao"));
        nguoiDung.setChucVu(rs.getString("ChucVu")); 
        nguoiDung.setHinhAnh(rs.getString("HinhAnh"));
        return nguoiDung;
    }
}