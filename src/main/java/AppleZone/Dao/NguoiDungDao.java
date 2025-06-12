package AppleZone.Dao;

import java.util.List;
import org.springframework.stereotype.Repository;
import AppleZone.Dto.NguoiDungDto;
import AppleZone.Dto.MapperNguoiDung;

@Repository
public class NguoiDungDao extends BaseDao {

    public NguoiDungDto getNguoiDungBySdt(String sdt) {
        if (sdt == null || sdt.isEmpty()) {
            return null;
        }
        String sql = "SELECT * FROM NguoiDung WHERE SDT = ?";
        List<NguoiDungDto> nguoiDungList = _jdbcTemplate.query(sql, new MapperNguoiDung(), sdt);
        return nguoiDungList.isEmpty() ? null : nguoiDungList.get(0);
    }

    public void saveNguoiDung(NguoiDungDto nguoiDung) {
        String sql = "INSERT INTO NguoiDung (TenNguoiDung, SDT, Email, MatKhau, DiaChi, NgayTao, ChucVu, HinhAnh) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        _jdbcTemplate.update(sql,
                nguoiDung.getTenNguoiDung(),
                nguoiDung.getSdt(),
                nguoiDung.getEmail(),
                nguoiDung.getMatKhau(),
                nguoiDung.getDiaChi(),
                nguoiDung.getNgayTao(),
                nguoiDung.getChucVu(),
                nguoiDung.getHinhAnh()); 
    }

    public NguoiDungDto getNguoiDungByEmail(String email) {
        if (email == null || email.isEmpty()) {
            return null;
        }
        String sql = "SELECT * FROM NguoiDung WHERE Email = ?";
        List<NguoiDungDto> nguoiDungList = _jdbcTemplate.query(sql, new MapperNguoiDung(), email);
        return nguoiDungList.isEmpty() ? null : nguoiDungList.get(0);
    }
    
    public NguoiDungDto getNguoiDungById(int id) { 
        String sql = "SELECT * FROM NguoiDung WHERE IDNguoiDung = ?";
        List<NguoiDungDto> nguoiDungList = _jdbcTemplate.query(sql, new MapperNguoiDung(), id);
        return nguoiDungList.isEmpty() ? null : nguoiDungList.get(0);
    } 

    public List<NguoiDungDto> getAllNguoiDung() {
        String sql = "SELECT * FROM NguoiDung ORDER BY NgayTao DESC";
        return _jdbcTemplate.query(sql, new MapperNguoiDung());
    }

    public void updateNguoiDung(NguoiDungDto nguoiDung) {
        String sql = "UPDATE NguoiDung SET TenNguoiDung = ?, Email = ?, DiaChi = ?, HinhAnh = ? WHERE SDT = ?";
        _jdbcTemplate.update(sql,
                nguoiDung.getTenNguoiDung(),
                nguoiDung.getEmail(),
                nguoiDung.getDiaChi(),
                nguoiDung.getSdt(),
                nguoiDung.getHinhAnh());
    }
    
    public void DeleteNguoiDung(int idNguoiDung) {
        String sql = "DELETE FROM NguoiDung WHERE IDNguoiDung = ?";
        _jdbcTemplate.update(sql, idNguoiDung);
    }

    public boolean hasAssociatedOrders(int idNguoiDung) {
        String sql = "SELECT COUNT(*) FROM DonHang WHERE IDNguoiDung = ?";
        Integer count = _jdbcTemplate.queryForObject(sql, Integer.class, idNguoiDung);
        return count != null && count > 0;
    }
    
    public int countTotalUsers() {
        String sql = "SELECT COUNT(*) FROM NguoiDung";
        return _jdbcTemplate.queryForObject(sql, Integer.class);
    }
}