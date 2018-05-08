package smartlock.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import smartlock.member.vo.UserVO;
/**
 * 로그인, 회원가입 페이지 이동 관련 컨트롤러
 * @author yeeun
 *
 */
@Controller
public class MemberWebController {

	/**
	 * 로그인 페이지로 이동 
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public ModelAndView login(HttpServletRequest request) {
		return new ModelAndView("/smartlock/log_in");
	}

	/**
	 * 회원가입 선택 페이지로 이동
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public ModelAndView signupSelect(HttpServletRequest request) {
		return new ModelAndView("/smartlock/sign_up_select");
	}

	/**
	 * 관리자 회원가입 페이지로 이동
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/signup/manager", method = RequestMethod.GET)
	public ModelAndView signupManager(HttpServletRequest request) {
		return new ModelAndView("/smartlock/sign_up_manager");
	}

	/**
	 * 일반 사용자 회원가입 페이지로 이동
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/signup/user", method = RequestMethod.GET)
	public ModelAndView signupUser(HttpServletRequest request) {
		return new ModelAndView("/smartlock/sign_up_user");
	}

	/**
	 * 회원가입 완료 페이지로 이동
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/signup/ok", method=RequestMethod.GET)
	public ModelAndView signupOk(HttpServletRequest request) {
		return new ModelAndView("/smartlock/sign_up_finish");
	}

	/**
	 * 로그아웃 시키고 로그아웃 페이지로 이동
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request) {
		
		HttpSession httpSession = request.getSession();
		
		if(httpSession.getAttribute("user") != null){
			httpSession.setAttribute("user", null);
			return new ModelAndView("/smartlock/log_out");
		}
		else
			return new ModelAndView("rediret:/");
	}
}
