package AppleZone.Dto;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import AppleZone.Dto.ThongSoKyThuatDto;

public class MapperThongSoKyThuat implements RowMapper<ThongSoKyThuatDto> {
    @Override
    public ThongSoKyThuatDto mapRow(ResultSet rs, int rowNum) throws SQLException {
        ThongSoKyThuatDto thongSo = new ThongSoKyThuatDto();
        thongSo.setIdThongSo(rs.getInt("IDThongSo"));
        thongSo.setIdSanPham(rs.getInt("IDSanPham"));
        thongSo.setManHinh(rs.getString("ManHinh"));
        thongSo.setChip(rs.getString("Chip"));
        thongSo.setGpu(rs.getString("Gpu"));
        thongSo.setDoPhanGiai(rs.getString("DoPhanGiai"));
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
        return thongSo;
    }
}