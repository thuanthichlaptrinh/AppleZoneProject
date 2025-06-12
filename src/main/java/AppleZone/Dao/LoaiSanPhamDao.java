package AppleZone.Dao;
 
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import AppleZone.Entity.LoaiSanPham;
import AppleZone.Entity.MapperLoaiSanPham;

@Repository
public class LoaiSanPhamDao extends BaseDao {
	
	public List<LoaiSanPham> GetDataCategorys() {
	    List<LoaiSanPham> list = new ArrayList<LoaiSanPham>();
	    String sql = "SELECT * FROM LoaiSanPham";
	    list = _jdbcTemplate.query(sql, new MapperLoaiSanPham());
	    return list;
	}
	
	public LoaiSanPham GetDataCategoryById(int idLoaiSP) {
	    String sql = "SELECT * FROM LoaiSanPham WHERE IDLoaiSP = " + idLoaiSP + ";";
	    List<LoaiSanPham> list = _jdbcTemplate.query(sql, new MapperLoaiSanPham());
	    return list.get(0);
	} 
}
