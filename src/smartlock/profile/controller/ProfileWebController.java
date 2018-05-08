package smartlock.profile.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import smartlock.common.vo.MsgResVO;
import smartlock.member.service.UserService;
import smartlock.member.vo.UserVO;
import smartlock.profile.service.ProfileService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@Controller
public class ProfileWebController {
	@Resource
    private ProfileService profileService;
	
	@Resource
	private UserService userService;	

    @RequestMapping(value = "/profile", method = RequestMethod.GET)
    public ModelAndView profile(HttpServletRequest request) {
        HttpSession httpSession = request.getSession();
        UserVO userVO = (UserVO) httpSession.getAttribute("user");              
                
        if (userVO != null && userVO.getAuthority() == 0) {
        	ModelAndView profile_user = new ModelAndView("/smartlock/profile_user");
        	
        	profile_user.addObject("id", userVO.getId());
            profile_user.addObject("user_name", userVO.getUser_name());
            profile_user.addObject("phone_number", userVO.getPhoneNumber());
            profile_user.addObject("email", userVO.getEmail());
        	
            try {
				String corp_name = profileService.selectCorpName(userVO);
				profile_user.addObject("corp_name", corp_name);
				
			} catch (Exception e) {
				System.out.println("DB ERROR : SELECT corpName");
				e.printStackTrace();
			}
            
            return profile_user;
            
        } else if (userVO != null && userVO.getAuthority() == 1) {
        	ModelAndView profile_manager = new ModelAndView("/smartlock/profile_manager");
        	
        	profile_manager.addObject("id", userVO.getId());
        	profile_manager.addObject("user_name", userVO.getUser_name());
        	profile_manager.addObject("phone_number", userVO.getPhoneNumber());
        	profile_manager.addObject("email", userVO.getEmail());
        	
            try {
				String corp_name = profileService.selectCorpName(userVO);
				profile_manager.addObject("corp_name", corp_name);
				
			} catch (Exception e) {
				System.out.println("DB ERROR : SELECT corpName");
				e.printStackTrace();
			}
            
            return profile_manager;
        } else {
            return new ModelAndView("redirect:/");
        }
    }
    
    @RequestMapping(value = "/profile/changePassword", method = RequestMethod.GET)
    public ModelAndView changePassword(HttpServletRequest request) {
        HttpSession httpSession = request.getSession();
        UserVO userVO = (UserVO) httpSession.getAttribute("user");

        if (userVO != null) {        
            return new ModelAndView("/smartlock/profile_changePassword");
        }
        else{
        	return new ModelAndView("redirect:/");
        }
    }
    
    @RequestMapping(value = "/profile/quit", method = RequestMethod.GET)
    public ModelAndView quit(HttpServletRequest request) {
        HttpSession httpSession = request.getSession();
        UserVO userVO = (UserVO) httpSession.getAttribute("user");

        if (userVO != null) {        
            return new ModelAndView("/smartlock/profile_quit");
        }
        else{
        	return new ModelAndView("redirect:/");
        }
    }
    
	@RequestMapping(value="/profile/ok", method=RequestMethod.GET)
	public ModelAndView profileOk(HttpServletRequest request) {
        HttpSession httpSession = request.getSession();
        
        return new ModelAndView("/smartlock/profile_finish");	         
	}
	
	@RequestMapping(value="/profile/changePassword/ok", method=RequestMethod.GET)
	public ModelAndView changePasswordOk(HttpServletRequest request) {
		HttpSession httpSession = request.getSession();
        
		return new ModelAndView("/smartlock/profile_changePassword_finish");	
	}
	
	@RequestMapping(value="/profile/quit/ok", method=RequestMethod.GET)
	public ModelAndView removeUserOk(HttpServletRequest request) {
		HttpSession httpSession = request.getSession();
        httpSession.setAttribute("user", null);
		return new ModelAndView("/smartlock/profile_quit_finish");	
	}
	/*
	@RequestMapping(value="/profile/select", method=RequestMethod.GET)
	public ModelAndView selectProfile(HttpServletRequest request) {
		HttpSession httpSession = request.getSession();
		UserVO userVO = (UserVO) httpSession.getAttribute("user");
		
		if (userVO != null && userVO.getAuthority() == 0) {
            return new ModelAndView("/smartlock/profile_select_user");
        } else if (userVO != null && userVO.getAuthority() == 1) {
            return new ModelAndView("/smartlock/profile_select_manager");
        } else {
            return new ModelAndView("redirect:/");
        }
	}
	*/
}
