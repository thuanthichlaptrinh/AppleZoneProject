package AppleZone.Entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
 

public class SanPhamMapper implements RowMapper<SanPham>{

	@Override
    public SanPham mapRow(ResultSet rs, int rowNum) throws SQLException {
        SanPham product = new SanPham();
        product.setIdSanPham(rs.getInt("IDSanPham"));
        product.setTenSanPham(rs.getString("TenSanPham"));
        product.setMoTa(rs.getString("MoTa"));
        product.setGia(rs.getDouble("Gia"));
        product.setMoi(rs.getBoolean("Moi"));
        product.setNoiBat(rs.getBoolean("NoiBat"));
        product.setTrangThai(rs.getBoolean("TrangThai"));
        product.setSoLuongTon(rs.getInt("SoLuongTon"));
        product.setHinhAnh(rs.getString("HinhAnh"));
        product.setNgayTao(rs.getDate("NgayTao"));
        product.setDonViTinh(rs.getString("DonViTinh")); 
        return product;
    }
 
}
