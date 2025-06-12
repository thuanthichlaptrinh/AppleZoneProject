package AppleZone.Dao;

import java.util.List;
import org.springframework.stereotype.Repository;
import AppleZone.Dto.SanPhamDto;
import AppleZone.Dto.ThongSoKyThuatDto;
import AppleZone.Dto.HinhAnhSanPhamDto;
import AppleZone.Dto.MapperSanPhamDto;
import AppleZone.Dto.MapperThongSoKyThuat; 

@Repository
public class SanPhamDao extends BaseDao { 
	
    public SanPhamDto getSanPhamById(int idSanPham) {
        String sql = "SELECT * FROM SanPham WHERE IDSanPham = '"+ idSanPham +"'";
        List<SanPhamDto> sanPhamList = _jdbcTemplate.query(sql, new MapperSanPhamDto());
        return sanPhamList.isEmpty() ? null : sanPhamList.get(0); // Lấy bản ghi đầu tiên nếu có
    }

    public ThongSoKyThuatDto getThongSoByIdSanPham(int idSanPham) {
        String sql = "SELECT * FROM ThongSoKyThuat WHERE IDSanPham = '"+ idSanPham +"'";
        List<ThongSoKyThuatDto> thongSoList = _jdbcTemplate.query(sql, new MapperThongSoKyThuat());
        return thongSoList.isEmpty() ? null : thongSoList.get(0); // Lấy bản ghi đầu tiên nếu có
    } 
    
    public List<SanPhamDto> getAllSanPham() {
        String sql = "SELECT * FROM SanPham";
        return _jdbcTemplate.query(sql, new MapperSanPhamDto());
    }
     
    public List<SanPhamDto> getSanPhamByLoaiSP(int idLoaiSP) {
        String sql = "SELECT * FROM SanPham WHERE IDLoaiSP = '" + idLoaiSP + "'";
        return _jdbcTemplate.query(sql, new MapperSanPhamDto());
    }
    
    public void updateSoLuongTon(int idSanPham, int soLuong) {
        String checkSql = "SELECT SoLuongTon FROM SanPham WHERE IDSanPham = ?";
        Integer currentSoLuongTon = _jdbcTemplate.queryForObject(checkSql, new Object[]{idSanPham}, Integer.class);
        if (currentSoLuongTon == null || currentSoLuongTon < soLuong) {
            throw new IllegalArgumentException("Số lượng tồn kho không đủ cho sản phẩm ID: " + idSanPham);
        }

        String updateSql = "UPDATE SanPham SET SoLuongTon = SoLuongTon - ? WHERE IDSanPham = ?";
        _jdbcTemplate.update(updateSql, soLuong, idSanPham);
    }
    
    public List<SanPhamDto> getSanPhamByName(String keyword, String sort) {
        String orderByClause = "idSanPham DESC";  
        if ("price_asc".equals(sort)) {
            orderByClause = "gia ASC";
        } else if ("price_desc".equals(sort)) {
            orderByClause = "gia DESC";
        } else if ("newest".equals(sort)) {
            orderByClause = "idSanPham DESC"; 
        }
        String sql = "SELECT * FROM SanPham WHERE tenSanPham LIKE ? ORDER BY " + orderByClause;
        return _jdbcTemplate.query(sql, new Object[]{"%" + keyword + "%"}, new MapperSanPhamDto());
    }
    
    public void saveSanPham(SanPhamDto sanPham) {
        String sql = "INSERT INTO SanPham (TenSanPham, MoTa, Gia, Moi, NoiBat, TrangThai, SoLuongTon, HinhAnh, NgayTao, DonViTinh, IDLoaiSP, IDNhaCungCap) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        _jdbcTemplate.update(sql,
                sanPham.getTenSanPham(),
                sanPham.getMoTa(),
                sanPham.getGia(),
                sanPham.isMoi(),
                sanPham.isNoiBat(),
                sanPham.isTrangThai(),
                sanPham.getSoLuongTon(),
                sanPham.getHinhAnh(),
                sanPham.getNgayTao(),
                sanPham.getDonViTinh(),
                sanPham.getIdLoaiSP(),
                sanPham.getIdNhaCungCap());
    } 
    
    public void updateSanPham(SanPhamDto sanPhamDto) {
        String sql = "UPDATE SanPham SET TenSanPham = ?, MoTa = ?, Gia = ?, Moi = ?, NoiBat = ?, TrangThai = ?, " +
                     "SoLuongTon = ?, HinhAnh = ?, NgayTao = ?, DonViTinh = ?, IDLoaiSP = ?, IDNhaCungCap = ? " +
                     "WHERE IDSanPham = ?";
        _jdbcTemplate.update(sql,
                sanPhamDto.getTenSanPham(),
                sanPhamDto.getMoTa(),
                sanPhamDto.getGia(),
                sanPhamDto.isMoi(), 
                sanPhamDto.isNoiBat(),
                sanPhamDto.isTrangThai(),
                sanPhamDto.getSoLuongTon(),
                sanPhamDto.getHinhAnh(),
                sanPhamDto.getNgayTao(),
                sanPhamDto.getDonViTinh(),
                sanPhamDto.getIdLoaiSP(),
                sanPhamDto.getIdNhaCungCap(),
                sanPhamDto.getIdSanPham());
    }
    
    public boolean xoaSanPham(int idSanPham) {
        String sql = "DELETE FROM SanPham WHERE IDSanPham = ?";
        int rowsAffected = _jdbcTemplate.update(sql, idSanPham);
        return rowsAffected > 0;
    }
      
    public boolean hasAssociatedOrders(int idSanPham) {
        // Logic kiểm tra đơn hàng liên quan (giả định bảng chi_tiet_don_hang)
        String sql = "SELECT COUNT(*) FROM ChiTietDonHang WHERE IDSanPham = ?";
        Integer count = _jdbcTemplate.queryForObject(sql, Integer.class, idSanPham);
        return count != null && count > 0;
    }
    
    public int countTotalProducts() {
        String sql = "SELECT COUNT(*) FROM SanPham";
        return _jdbcTemplate.queryForObject(sql, Integer.class);
    }
    
    public List<SanPhamDto> getPaginatedSanPham(int page, int size) {
        int offset = (page - 1) * size;
        String sql = "SELECT * FROM SanPham ORDER BY IDSanPham DESC LIMIT ? OFFSET ?";
        return _jdbcTemplate.query(sql, new Object[]{size, offset}, new MapperSanPhamDto());
    }

    public int getTotalSanPhamCount() {
        String sql = "SELECT COUNT(*) FROM SanPham";
        return _jdbcTemplate.queryForObject(sql, Integer.class);
    }

}