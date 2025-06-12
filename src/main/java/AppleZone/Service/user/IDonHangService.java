package AppleZone.Service.user;

import AppleZone.Dto.ChiTietDonHangDto;
import AppleZone.Dto.DonHangDto;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

@Service
public interface IDonHangService {
    int createOrder(DonHangDto donHangDto);
    void addOrderDetail(int idDonHang, int idSanPham, int soLuong, double giaBan);
    DonHangDto getOrderById(int idDonHang);
    List<DonHangDto> getOrdersByUserId(int idNguoiDung);
    List<ChiTietDonHangDto> getOrderDetailsByOrderId(int idDonHang);
    List<DonHangDto> getAllDonHang();
    void updateOrderStatus(DonHangDto donHangDto); 
    void deleteOrderDetails(int idDonHang);
    void updateOrder(DonHangDto donHang);
    List<Map<String, Object>> getOrderDetailsByID(int idDonHang); 
    public int countCompletedOrders();
    public Map<String, Integer> getOrderStatusStats(); 
}