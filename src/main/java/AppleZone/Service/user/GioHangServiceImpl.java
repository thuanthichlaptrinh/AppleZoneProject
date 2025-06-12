package AppleZone.Service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import AppleZone.Dao.GioHangDao;
import AppleZone.Dto.GioHangDto;

@Service
public class GioHangServiceImpl implements IGioHangService {
    @Autowired
    private GioHangDao gioHangDao;

    @Override
    public void addToCart(int idNguoiDung, int idSanPham, int soLuong, java.sql.Timestamp ngayTao) {
        gioHangDao.addToCart(idNguoiDung, idSanPham, soLuong, ngayTao);
    }

    @Override
    public List<GioHangDto> getCartItems(int idNguoiDung) {
        return gioHangDao.getCartItems(idNguoiDung);
    }

    @Override
    public void updateCartQuantity(int idGioHang, int soLuong) {
        gioHangDao.updateCartQuantity(idGioHang, soLuong);
    }

    @Override
    public void removeFromCart(int idGioHang) {
        gioHangDao.removeFromCart(idGioHang);
    }

	@Override
	public GioHangDto getCartItemById(int idGioHang) {
        return gioHangDao.getCartItemById(idGioHang);
    }

	@Override
	public void clearCart(int idNguoiDung) {
		gioHangDao.clearCart(idNguoiDung); 
	}
}