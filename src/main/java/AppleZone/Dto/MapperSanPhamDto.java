package AppleZone.Dto;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

public class MapperSanPhamDto implements RowMapper<SanPhamDto> {
    @Override
    public SanPhamDto mapRow(ResultSet rs, int rowNum) throws SQLException {
        SanPhamDto sp = new SanPhamDto();
        sp.setIdSanPham(rs.getInt("IDSanPham"));
        sp.setTenSanPham(rs.getString("TenSanPham"));
        sp.setMoTa(rs.getString("MoTa"));
        sp.setGia(rs.getDouble("Gia"));
        sp.setMoi(rs.getBoolean("Moi"));
        sp.setNoiBat(rs.getBoolean("NoiBat"));
        sp.setTrangThai(rs.getBoolean("TrangThai"));
        sp.setSoLuongTon(rs.getInt("SoLuongTon"));
        sp.setHinhAnh(rs.getString("HinhAnh"));
        sp.setDonViTinh(rs.getString("DonViTinh"));
        sp.setNgayTao(rs.getDate("NgayTao")); 
        sp.setIdLoaiSP(rs.getInt("IDLoaiSP"));
        sp.setIdNhaCungCap(rs.getInt("IDNhaCungCap")); 
        
     // Ánh xạ thông số kỹ thuật
        /*ThongSoKyThuatDto thongSo = new ThongSoKyThuatDto();
        thongSo.setIdThongSo(rs.getInt("IDThongSo"));
        thongSo.setIdSanPham(rs.getInt("IDSanPham"));
        thongSo.setManHinh(rs.getString("ManHinh"));
        thongSo.setChip(rs.getString("Chip"));
        thongSo.setGpu(rs.getString("Gpu"));
        thongSo.setDoPhanGia(rs.getString("DoPhanGia"));
        thongSo.setKichThuocMan(rs.getString("KichThuocMan"));
        thongSo.setPin(rs.getString("Pin"));
        thongSo.setKetNoi(rs.getString("KetNoi"));
        thongSo.setChongNuoc(rs.getString("ChongNuoc"));
        thongSo.setCamBien(rs.getString("CamBien"));
        thongSo.setChatLieuVien(rs.getString("ChatLieuVien"));
        thongSo.setDungLuong(rs.getString("DungLuong"));
        thongSo.setRam(rs.getString("Ram"));
        thongSo.setMauSac(rs.getString("MauSac"));
        thongSo.setCamera(rs.getString("Camera"));
        thongSo.setThongTinKhac(rs.getString("ThongTinKhac"));

        // Gán thông số kỹ thuật cho sản phẩm
        sp.setThongSoKyThuat(thongSo);
        */
        return sp;
    }
}