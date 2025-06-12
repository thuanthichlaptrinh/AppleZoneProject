
package AppleZone.Service.user;

import AppleZone.Dao.ThanhToanDao;
import AppleZone.Dto.ThanhToanDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ThanhToanServiceImpl implements IThanhToanService {

    @Autowired
    private ThanhToanDao thanhToanDao;

    @Override
    public int createPayment(int idDonHang, String phuongThuc, double tongTien, String trangThai, java.sql.Timestamp ngayThanhToan) {
        return thanhToanDao.createPayment(idDonHang, phuongThuc, tongTien, trangThai, ngayThanhToan);
    }

    @Override
    public ThanhToanDto getPaymentByOrderId(int idDonHang) {
        return thanhToanDao.getPaymentByOrderId(idDonHang);
    }

    @Override
    public List<ThanhToanDto> getAllPayments() {
        return thanhToanDao.getAllPayments();
    }

    @Override
    public ThanhToanDto getPaymentById(int idThanhToan) {
        return thanhToanDao.getPaymentById(idThanhToan);
    }

    @Override
    public void updatePayment(ThanhToanDto thanhToan) {
        thanhToanDao.updatePayment(thanhToan);
    }

    @Override
    public void deletePayment(int idThanhToan) {
        thanhToanDao.deletePayment(idThanhToan);
    }

    @Override
    public double getTotalRevenue() {
        return thanhToanDao.getTotalRevenue();
    }

    @Override
    public List<Map<String, Object>> getRevenueByMonth() {
        return thanhToanDao.getRevenueByMonth();
    }
}