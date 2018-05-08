package smartlock.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import smartlock.member.vo.UserVO;

@Controller
public class MainWebController {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView home(HttpServletRequest request) {
        HttpSession httpSession = request.getSession();
        UserVO userVO = (UserVO) httpSession.getAttribute("user");
        ModelAndView modelAndView;
        if (userVO != null && userVO.getAuthority() == 0) {
            //return new ModelAndView("/smartlock/main_user");
        	modelAndView = new ModelAndView("redirect:/device");
        } else if (userVO != null && userVO.getAuthority() == 1) {
            //return new ModelAndView("/smartlock/main_manager");
            modelAndView = new ModelAndView("redirect:/statistics");
        } else {
            //return new ModelAndView("/smartlock/main");
            modelAndView = new ModelAndView("redirect:/main");
        }
        modelAndView.addObject("user", userVO);
        return modelAndView;
    }

    @RequestMapping(value = "/about_us", method = RequestMethod.GET)
    public ModelAndView aboutUs() {
        return new ModelAndView("/smartlock/about_us");
    }
    @RequestMapping(value = "/manual", method = RequestMethod.GET)
    public ModelAndView manual() {
        return new ModelAndView("/smartlock/manual");
    }
    @RequestMapping(value = "/main", method = RequestMethod.GET)
    public ModelAndView home() {
    	return new ModelAndView("/smartlock/main");
    }
 
    
}