package smartlock.device.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import smartlock.common.CommonDAO;
import smartlock.device.vo.DeviceVO;
import smartlock.license.vo.LicenseUserVO;

@Service
public class DeviceService {

	@Resource(name="commonDAO")
	private CommonDAO commonDAO;

	/*
	public int addDevice(DeviceVO deviceVO) throws Exception {
		// TODO: 디바이스 등록
		return commonDAO.insert("device.addDevice", deviceVO);
	}
	*/

	public DeviceVO getDevice(String userId, String deviceId) throws Exception{
		Map<String, String> map = new HashMap<String, String>();
		map.put("userId", userId);
		map.put("deviceId", deviceId);
		return (DeviceVO)commonDAO.selectOne("device.selectDevice", map);
	}
	/**
	 * id로 전체 디바이스 목록 조회
	 * @param id 조회할 사용자 아이디
	 * @return 조회된 디바이스 목록
	 * @throws Exception DAO Exception
	 */
	public ArrayList<DeviceVO> getDeviceList(String id, String order) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("order", order);
		return (ArrayList)commonDAO.selectList("device.selectDeviceList", map);
	}
	
	public ArrayList<DeviceVO> getDeviceList(String id, String sw, String order) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("sw", sw);
		map.put("order", order);
		return (ArrayList)commonDAO.selectList("device.selectDeviceBySw", map);
	}
	
	public ArrayList<LicenseUserVO> getLicenseList(String userId, String deviceId) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("userId", userId);
		map.put("deviceId", deviceId);
		return (ArrayList)commonDAO.selectList("device.selectLicense", map);
	}

	public ArrayList<String> getSwList(String userId) throws Exception{
		return (ArrayList)commonDAO.selectList("device.selectDeviceSwList", userId);
	}
	
	/**
	 * 디바이스 삭제
	 * @param id 디바이스 아이디
	 * @return 삭제된 row 수
	 * @throws Exception DAO Exception
	 */
	public int deleteDevice(int id) throws Exception {
		return commonDAO.delete("deleteDevice", id);
	}

	/**
	 * 디바이스 닉네임 수정
	 * @param deviceVO {@link DeviceVO#id},
	 *                 {@link DeviceVO#nickname}
	 * @return 업데이트한 row 수
	 * @throws Exception DAO Exception
	 */
	public int updateDeviceNickname(DeviceVO deviceVO) throws Exception {
		return commonDAO.update("updateDeviceNickname", deviceVO);
	}
}
