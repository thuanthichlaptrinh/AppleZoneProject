package AppleZone.Controller.user;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BaseController {
	
	protected ModelAndView _mvShare = new ModelAndView();
	
	@PostConstruct // Chạy hàm Init trước khi vào HomeController
	protected ModelAndView Init() {
		return _mvShare;
	} 
	
	protected void addCommonAttributes() {
		_mvShare.addObject("TotalQuantyCart", 2); // Giả lập dữ liệu giỏ hàng
		_mvShare.addObject("TotalPriceCart", "500,000₫");
    }
}
	