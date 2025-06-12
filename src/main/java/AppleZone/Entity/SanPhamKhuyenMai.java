package AppleZone.Entity;

public class SanPhamKhuyenMai {
	 private int idSanPham;
	    private int idKhuyenMai;
	    private String ghiChu;
	    private double giaKhuyenMai;

	    // Constructor
	    public SanPhamKhuyenMai() {}

	    public SanPhamKhuyenMai(int idSanPham, int idKhuyenMai, String ghiChu, double giaKhuyenMai) {
	        this.idSanPham = idSanPham;
	        this.idKhuyenMai = idKhuyenMai;
	        this.ghiChu = ghiChu;
	        this.giaKhuyenMai = giaKhuyenMai;
	    }

	    // Getters and Setters
	    public int getIdSanPham() {
	        return idSanPham;
	    }

	    public void setIdSanPham(int idSanPham) {
	        this.idSanPham = idSanPham;
	    }

	    public int getIdKhuyenMai() {
	        return idKhuyenMai;
	    }

	    public void setIdKhuyenMai(int idKhuyenMai) {
	        this.idKhuyenMai = idKhuyenMai;
	    }

	    public String getGhiChu() {
	        return ghiChu;
	    }

	    public void setGhiChu(String ghiChu) {
	        this.ghiChu = ghiChu;
	    }

	    public double getGiaKhuyenMai() {
	        return giaKhuyenMai;
	    }

	    public void setGiaKhuyenMai(double giaKhuyenMai) {
	        this.giaKhuyenMai = giaKhuyenMai;
	    }
}
