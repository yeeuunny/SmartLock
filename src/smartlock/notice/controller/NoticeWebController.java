package smartlock.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import smartlock.member.vo.UserVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

// TODO: NoticeWebController 구현

@Controller
public class NoticeWebController {

    @RequestMapping(value = "/notice", method = RequestMethod.GET)
    public ModelAndView notice(HttpServletRequest request) {
        HttpSession httpSession = request.getSession();
        UserVO userVO = (UserVO) httpSession.getAttribute("user");

        if (userVO != null && userVO.getAuthority() == 0) {
            return new ModelAndView("/smartlock/notice_user");
        } else if (userVO != null && userVO.getAuthority() == 1) {
            // TODO: notice_manager
            return new ModelAndView("/smartlock/notice_user");
        } else {
            return new ModelAndView("redirect:/");
        }
    }
}
