
package smartlock.searchpw.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import smartlock.common.Util;
import smartlock.member.service.UserService;
import smartlock.member.vo.UserVO;
import smartlock.profile.service.ProfileService;
import smartlock.searchpw.service.MailService;
import smartlock.searchpw.vo.EmailVO;

import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class SearchpwWebController {
	
	@Resource
	private UserService userService;
	@Resource
    private MailService mailService;
	@Resource
	private ProfileService profileService;
     
    public void setUserService(UserService userService) {
        this.userService = userService;
    }
 
    public void setMailService(MailService mailService) {
        this.mailService = mailService;
    }
    
    public void setProfileService(ProfileService profileService){
    	this.profileService = profileService;
    }

    @RequestMapping(value="/search_pw", method=RequestMethod.GET)
    public ModelAndView searchPw(HttpServletRequest request) {
        HttpSession httpSession = request.getSession();
        UserVO userVO = (UserVO) httpSession.getAttribute("user");

        if (userVO != null) {
            return new ModelAndView("redirect:/");
        } else {
            return new ModelAndView("/smartlock/search_pw");
        }
    }
        
    // 비밀번호 찾기 : 임시 비밀번호 생성 후 이메일로 전송
    @RequestMapping(value = "/search_pw/email/authenticate", method = RequestMethod.POST)
    public ModelAndView sendMailPassword(HttpServletRequest request, @RequestParam String id, @RequestParam String email, RedirectAttributes ra) {
        
    	/* CAPTCHA
    	String captchaValue = (String) session.getAttribute("captcha");
        if (captchaValue == null || !captchaValue.equals(captcha)) {
            ra.addFlashAttribute("resultMsg", "자동 방지 코드가 일치하지 않습니다.");
            return "redirect:/find/password";
        }    	
    	*/
    	System.out.println("id : "+id);
    	System.out.println("email : "+email);
    	
    	EmailVO emailVO = new EmailVO(id, email);
    	System.out.println("emailVO : "+emailVO.getId()+", "+emailVO.getEmail());
    	
    	
		try {
			UserVO userVO = userService.getUserVO(id);
			
			if(userVO!=null){
				if (mailService.checkEmail(emailVO) == false) {
	                ra.addFlashAttribute("resultMsg", "입력하신 이메일과 회원정보가 일치하지 않습니다.");
	                return new ModelAndView("redirect:/search_pw");
				}
				
				int ran = new Random().nextInt(100000) + 10000; // 10000 ~ 99999    	 
		       	String ran_password = Util.encrypt(String.valueOf(ran));//암호화
		       	
		       	mailService.updateRanPassword(id, ran_password);
		       	System.out.println("임시 비밀번호로 UPDATE");
		       	
		       	String subject = "임시 비밀번호 발급 안내 입니다.";
	            StringBuilder sb = new StringBuilder();
	            sb.append("귀하의 임시 비밀번호는 [" + ran + "] 입니다. 로그인 후, 새 비밀번호로 변경해주세요.");
	            mailService.send(subject, sb.toString(), "smartlockad@gmail.com", emailVO.getEmail(), null);
	            //ra.addFlashAttribute("resultMsg", "귀하의 이메일 주소로 새로운 임시 비밀번호를 발송 하였습니다.");
	            
	            return new ModelAndView("/smartlock/search_pw_finish");
			}
			else{
				ra.addFlashAttribute("resultMsg", "귀하의 이메일로 가입된 아이디가 존재하지 않습니다.");
				return new ModelAndView("redirect:/search_pw");
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return new ModelAndView("redirect:/search_pw");
		
    }
   
}
