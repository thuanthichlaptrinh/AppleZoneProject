package AppleZone.Dto;

import java.sql.Timestamp;

public class ThanhToanDto {
    private int idThanhToan;
    private int idDonHang;
    private String phuongThuc;
    private Timestamp ngayThanhToan;
    private double tongTienThanhToan;
    private String trangThai;

    public ThanhToanDto() {}

    public ThanhToanDto(int idThanhToan, int idDonHang, String phuongThuc, Timestamp ngayThanhToan, double tongTienThanhToan, String trangThai) {
        this.idThanhToan = idThanhToan;
        this.idDonHang = idDonHang;
        this.phuongThuc = phuongThuc;
        this.ngayThanhToan = ngayThanhToan;
        this.tongTienThanhToan = tongTienThanhToan;
        this.trangThai = trangThai;
    }

    public int getIdThanhToan() { return idThanhToan; }
    public void setIdThanhToan(int idThanhToan) { this.idThanhToan = idThanhToan; }
    public int getIdDonHang() { return idDonHang; }
    public void setIdDonHang(int idDonHang) { this.idDonHang = idDonHang; }
    public String getPhuongThuc() { return phuongThuc; }
    public void setPhuongThuc(String phuongThuc) { this.phuongThuc = phuongThuc; }
    public Timestamp getNgayThanhToan() { return ngayThanhToan; }
    public void setNgayThanhToan(Timestamp ngayThanhToan) { this.ngayThanhToan = ngayThanhToan; }
    public double getTongTienThanhToan() { return tongTienThanhToan; }
    public void setTongTienThanhToan(double tongTienThanhToan) { this.tongTienThanhToan = tongTienThanhToan; }
    public String getTrangThai() { return trangThai; }
    public void setTrangThai(String trangThai) { this.trangThai = trangThai; }
}