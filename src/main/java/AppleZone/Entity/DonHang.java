package AppleZone.Entity;

import java.util.Date;

public class DonHang {
	private int idDonHang;
    private Date ngayDat;
    private Date ngayGiao;
    private double tongTien;
    private String trangThai;
    private String diaChi;
    private int idNguoiDung; 

    // Constructor
    public DonHang() {}

    public DonHang(int idDonHang, Date ngayDat, Date ngayGiao, double tongTien, String trangThai, String diaChi, 
                   int idNguoiDung) {
        this.idDonHang = idDonHang;
        this.ngayDat = ngayDat;
        this.ngayGiao = ngayGiao;
        this.tongTien = tongTien;
        this.trangThai = trangThai;
        this.diaChi = diaChi;
        this.idNguoiDung = idNguoiDung;
    }

    // Getters and Setters
    public int getIdDonHang() {
        return idDonHang;
    }

    public void setIdDonHang(int idDonHang) {
        this.idDonHang = idDonHang;
    }

    public Date getNgayDat() {
        return ngayDat;
    }

    public void setNgayDat(Date ngayDat) {
        this.ngayDat = ngayDat;
    }

    public Date getNgayGiao() {
        return ngayGiao;
    }

    public void setNgayGiao(Date ngayGiao) {
        this.ngayGiao = ngayGiao;
    }

    public double getTongTien() {
        return tongTien;
    }

    public void setTongTien(double tongTien) {
        this.tongTien = tongTien;
    }

    public String getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(String trangThai) {
        this.trangThai = trangThai;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public int getIdNguoiDung() {
        return idNguoiDung;
    }

    public void setIdNguoiDung(int idNguoiDung) {
        this.idNguoiDung = idNguoiDung;
    }
}
