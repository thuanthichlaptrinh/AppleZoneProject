package AppleZone.Dao;

import AppleZone.Dto.ChiTietDonHangDto;
import AppleZone.Dto.MapperChiTietDonHangDto;

import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ChiTietDonHangDao extends BaseDao {
    public void addOrderDetail(int idDonHang, int idSanPham, int soLuong, double giaBan) {
        String sql = "INSERT INTO ChiTietDonHang (IDDonHang, IDSanPham, SoLuong, GiaBan) VALUES (?, ?, ?, ?)";
        _jdbcTemplate.update(sql, idDonHang, idSanPham, soLuong, giaBan);
    }

    public List<ChiTietDonHangDto> getOrderDetailsByOrderId(int idDonHang) {
        String sql = "SELECT IDDonHang, IDSanPham, SoLuong, GiaBan, ThanhTien FROM ChiTietDonHang WHERE IDDonHang = ?";
        return _jdbcTemplate.query(sql, new Object[]{idDonHang}, new MapperChiTietDonHangDto());
    }
}