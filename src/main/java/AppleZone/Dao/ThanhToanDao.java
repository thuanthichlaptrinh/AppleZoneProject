package AppleZone.Dao;

import AppleZone.Dto.MapperThanhToanDto;
import AppleZone.Dto.ThanhToanDto;
import org.springframework.stereotype.Repository;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

@Repository
public class ThanhToanDao extends BaseDao {
    public int createPayment(int idDonHang, String phuongThuc, double tongTien, String trangThai, Timestamp ngayThanhToan) {
        String sql = "INSERT INTO ThanhToan (IDDonHang, PhuongThuc, TongTienThanhToan, TrangThai, NgayThanhToan) VALUES (?, ?, ?, ?, ?)";
        _jdbcTemplate.update(sql, idDonHang, phuongThuc, tongTien, trangThai, null);
        return _jdbcTemplate.queryForObject("SELECT @@IDENTITY", Integer.class);
    }

    public ThanhToanDto getPaymentByOrderId(int idDonHang) {
        String sql = "SELECT * FROM ThanhToan WHERE IDDonHang = ?";
        List<ThanhToanDto> result = _jdbcTemplate.query(sql, new Object[]{idDonHang}, new MapperThanhToanDto());
        return result.isEmpty() ? null : result.get(0);
    }
    
    public List<ThanhToanDto> getAllPayments() {
        String sql = "SELECT * FROM ThanhToan";
        return _jdbcTemplate.query(sql, new MapperThanhToanDto());
    }

    public ThanhToanDto getPaymentById(int idThanhToan) {
        String sql = "SELECT * FROM ThanhToan WHERE IDThanhToan = ?";
        List<ThanhToanDto> result = _jdbcTemplate.query(sql, new Object[]{idThanhToan}, new MapperThanhToanDto());
        return result.isEmpty() ? null : result.get(0);
    }

    public void updatePayment(ThanhToanDto thanhToan) {
        String sql = "UPDATE ThanhToan SET IDDonHang = ?, PhuongThuc = ?, TongTienThanhToan = ?, TrangThai = ?, NgayThanhToan = ? WHERE IDThanhToan = ?";
        _jdbcTemplate.update(sql, thanhToan.getIdDonHang(), thanhToan.getPhuongThuc(), thanhToan.getTongTienThanhToan(),
                thanhToan.getTrangThai(), thanhToan.getNgayThanhToan(), thanhToan.getIdThanhToan());
    }

    public void deletePayment(int idThanhToan) {
        String sql = "DELETE FROM ThanhToan WHERE IDThanhToan = ?";
        _jdbcTemplate.update(sql, idThanhToan);
    }
    
    public double getTotalRevenue() {
        String sql = "SELECT SUM(TongTienThanhToan) FROM ThanhToan WHERE TrangThai = 'Đã thanh toán'";
        Double result = _jdbcTemplate.queryForObject(sql, Double.class);
        return result != null ? result : 0.0;
    }

    public List<Map<String, Object>> getRevenueByMonth() {
        String sql = "SELECT YEAR(NgayThanhToan) AS Year, MONTH(NgayThanhToan) AS Month, SUM(TongTienThanhToan) AS TotalRevenue " +
                     "FROM ThanhToan WHERE TrangThai = 'Đã thanh toán' " +
                     "GROUP BY YEAR(NgayThanhToan), MONTH(NgayThanhToan) " +
                     "ORDER BY Year DESC, Month DESC";
        return _jdbcTemplate.queryForList(sql);
    }
}