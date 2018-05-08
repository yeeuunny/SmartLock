package smartlock.reqlicense.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import smartlock.common.vo.DataResVO;
import smartlock.reqlicense.vo.ReqLicenseVO;
import smartlock.reqlicense.service.ReqLicenseService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
public class ReqLicenseApiController {

    @Resource
    private ReqLicenseService reqLicenseService;

    /**
     * 라이센스 요청
     * @param reqLicenseVO {@link ReqLicenseVO#sw_id},
     *                     {@link ReqLicenseVO#state}
     * @return {int} 실패시 0, 성공시 1
     */
    @RequestMapping(
            value = "/reqlicense/add",
            method = RequestMethod.POST
    )
    public @ResponseBody DataResVO addReqLicense(
            @RequestBody ReqLicenseVO reqLicenseVO,
            HttpServletRequest request) {

        return new DataResVO(request, userVO -> {
            if (userVO == null) return 0;

            reqLicenseVO.setUser_id(userVO.getId());
            //reqLicenseVO.setRequest_date(new Date(Calendar.getInstance().getTime().getTime()));

            int result = reqLicenseService.addRequestLicense(reqLicenseVO);

            return result;
        });
    }
}
