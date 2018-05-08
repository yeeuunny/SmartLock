package smartlock.Communication.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import smartlock.Communication.vo.macVO;
import smartlock.common.CommonDAO;

@Service
public class CommunicationService {

	@Resource(name="commonDAO")
	private CommonDAO commonDAO;
	
	public ArrayList<String> getMac(String id) throws Exception{
		return (ArrayList) commonDAO.selectList("communication.getMac", id);
	}
	
//	public String getSoftware(Map<String, String> map) throws Exception{
//		return (String) commonDAO.selectOne("communication.getSoftwareList", map);
//	}
	
	public String getSoftware(Map<String, String> map) throws Exception{
		return (String) commonDAO.selectOne("communication.getSoftware", map);
	}
	
	public ArrayList<String> getNicknameList(String id) throws Exception{
		return (ArrayList) commonDAO.selectList("communication.getNicknameList", id);
	}
	
	public ArrayList<String> getAllSoftwareList(String id) throws Exception{
		return (ArrayList) commonDAO.selectList("communication.getAllSoftwareList", id);
	}
	
	public void addDevice(Map<String, String> map) throws Exception{
		commonDAO.selectList("communication.addDevice", map);
	}
	
	public int getCount(String id) throws Exception{
		return (int) commonDAO.selectOne("communication.getCount", id);
	}
	
	public void decreaseCount(String id) throws Exception{
		commonDAO.update("communication.decreaseCount", id);
	}
	
}
