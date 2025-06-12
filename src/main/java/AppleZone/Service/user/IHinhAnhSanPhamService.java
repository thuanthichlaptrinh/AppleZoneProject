package AppleZone.Service.user;

import java.util.List;

import org.springframework.stereotype.Service;

import AppleZone.Dto.HinhAnhSanPhamDto;

@Service
public interface IHinhAnhSanPhamService {
	
	public List<HinhAnhSanPhamDto> GetHinhAnhByIdSanPham(int idSanPham);
	
}
