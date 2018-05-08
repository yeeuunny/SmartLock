package smartlock.qna.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import smartlock.member.vo.UserVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

// TODO: QnaWebController 구현

@Controller
public class QnaWebController {

    @RequestMapping(value = "/qna", method = RequestMethod.GET)
    public ModelAndView profile(HttpServletRequest request) {
        HttpSession httpSession = request.getSession();
        UserVO userVO = (UserVO) httpSession.getAttribute("user");

        /*
        if (userVO != null && userVO.getAuthority() == 0) {
            //return new ModelAndView("/smartlock/qna_user");
        } else if (userVO != null && userVO.getAuthority() == 1) {
            // TODO: qna_manager
            //return new ModelAndView("/smartlock/qna_user");
        } else {
            //return new ModelAndView("redirect:/");
        }
        */

        return new ModelAndView("/smartlock/qna");
    }
}
