package AppleZone.Service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import AppleZone.Dao.NhaCungCapDao;
import AppleZone.Entity.NhaCungCap;

@Service
public class NhaCungCapServiceImpl implements INhaCungCapService {

	@Autowired 
	private NhaCungCapDao nhaCungCapDao;
	
	@Override
	public List<NhaCungCap> getAllNhaCungCap() {
		return nhaCungCapDao.getAllNhaCungCap();
	}

	@Override
	public NhaCungCap getNhaCungCapById(int id) {
		return nhaCungCapDao.getNhaCungCapById(id);
	}

	@Override
	public void saveNhaCungCap(NhaCungCap nhaCungCap) {
		nhaCungCapDao.saveNhaCungCap(nhaCungCap);
	}

	@Override
	public void updateNhaCungCap(NhaCungCap nhaCungCap) {
		nhaCungCapDao.updateNhaCungCap(nhaCungCap);
	}

	@Override
	public void deleteNhaCungCap(int id) {
		nhaCungCapDao.deleteNhaCungCap(id);
	}

	@Override
	public boolean hasAssociatedProducts(int id) {
		return nhaCungCapDao.hasAssociatedProducts(id);
	}

	@Override
	public int countTotalSuppliers() {
		return nhaCungCapDao.countTotalSuppliers();
	}

}
