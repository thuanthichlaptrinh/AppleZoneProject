package AppleZone.Dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Repository;

import AppleZone.Dto.GioHangDto;
import AppleZone.Dto.MapperGioHangDto;

@Repository
public class GioHangDao extends BaseDao {
    
	public void addToCart(int idNguoiDung, int idSanPham, int soLuong, java.sql.Timestamp ngayTao) {
        String sqlCheck = "SELECT COUNT(*) FROM GioHang WHERE IDNguoiDung = ? AND IDSanPham = ?";
        int count = _jdbcTemplate.queryForObject(sqlCheck, Integer.class, idNguoiDung, idSanPham);

        String sqlGetPrice = "SELECT Gia FROM SanPham WHERE IDSanPham = ?";
        double gia = _jdbcTemplate.queryForObject(sqlGetPrice, Double.class, idSanPham);
        double tongTien = gia * soLuong;

        if (count > 0) {
            String sqlUpdate = "UPDATE GioHang SET SoLuong = SoLuong + ?, TongTien = TongTien + ?, TrangThai = 'Chưa hoàn tất' WHERE IDNguoiDung = ? AND IDSanPham = ?";
            _jdbcTemplate.update(sqlUpdate, soLuong, tongTien, idNguoiDung, idSanPham);
        } else {
            String sqlInsert = "INSERT INTO GioHang (IDNguoiDung, IDSanPham, SoLuong, NgayTao, TrangThai, TongTien) VALUES (?, ?, ?, ?, 'Chưa hoàn tất', ?)";
            _jdbcTemplate.update(sqlInsert, idNguoiDung, idSanPham, soLuong, ngayTao, tongTien);
        }
    }

    public List<GioHangDto> getCartItems(int idNguoiDung) {
        String sql = "SELECT g.IDGioHang, g.NgayTao, g.TrangThai, g.SoLuong, g.IDNguoiDung, g.IDSanPham, " +
                     "s.TenSanPham, s.HinhAnh, s.Gia " +
                     "FROM GioHang g LEFT JOIN SanPham s ON g.IDSanPham = s.IDSanPham " +
                     "WHERE g.IDNguoiDung = ?";
        return _jdbcTemplate.query(sql, new MapperGioHangDto(), idNguoiDung);
    }

    public void updateCartQuantity(int idGioHang, int soLuong) {
        try {
            String sqlGetPrice = "SELECT Gia FROM GioHang g JOIN SanPham s ON g.IDSanPham = s.IDSanPham WHERE g.IDGioHang = ?";
            double gia = _jdbcTemplate.queryForObject(sqlGetPrice, Double.class, idGioHang);
            if (gia <= 0) {
                throw new IllegalStateException("Giá sản phẩm không hợp lệ cho IDGioHang: " + idGioHang);
            }
            double newTongTien = gia * soLuong;

            String sql = "UPDATE GioHang SET SoLuong = ?, TongTien = ? WHERE IDGioHang = ?";
            int rowsAffected = _jdbcTemplate.update(sql, soLuong, newTongTien, idGioHang);
            if (rowsAffected == 0) {
                throw new RuntimeException("Không thể cập nhật số lượng cho IDGioHang: " + idGioHang);
            }
        } catch (Exception e) {
            throw new RuntimeException("Lỗi khi cập nhật số lượng: " + e.getMessage());
        }
    }

    public void removeFromCart(int idGioHang) {
        String sql = "DELETE FROM GioHang WHERE IDGioHang = ?";
        _jdbcTemplate.update(sql, idGioHang);
    }
    
    public GioHangDto getCartItemById(int idGioHang) {
        String sql = "SELECT g.IDGioHang, g.NgayTao, g.TrangThai, g.SoLuong, g.IDNguoiDung, g.IDSanPham, " +
                     "s.TenSanPham, s.HinhAnh, s.Gia " +
                     "FROM GioHang g LEFT JOIN SanPham s ON g.IDSanPham = s.IDSanPham " +
                     "WHERE g.IDGioHang = ?";
        try {
            return _jdbcTemplate.queryForObject(sql, new MapperGioHangDto(), idGioHang);
        } catch (EmptyResultDataAccessException e) {
            return null; // Return null if no item is found
        }
    }  
    
    public void clearCart(int idNguoiDung) {
        String sql = "DELETE FROM GioHang WHERE IDNguoiDung = ? AND TrangThai = 'Chưa hoàn tất'";
        _jdbcTemplate.update(sql, idNguoiDung);
    }
}