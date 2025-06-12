package AppleZone.Service.user;

import java.util.List;

import org.springframework.stereotype.Service;

import AppleZone.Entity.NhaCungCap;

@Service
public interface INhaCungCapService {
	List<NhaCungCap> getAllNhaCungCap();
    NhaCungCap getNhaCungCapById(int id);
    void saveNhaCungCap(NhaCungCap nhaCungCap);
    void updateNhaCungCap(NhaCungCap nhaCungCap);
    void deleteNhaCungCap(int id);
    boolean hasAssociatedProducts(int id);
    public int countTotalSuppliers();
}
