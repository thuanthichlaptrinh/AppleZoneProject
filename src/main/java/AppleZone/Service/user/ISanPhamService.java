package AppleZone.Service.user;

import java.util.List;

	import org.springframework.stereotype.Service;

import AppleZone.Dto.HinhAnhSanPhamDto;
import AppleZone.Dto.SanPhamDto;
import AppleZone.Dto.ThongSoKyThuatDto;
	
@Service
public interface ISanPhamService {   
	SanPhamDto getSanPhamById(int idSanPham);
    ThongSoKyThuatDto getThongSoByIdSanPham(int idSanPham);
    List<HinhAnhSanPhamDto> getHinhAnhByIdSanPham(int idSanPham);
    List<SanPhamDto> getAllSanPham(); 
    List<SanPhamDto> getSanPhamByLoaiSP(int idLoaiSP);
    public List<SanPhamDto> getSanPhamByName(String keyword, String sort);
    public void updateSanPham(SanPhamDto sanPhamDto);
    public void saveSanPham(SanPhamDto sanPham);
    public boolean xoaSanPham(int idSanPham);
    public boolean hasAssociatedOrders(int idSanPham);
    public void updateSoLuongTon(int idSanPham, int soLuong);
    public int countTotalProducts();
    public List<SanPhamDto> getPaginatedSanPham(int page, int size);
    public int getTotalSanPhamCount();
} 
