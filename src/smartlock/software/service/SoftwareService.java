package smartlock.software.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import smartlock.common.CommonDAO;
import smartlock.software.vo.SoftwareReqVO;
import smartlock.software.vo.SoftwareVO;

@Service
public class SoftwareService {

    @Resource(name="commonDAO")
    private CommonDAO commonDAO;

    /**
     * 소프트웨어 목록 조회
     * @param softwareVO {@link SoftwareVO#sw_name}
     * @return 결과 List
     * @throws Exception DAO Exception
     */
    public ArrayList<HashMap<String,Object>> softwareList() throws Exception {
        return (ArrayList) commonDAO.selectList("software.softwareList", null);
    }
   
    public ArrayList<HashMap<String, Object>> softwareListByCorp(Map<String, Object> map) throws Exception {
        return (ArrayList) commonDAO.selectList("software.softwareListUser", map);
    }
    
    /**
     * 소프트웨어 목록 조회
     * @param id 소프트웨어 아이디
     * @return
     * @throws Exception
     */
    public SoftwareReqVO softwareRequest(String id) throws Exception {
    	return (SoftwareReqVO) commonDAO.selectOne("software.softwareSelect", id);
    }
    
    /**
     * 소프트웨어 목록 조회
     * @param id corp 아이디
     * @return
     * @throws Exception
     */
    public ArrayList<SoftwareVO> softwareListByCorp(String corpId) throws Exception {
    	return (ArrayList)commonDAO.selectList("software.selectByCorp", corpId);
    }
    
    public int softwareRequestFinal(Map<String, String> map) throws Exception {
    	return (int) commonDAO.update("softwareFinal", map);
    }
    
    /**
     * 소프트웨어 기업 아이디로 기업명, 기업의 모든 소프트웨어 조회
     * @param corp_id 기업 아이디
     * @return
     * @throws Exception
     *
    public ArrayList<SoftwareVO> getCorp(int corp_id) throws Exception{
    	return (ArrayList) commonDAO.selectList("getCorp", corp_id);
    }
    */
    
    /**
     * 소프트웨어 기업 아이디로 기업명, 기업의 모든 소프트웨어 조회
     * @param corp_id 기업 아이디
     * @return
     * @throws Exception
     */
    public String getCorp(int corp_id) throws Exception{
    	return (String)commonDAO.selectOne("software.getCorp", corp_id);
    }
    
    /**
     * 소프트웨어 등록
     * @param map
     * @return
     * @throws Exception
     */
    public int softwareInsert(Map<String, Object> map) throws Exception
    {
    	return commonDAO.insert("insertSoftware", map);
    }
}
