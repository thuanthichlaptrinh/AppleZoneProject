package AppleZone.Entity;

import java.util.Date;

public class BaiViet {
	 private int idBaiViet;
	    private String tieuDe;
	    private String tomTat;
	    private Date ngayViet;
	    private String noiDungViet;
	    private String linkSEO;
	    private int idNguoiDung;

	    // Constructor
	    public BaiViet() {}

	    public BaiViet(int idBaiViet, String tieuDe, String tomTat, Date ngayViet, String noiDungViet, String linkSEO,
	                   int idNguoiDung) {
	        this.idBaiViet = idBaiViet;
	        this.tieuDe = tieuDe;
	        this.tomTat = tomTat;
	        this.ngayViet = ngayViet;
	        this.noiDungViet = noiDungViet;
	        this.linkSEO = linkSEO;
	        this.idNguoiDung = idNguoiDung;
	    }

	    // Getters and Setters
	    public int getIdBaiViet() {
	        return idBaiViet;
	    }

	    public void setIdBaiViet(int idBaiViet) {
	        this.idBaiViet = idBaiViet;
	    }

	    public String getTieuDe() {
	        return tieuDe;
	    }

	    public void setTieuDe(String tieuDe) {
	        this.tieuDe = tieuDe;
	    }

	    public String getTomTat() {
	        return tomTat;
	    }

	    public void setTomTat(String tomTat) {
	        this.tomTat = tomTat;
	    }

	    public Date getNgayViet() {
	        return ngayViet;
	    }

	    public void setNgayViet(Date ngayViet) {
	        this.ngayViet = ngayViet;
	    }

	    public String getNoiDungViet() {
	        return noiDungViet;
	    }

	    public void setNoiDungViet(String noiDungViet) {
	        this.noiDungViet = noiDungViet;
	    }

	    public String getLinkSEO() {
	        return linkSEO;
	    }

	    public void setLinkSEO(String linkSEO) {
	        this.linkSEO = linkSEO;
	    }

	    public int getIdNguoiDung() {
	        return idNguoiDung;
	    }

	    public void setIdNguoiDung(int idNguoiDung) {
	        this.idNguoiDung = idNguoiDung;
	    }
}
