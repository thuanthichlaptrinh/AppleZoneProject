package AppleZone.Dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;
 
import AppleZone.Entity.MapperNhaCungCap;
import AppleZone.Entity.NhaCungCap;

@Repository
public class NhaCungCapDao extends BaseDao {
	
	public List<NhaCungCap> getAllNhaCungCap() {
		List<NhaCungCap> list = new ArrayList<NhaCungCap>();
	    String sql = "SELECT * FROM NhaCungCap";
	    list = _jdbcTemplate.query(sql, new MapperNhaCungCap());
	    return list;
	}
	  
    public NhaCungCap getNhaCungCapById(int id) {
        String sql = "SELECT * FROM NhaCungCap WHERE IDNhaCungCap = ?";
        return _jdbcTemplate.queryForObject(sql, new Object[]{id}, new MapperNhaCungCap());
    } 
    
    public void saveNhaCungCap(NhaCungCap nhaCungCap) {
        String sql = "INSERT INTO NhaCungCap (TenNhaCungCap, DiaChi, SDT, Email, GhiChu) VALUES (?, ?, ?, ?, ?)";
        _jdbcTemplate.update(sql, nhaCungCap.getTenNhaCungCap(), nhaCungCap.getDiaChi(), nhaCungCap.getSdt(),
                nhaCungCap.getEmail(), nhaCungCap.getGhiChu());
    }
 
    public void updateNhaCungCap(NhaCungCap nhaCungCap) {
        String sql = "UPDATE NhaCungCap SET TenNhaCungCap = ?, DiaChi = ?, SDT = ?, Email = ?, GhiChu = ? WHERE IDNhaCungCap = ?";
        _jdbcTemplate.update(sql, nhaCungCap.getTenNhaCungCap(), nhaCungCap.getDiaChi(), nhaCungCap.getSdt(),
                nhaCungCap.getEmail(), nhaCungCap.getGhiChu(), nhaCungCap.getIdNhaCungCap());
    }
 
    public void deleteNhaCungCap(int id) {
        String sql = "DELETE FROM NhaCungCap WHERE IDNhaCungCap = ?";
        _jdbcTemplate.update(sql, id);
    }
 
    public boolean hasAssociatedProducts(int id) {
        String sql = "SELECT COUNT(*) FROM SanPham WHERE IDNhaCungCap = ?";
        int count = _jdbcTemplate.queryForObject(sql, new Object[]{id}, Integer.class);
        return count > 0;
    }
    
    public int countTotalSuppliers() {
        String sql = "SELECT COUNT(*) FROM NhaCungCap";
        return _jdbcTemplate.queryForObject(sql, Integer.class);
    }
	
}
