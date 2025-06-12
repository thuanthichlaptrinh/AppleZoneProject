package AppleZone.Service.user;

import java.util.List;

import org.springframework.stereotype.Service;

import AppleZone.Dto.GioHangDto;

@Service
public interface IGioHangService {
    public void addToCart(int idNguoiDung, int idSanPham, int soLuong, java.sql.Timestamp ngayTao);
    public List<GioHangDto> getCartItems(int idNguoiDung);
    public void updateCartQuantity(int idGioHang, int soLuong);
    public void removeFromCart(int idGioHang);
    public GioHangDto getCartItemById(int idGioHang); 
    public void clearCart(int idNguoiDung);
}