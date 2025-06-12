package AppleZone.Service.user;
 
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import AppleZone.Dto.ThanhToanDto;

@Service
public interface IThanhToanService {
	int createPayment(int idDonHang, String phuongThuc, double tongTien, String trangThai, Timestamp ngayThanhToan);
    ThanhToanDto getPaymentByOrderId(int idDonHang);
    List<ThanhToanDto> getAllPayments();
    ThanhToanDto getPaymentById(int idThanhToan);
    void updatePayment(ThanhToanDto thanhToan);
    void deletePayment(int idThanhToan);
    double getTotalRevenue();
    List<Map<String, Object>> getRevenueByMonth();
}