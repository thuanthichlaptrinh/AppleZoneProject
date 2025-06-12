package AppleZone.Service.user;

import AppleZone.Dao.ChiTietDonHangDao;
import AppleZone.Dao.DonHangDao;
import AppleZone.Dto.ChiTietDonHangDto;
import AppleZone.Dto.DonHangDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class DonHangServiceImpl implements IDonHangService {
    @Autowired
    private DonHangDao donHangDao;

    @Autowired
    private ChiTietDonHangDao chiTietDonHangDao;

    @Override
    public int createOrder(DonHangDto donHangDto) {
        return donHangDao.createOrder(donHangDto);
    }

    @Override
    public void addOrderDetail(int idDonHang, int idSanPham, int soLuong, double giaBan) {
        chiTietDonHangDao.addOrderDetail(idDonHang, idSanPham, soLuong, giaBan);
    }

    @Override
    public DonHangDto getOrderById(int idDonHang) {
        return donHangDao.getOrderById(idDonHang);
    }

    @Override
    public List<DonHangDto> getOrdersByUserId(int idNguoiDung) {
        return donHangDao.getOrdersByUserId(idNguoiDung);
    }

    @Override
    public List<ChiTietDonHangDto> getOrderDetailsByOrderId(int idDonHang) {
        return chiTietDonHangDao.getOrderDetailsByOrderId(idDonHang);
    }

    @Override
    public List<DonHangDto> getAllDonHang() {
        return donHangDao.getAllDonHang();
    }

    @Override
    public void updateOrderStatus(DonHangDto donHangDto) {
        donHangDao.updateOrderStatus(donHangDto);
    }

    @Override
    public void deleteOrderDetails(int idDonHang) {
        donHangDao.deleteOrderDetails(idDonHang);
    }

    @Override
    public void updateOrder(DonHangDto donHang) {
        donHangDao.updateOrder(donHang);
    }

    @Override
    public List<Map<String, Object>> getOrderDetailsByID(int idDonHang) {
        return donHangDao.getOrderDetails(idDonHang);  
    }

	@Override
	public int countCompletedOrders() {
		return donHangDao.countCompletedOrders();
	}

	@Override
	public Map<String, Integer> getOrderStatusStats() {
		return donHangDao.getOrderStatusStats();
	}
}