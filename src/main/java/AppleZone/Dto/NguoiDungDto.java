package AppleZone.Dto;
 
import java.util.Date;

public class NguoiDungDto {
    private int idNguoiDung;
    private String tenNguoiDung;
    private String sdt;
    private String email;
    private String matKhau;
    private String diaChi;
    private Date ngayTao;
    private String chucVu;
    private String hinhAnh; 

    // Constructors
    public NguoiDungDto() {}

    public NguoiDungDto(int idNguoiDung, String tenNguoiDung, String sdt, String email, String matKhau,
                        String diaChi, Date ngayTao, String chucVu, String hinhAnh) {
        this.idNguoiDung = idNguoiDung;
        this.tenNguoiDung = tenNguoiDung;
        this.sdt = sdt;
        this.email = email;
        this.matKhau = matKhau;
        this.diaChi = diaChi;
        this.ngayTao = ngayTao;
        this.chucVu = chucVu;
        this.hinhAnh = hinhAnh;
    }

    // Getters and Setters
    public int getIdNguoiDung() { return idNguoiDung; }
    public void setIdNguoiDung(int idNguoiDung) { this.idNguoiDung = idNguoiDung; }
    public String getTenNguoiDung() { return tenNguoiDung; }
    public void setTenNguoiDung(String tenNguoiDung) { this.tenNguoiDung = tenNguoiDung; }
    public String getSdt() { return sdt; }
    public void setSdt(String sdt) { this.sdt = sdt; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getMatKhau() { return matKhau; }
    public void setMatKhau(String matKhau) { this.matKhau = matKhau; }
    public String getDiaChi() { return diaChi; }
    public void setDiaChi(String diaChi) { this.diaChi = diaChi; }
    public Date getNgayTao() { return ngayTao; }
    public void setNgayTao(Date ngayTao) { this.ngayTao = ngayTao; }
    public String getChucVu() { return chucVu; }
    public void setChucVu(String chucVu) { this.chucVu = chucVu; }
    public String getHinhAnh() { return hinhAnh; }
    public void setHinhAnh(String hinhAnh) { this.hinhAnh = hinhAnh; }
}