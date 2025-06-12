package AppleZone.Service.user;

import AppleZone.Dto.NguoiDungDto;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface INguoiDungService {
    void saveNguoiDung(NguoiDungDto nguoiDung);
    NguoiDungDto getNguoiDungBySdt(String sdt);  
    NguoiDungDto getNguoiDungByEmail(String email);  
    public List<NguoiDungDto> getAllNguoiDung();
    public NguoiDungDto getNguoiDungById(int id);
    public void updateNguoiDung(NguoiDungDto nguoiDung);
    void DeleteNguoiDung(int idNguoiDung);
    boolean hasAssociatedOrders(int idNguoiDung);
    public int countTotalUsers();
}