package smartlock.reqlicense.service;

import org.springframework.stereotype.Service;
import smartlock.common.CommonDAO;
import smartlock.reqlicense.vo.ReqLicenseVO;

import javax.annotation.Resource;

@Service
public class ReqLicenseService {

    @Resource(name = "commonDAO")
    private CommonDAO commonDAO;

    /**
     * 라이센스 요청
     * @param reqLicenseVO {@link ReqLicenseVO#sw_id},
     *                     {@link ReqLicenseVO#state}
     * @return 실패시 0, 성공시 1
     * @throws Exception DAO Exception
     */
    public int addRequestLicense(ReqLicenseVO reqLicenseVO) throws Exception {
        // TODO: 유저에게 이미 발급된 라이센스가 있는지 확인하여 불필요할경우 무시하도록 처리

        return commonDAO.insert("reqlicense.insert", reqLicenseVO);
    }
}
