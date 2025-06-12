package AppleZone.Entity;

import java.util.Date;

public class DanhGia {
	private int idDanhGia;
    private Date ngayDanhGia;
    private String noiDung;
    private int soSao;
    private int idSanPham;
    private int idNguoiDung;

    // Constructor
    public DanhGia() {}

    public DanhGia(int idDanhGia, Date ngayDanhGia, String noiDung, int soSao, int idSanPham, int idNguoiDung) {
        this.idDanhGia = idDanhGia;
        this.ngayDanhGia = ngayDanhGia;
        this.noiDung = noiDung;
        this.soSao = soSao;
        this.idSanPham = idSanPham;
        this.idNguoiDung = idNguoiDung;
    }

    // Getters and Setters
    public int getIdDanhGia() {
        return idDanhGia;
    }

    public void setIdDanhGia(int idDanhGia) {
        this.idDanhGia = idDanhGia;
    }

    public Date getNgayDanhGia() {
        return ngayDanhGia;
    }

    public void setNgayDanhGia(Date ngayDanhGia) {
        this.ngayDanhGia = ngayDanhGia;
    }

    public String getNoiDung() {
        return noiDung;
    }

    public void setNoiDung(String noiDung) {
        this.noiDung = noiDung;
    }

    public int getSoSao() {
        return soSao;
    }

    public void setSoSao(int soSao) {
        this.soSao = soSao;
    }

    public int getIdSanPham() {
        return idSanPham;
    }

    public void setIdSanPham(int idSanPham) {
        this.idSanPham = idSanPham;
    }

    public int getIdNguoiDung() {
        return idNguoiDung;
    }

    public void setIdNguoiDung(int idNguoiDung) {
        this.idNguoiDung = idNguoiDung;
    }
}
