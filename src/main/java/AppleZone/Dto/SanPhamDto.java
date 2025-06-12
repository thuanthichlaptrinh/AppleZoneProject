package AppleZone.Dto;

import java.util.Date;

public class SanPhamDto {
    private int idSanPham;
    private String tenSanPham;
    private String moTa;
    private double gia;
    private boolean moi;
    private boolean noiBat;
    private boolean trangThai;
    private int soLuongTon;
    private String hinhAnh;
    private Date ngayTao;
    private String donViTinh;
    private int idLoaiSP;
    private int idNhaCungCap; 

    // Constructors
    public SanPhamDto() {}
    
    // Tham chiếu đến thông số kỹ thuật
    //private ThongSoKyThuatDto thongSoKyThuat;

    // Getters and Setters
    public int getIdSanPham() { return idSanPham; }
    public void setIdSanPham(int idSanPham) { this.idSanPham = idSanPham; }
    public String getTenSanPham() { return tenSanPham; }
    public void setTenSanPham(String tenSanPham) { this.tenSanPham = tenSanPham; }
    public String getMoTa() { return moTa; }
    public void setMoTa(String moTa) { this.moTa = moTa; }
    public double getGia() { return gia; }
    public void setGia(double gia) { this.gia = gia; }
    public boolean isMoi() { return moi; }
    public void setMoi(boolean moi) { this.moi = moi; }
    public boolean isNoiBat() { return noiBat; }
    public void setNoiBat(boolean noiBat) { this.noiBat = noiBat; }
    public boolean isTrangThai() { return trangThai; }
    public void setTrangThai(boolean trangThai) { this.trangThai = trangThai; }
    public int getSoLuongTon() { return soLuongTon; }
    public void setSoLuongTon(int soLuongTon) { this.soLuongTon = soLuongTon; }
    public String getHinhAnh() { return hinhAnh; }
    public void setHinhAnh(String hinhAnh) { this.hinhAnh = hinhAnh; }
    public String getDonViTinh() { return donViTinh; }
    public void setDonViTinh(String donViTinh) { this.donViTinh = donViTinh; }
    public int getIdLoaiSP() { return idLoaiSP; }
    public void setIdLoaiSP(int idLoaiSP) { this.idLoaiSP = idLoaiSP; }
    public int getIdNhaCungCap() { return idNhaCungCap; }
    public void setIdNhaCungCap(int idNhaCungCap) { this.idNhaCungCap = idNhaCungCap; }
    public Date getNgayTao() { return ngayTao; }
    public void setNgayTao(Date ngayTao) { this.ngayTao = ngayTao; } 
    
   // public ThongSoKyThuatDto getThongSoKyThuat() { return thongSoKyThuat; }
    ///public void setThongSoKyThuat(ThongSoKyThuatDto thongSoKyThuat) { this.thongSoKyThuat = thongSoKyThuat; }
}