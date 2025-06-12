package AppleZone.Dao;

import AppleZone.Dto.ChiTietDonHangDto;
import AppleZone.Dto.DonHangDto;
import AppleZone.Dto.MapperChiTietDonHangDto;
import AppleZone.Dto.MapperDonHangDto; 

import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class DonHangDao extends BaseDao {
    public int createOrder(DonHangDto donHangDto) {
        String sql = "INSERT INTO DonHang (NgayDat, NgayGiao, TongTien, TrangThai, DiaChi, IDNguoiDung) VALUES (?, ?, ?, ?, ?, ?)";
        _jdbcTemplate.update(sql, 
            donHangDto.getNgayDat(),
            donHangDto.getNgayGiao(),
            donHangDto.getTongTien(),
            donHangDto.getTrangThai(),
            donHangDto.getDiaChi(),
            donHangDto.getIdNguoiDung()
        );
        return _jdbcTemplate.queryForObject("SELECT @@IDENTITY", Integer.class);
    }

    public DonHangDto getOrderById(int idDonHang) {
        String sql = "SELECT * FROM DonHang WHERE IDDonHang = ?";
        List<DonHangDto> result = _jdbcTemplate.query(sql, new Object[]{idDonHang}, new MapperDonHangDto());
        return result.isEmpty() ? null : result.get(0);
    }

    public List<DonHangDto> getOrdersByUserId(int idNguoiDung) {
        String sql = "SELECT * FROM DonHang WHERE IDNguoiDung = ?";
        return _jdbcTemplate.query(sql, new Object[]{idNguoiDung}, new MapperDonHangDto());
    }
    
    public List<DonHangDto> getAllDonHang() {
        String sql = "SELECT * FROM DonHang";
        return _jdbcTemplate.query(sql, new MapperDonHangDto());
    }
    
    public void updateOrderStatus(DonHangDto donHangDto) {
        String sql = "UPDATE DonHang SET TrangThai = ? WHERE IDDonHang = ?";
        _jdbcTemplate.update(sql, donHangDto.getTrangThai(), donHangDto.getIdDonHang());
    }
    
    public void updateOrder(DonHangDto donHang) {
        String sql = "UPDATE DonHang SET IDNguoiDung = ?, TongTien = ?, TrangThai = ?, DiaChi = ?, NgayGiao = ? WHERE IDDonHang = ?";
        _jdbcTemplate.update(sql, donHang.getIdNguoiDung(), donHang.getTongTien(), donHang.getTrangThai(),
                donHang.getDiaChi(), donHang.getNgayGiao(), donHang.getIdDonHang());
    }

    public void deleteOrderDetails(int idDonHang) {
        String sql = "DELETE FROM ChiTietDonHang WHERE IDDonHang = ?";
        _jdbcTemplate.update(sql, idDonHang);
    }
     
    public List<Map<String, Object>> getOrderDetails(int idDonHang) {
        String sql = "SELECT ctdh.IDSanPham, ctdh.SoLuong, ctdh.GiaBan FROM ChiTietDonHang ctdh WHERE ctdh.IDDonHang = ?";
        return _jdbcTemplate.query(sql, new Object[]{idDonHang}, (rs, rowNum) -> {
            Map<String, Object> map = new HashMap<>();
            map.put("idSanPham", rs.getInt("IDSanPham"));
            map.put("soLuong", rs.getInt("SoLuong"));
            map.put("giaBan", rs.getDouble("GiaBan"));
            return map;
        });
    }
    
    public List<ChiTietDonHangDto> getOrderDetailsByOrderId(int idDonHang) {
        String sql = "SELECT * FROM ChiTietDonHang WHERE IDDonHang = ?";
        return _jdbcTemplate.query(sql, new Object[]{idDonHang}, new MapperChiTietDonHangDto());
    }
    
    public int countCompletedOrders() {
        String sql = "SELECT COUNT(*) FROM DonHang WHERE TrangThai = 'Hoàn thành'";
        return _jdbcTemplate.queryForObject(sql, Integer.class);
    }

    public Map<String, Integer> getOrderStatusStats() {
        String sql = "SELECT TrangThai, COUNT(*) as Count FROM DonHang GROUP BY TrangThai";
        List<Map<String, Object>> results = _jdbcTemplate.queryForList(sql);
        Map<String, Integer> stats = new HashMap<>();
        for (Map<String, Object> row : results) {
            stats.put((String) row.get("TrangThai"), ((Number) row.get("Count")).intValue());
        }
        return stats;
    }

}