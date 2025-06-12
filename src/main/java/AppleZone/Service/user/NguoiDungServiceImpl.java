package AppleZone.Service.user;

import AppleZone.Dao.NguoiDungDao;
import AppleZone.Dto.NguoiDungDto;

import java.util.List;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NguoiDungServiceImpl implements INguoiDungService {

    @Autowired
    private NguoiDungDao nguoiDungDao;

    @Override
    public void saveNguoiDung(NguoiDungDto nguoiDung) { 
    	nguoiDung.setMatKhau(BCrypt.hashpw(nguoiDung.getMatKhau(), BCrypt.gensalt(12))); 
        nguoiDungDao.saveNguoiDung(nguoiDung);
    	return;
    }

    @Override
    public NguoiDungDto getNguoiDungBySdt(String sdt) {
       return nguoiDungDao.getNguoiDungBySdt(sdt); 
    }

	@Override
	public NguoiDungDto getNguoiDungByEmail(String email) { 
		return nguoiDungDao.getNguoiDungByEmail(email);
	}

	@Override
	public List<NguoiDungDto> getAllNguoiDung() {
		return nguoiDungDao.getAllNguoiDung();
	}

	@Override
	public NguoiDungDto getNguoiDungById(int id) {
		return nguoiDungDao.getNguoiDungById(id);
	}

	@Override
	public void updateNguoiDung(NguoiDungDto nguoiDung) {
		nguoiDungDao.updateNguoiDung(nguoiDung);
	}

	@Override
	public void DeleteNguoiDung(int idNguoiDung) {
		nguoiDungDao.DeleteNguoiDung(idNguoiDung);
	}

	@Override
	public boolean hasAssociatedOrders(int idNguoiDung) {
		return nguoiDungDao.hasAssociatedOrders(idNguoiDung);
	}

	@Override
	public int countTotalUsers() {
		return nguoiDungDao.countTotalUsers();
	} 
}