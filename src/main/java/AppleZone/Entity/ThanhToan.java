package AppleZone.Entity;

import java.util.Date;

public class ThanhToan {
	 private int idThanhToan;
	    private String phuongThuc;
	    private Date ngayThanhToan;
	    private double tongTienThanhToan;
	    private String trangThai;
	    private int idDonHang;

	    // Constructor
	    public ThanhToan() {}

	    public ThanhToan(int idThanhToan, String phuongThuc, Date ngayThanhToan, double tongTienThanhToan,
	                     String trangThai, int idDonHang) {
	        this.idThanhToan = idThanhToan;
	        this.phuongThuc = phuongThuc;
	        this.ngayThanhToan = ngayThanhToan;
	        this.tongTienThanhToan = tongTienThanhToan;
	        this.trangThai = trangThai;
	        this.idDonHang = idDonHang;
	    }

	    // Getters and Setters
	    public int getIdThanhToan() {
	        return idThanhToan;
	    }

	    public void setIdThanhToan(int idThanhToan) {
	        this.idThanhToan = idThanhToan;
	    }

	    public String getPhuongThuc() {
	        return phuongThuc;
	    }

	    public void setPhuongThuc(String phuongThuc) {
	        this.phuongThuc = phuongThuc;
	    }

	    public Date getNgayThanhToan() {
	        return ngayThanhToan;
	    }

	    public void setNgayThanhToan(Date ngayThanhToan) {
	        this.ngayThanhToan = ngayThanhToan;
	    }

	    public double getTongTienThanhToan() {
	        return tongTienThanhToan;
	    }

	    public void setTongTienThanhToan(double tongTienThanhToan) {
	        this.tongTienThanhToan = tongTienThanhToan;
	    }

	    public String getTrangThai() {
	        return trangThai;
	    }

	    public void setTrangThai(String trangThai) {
	        this.trangThai = trangThai;
	    }

	    public int getIdDonHang() {
	        return idDonHang;
	    }

	    public void setIdDonHang(int idDonHang) {
	        this.idDonHang = idDonHang;
	    }
}
