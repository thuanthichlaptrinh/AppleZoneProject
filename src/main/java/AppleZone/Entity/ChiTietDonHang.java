package AppleZone.Entity;

public class ChiTietDonHang {
	 private int idDonHang;
	    private int idSanPham;
	    private int soLuong;
	    private double giaBan;
	    private double thanhTien; // Computed column

	    // Constructor
	    public ChiTietDonHang() {}

	    public ChiTietDonHang(int idDonHang, int idSanPham, int soLuong, double giaBan, double thanhTien) {
	        this.idDonHang = idDonHang;
	        this.idSanPham = idSanPham;
	        this.soLuong = soLuong;
	        this.giaBan = giaBan;
	        this.thanhTien = thanhTien;
	    }

	    // Getters and Setters
	    public int getIdDonHang() {
	        return idDonHang;
	    }

	    public void setIdDonHang(int idDonHang) {
	        this.idDonHang = idDonHang;
	    }

	    public int getIdSanPham() {
	        return idSanPham;
	    }

	    public void setIdSanPham(int idSanPham) {
	        this.idSanPham = idSanPham;
	    }

	    public int getSoLuong() {
	        return soLuong;
	    }

	    public void setSoLuong(int soLuong) {
	        this.soLuong = soLuong;
	    }

	    public double getGiaBan() {
	        return giaBan;
	    }

	    public void setGiaBan(double giaBan) {
	        this.giaBan = giaBan;
	    }

	    public double getThanhTien() {
	        return thanhTien;
	    }

	    public void setThanhTien(double thanhTien) {
	        this.thanhTien = thanhTien;
	    }
}
