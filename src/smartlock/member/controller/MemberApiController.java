package smartlock.member.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import smartlock.common.vo.DataResVO;
import smartlock.member.service.UserService;
import smartlock.member.vo.*;

@Controller
public class MemberApiController {

    @Resource
    private UserService userService;

    /**
     * 로그인
     * @param loginReqVO {@link LoginReqVO#id},
     *                   {@link LoginReqVO#pwd}
     * @return {@link UserVO}
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public @ResponseBody String loginPost(
    		HttpServletRequest request, @RequestBody LoginReqVO loginReqVO) throws Exception{
	        System.out.println(loginReqVO);
	        UserVO userVO = null;

	        Boolean checkPassword = userService.checkPassword(loginReqVO);
	        
	        /* 아이디, 비밀번호 일치할 경우 true - 로그인 */
	        if(checkPassword != null && checkPassword)
	        {
	            userVO = userService.getUserVO(loginReqVO.getId());
	            userVO.setPassword(null);
	            request.getSession().setAttribute("user", userVO);
	            
	            return "SUCCESS";
	        }
	        
	        /* 비밀번호가 일치하지 않을 경우 */
	        else if(checkPassword != null && !checkPassword)
	            return "FAIL-WRONG-PW";
	        
	        /* 아이디에 해당하는 회원정보가 없을 경우 */
	        else
	        	return "FAIL-NO-INFO";

        	/*
            boolean checkPassword = userService.checkPassword(loginReqVO);

            // 비밀번호가 일치하지 않을 경우 null
            if (!checkPassword) return null;

            // 로그인시 Session data
            UserVO userVO = userService.getUserVO(loginReqVO.getId());

            // 비밀번호 데이터 null
            userVO.setPassword(null);

            // 세션에 로그인 정보 추가
            request.getSession().setAttribute("user", userVO);

            // 로그인시 API 데이터
            UserInfoVO userInfoVO = userService.getUserInfoVO(loginReqVO.getId());

            System.out.println(userInfoVO);
            return userInfoVO;
            */

        /*
        try {
            if (userService.checkPassword(loginReqVO)) {
                // 로그인시 API data
                UserInfoVO userInfoVO = userService.getUserInfoVO(loginReqVO.getId());
                dataResVO.setStatus("success");
                dataResVO.setData(userInfoVO);

                // 로그인시 Session data
                UserVO userVO = userService.getUserVO(loginReqVO.getId());

                // 비밀번호 데이터 null
                userVO.setPassword(null);

                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("user", userVO);
            } else {
                // 비밀번호가 틀렸을 때
                dataResVO.setStatus("success");
                dataResVO.setData(null);
            }
        } catch (Exception e) {
            e.printStackTrace();
            dataResVO.setStatus("error");
            dataResVO.setData("error");
        }

        return dataResVO;
        */
    }

    /**
     * 아이디 중복 체크
     * @param userIdReqVO {@link UserIdReqVO#id}
     * @return 중복시 "no", 아닐시 "ok"
     */
    @RequestMapping(
            value="/check/id",
            method=RequestMethod.GET
    )
    public @ResponseBody DataResVO checkId(
            UserIdReqVO userIdReqVO,
            HttpServletRequest request) {

        return new DataResVO(request, userVO -> {
            boolean exist = userService.existId(userIdReqVO.getId());

            return (exist) ? "no" : "ok";
        });

        /*
        try {
            if(userService.existId(userIdReqVO.getId())) {
                dataResVO.setStatus("success");
                dataResVO.setData("no");
            } else {
                dataResVO.setStatus("success");
                dataResVO.setData("ok");
            }
        } catch (Exception e) {
            e.printStackTrace();
            dataResVO.setStatus("error");
            dataResVO.setData("error");
        }

        return dataResVO;
        */
    }

    /**
     * 회원가입
     * @param signupReqVO {@link SignupReqVO#id},
     *                    {@link SignupReqVO#pwd},
     *                    {@link SignupReqVO#name},
     *                    {@link SignupReqVO#email},
     *                    {@link SignupReqVO#phone},
     *                    {@link SignupReqVO#corp_id},
     *                    {@link SignupReqVO#authority}
     * @return {@link UserInfoVO}
     */
    @RequestMapping(
            value = "/signup",
            method = RequestMethod.POST
    )
    public @ResponseBody DataResVO signupPost(
            @RequestBody SignupReqVO signupReqVO,
            HttpServletRequest request) {
        return new DataResVO(request, userVO -> {
            boolean successSignup = userService.signup(signupReqVO);

            return successSignup ? userService.getUserInfoVO(signupReqVO.getId()) : null;
        });

        /*
        try {
            if (userService.signup(signupReqVO)) {
                dataResVO.setStatus("success");
                dataResVO.setData(userService.getUserInfoVO(signupReqVO.getId()));
                
                // "status": "", "data":{id,....}
                
            } else {
                dataResVO.setStatus("success");
                dataResVO.setData(null);
            }
        } catch (Exception e) {
            e.printStackTrace();
            dataResVO.setStatus("error");
            dataResVO.setData("error");
        }

        return dataResVO;
        */
    }
    
    /**
     * 회사명 확인
     * @param corpName 회사명
     * @return {@link CorpVO}
     */
    @RequestMapping(
    		value = "/check/corpname",
    		method = RequestMethod.POST)
    public @ResponseBody DataResVO searchCorpName(
            @RequestParam("corp_name") String corpName,
            HttpServletRequest request) {
    	System.out.println("*****corpName"+corpName);
    	return new DataResVO(request, userVO -> {
    	    return  userService.searchCorpName(corpName);
        });
    }
    
    /**
     * 회사 추가
     * @param request
     * @return
     */
    @RequestMapping(value="/insert/corp", method=RequestMethod.POST)
    public @ResponseBody DataResVO insertCorp(HttpServletRequest request,
    		@RequestBody CorpVO corpVO) {
//    	CorpVO corpVO = new CorpVO();
//    	corpVO.setCorp_name(request.getParameter("corp_name"));
//    	corpVO.setPhone(request.getParameter("phone"));
    	System.out.println(corpVO);
    	
    	return new DataResVO(request, userVO -> {
    		if(userService.insertCorp(corpVO)){
    			return userService.searchCorpName(corpVO.getCorp_name());
    		} else {
    			return null;
    		}
        });
    }
}
