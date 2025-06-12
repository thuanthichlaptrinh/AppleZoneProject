package AppleZone.Entity;

public class LoaiSanPham {
	private int idLoaiSP;
    private String tenLoaiSP;

    // Constructor
    public LoaiSanPham() {}

    public LoaiSanPham(int idLoaiSP, String tenLoaiSP) {
        this.idLoaiSP = idLoaiSP;
        this.tenLoaiSP = tenLoaiSP;
    }

    // Getters and Setters
    public int getIdLoaiSP() {
        return idLoaiSP;
    }

    public void setIdLoaiSP(int idLoaiSP) {
        this.idLoaiSP = idLoaiSP;
    }

    public String getTenLoaiSP() {
        return tenLoaiSP;
    }

    public void setTenLoaiSP(String tenLoaiSP) {
        this.tenLoaiSP = tenLoaiSP;
    }
}
