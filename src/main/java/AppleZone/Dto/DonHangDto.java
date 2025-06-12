package AppleZone.Dto;

import java.sql.Timestamp;

public class DonHangDto {
    private int idDonHang;
    private Timestamp ngayDat;
    private Timestamp ngayGiao;
    private double tongTien;
    private String trangThai;
    private String diaChi;
    private int idNguoiDung;

    public DonHangDto() {}

    public DonHangDto(int idDonHang, Timestamp ngayDat, Timestamp ngayGiao, double tongTien, String trangThai, String diaChi, int idNguoiDung) {
        this.idDonHang = idDonHang;
        this.ngayDat = ngayDat;
        this.ngayGiao = ngayGiao;
        this.tongTien = tongTien;
        this.trangThai = trangThai;
        this.diaChi = diaChi;
        this.idNguoiDung = idNguoiDung;
    }

    public int getIdDonHang() { return idDonHang; }
    public void setIdDonHang(int idDonHang) { this.idDonHang = idDonHang; }
    public Timestamp getNgayDat() { return ngayDat; }
    public void setNgayDat(Timestamp ngayDat) { this.ngayDat = ngayDat; }
    public Timestamp getNgayGiao() { return ngayGiao; }
    public void setNgayGiao(Timestamp ngayGiao) { this.ngayGiao = ngayGiao; }
    public double getTongTien() { return tongTien; }
    public void setTongTien(double tongTien) { this.tongTien = tongTien; }
    public String getTrangThai() { return trangThai; }
    public void setTrangThai(String trangThai) { this.trangThai = trangThai; }
    public String getDiaChi() { return diaChi; }
    public void setDiaChi(String diaChi) { this.diaChi = diaChi; }
    public int getIdNguoiDung() { return idNguoiDung; }
    public void setIdNguoiDung(int idNguoiDung) { this.idNguoiDung = idNguoiDung; }
}