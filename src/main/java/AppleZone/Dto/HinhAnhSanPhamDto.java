package AppleZone.Dto;

public class HinhAnhSanPhamDto {
	private int idHinhAnh;
    private int idSanPham;
    private String duongDanHinhAnh;

    // Constructors
    public HinhAnhSanPhamDto() {}

    // Getters và Setters
    public int getIdHinhAnh() { return idHinhAnh; }
    public void setIdHinhAnh(int idHinhAnh) { this.idHinhAnh = idHinhAnh; }
    public int getIdSanPham() { return idSanPham; }
    public void setIdSanPham(int idSanPham) { this.idSanPham = idSanPham; }
    public String getDuongDanHinhAnh() { return duongDanHinhAnh; }
    public void setDuongDanHinhAnh(String duongDanHinhAnh) { this.duongDanHinhAnh = duongDanHinhAnh; }
}
