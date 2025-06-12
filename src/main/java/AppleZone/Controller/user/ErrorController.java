package AppleZone.Controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView; 

@Controller
public class ErrorController extends BaseController {
    @RequestMapping(value = {"/loi-dang-nhap"})
    public ModelAndView index() { 
        _mvShare.setViewName("user/errors/unauthorized");  
        return _mvShare;
    }
}