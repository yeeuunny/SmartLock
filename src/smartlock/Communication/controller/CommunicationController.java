package smartlock.Communication.controller;

import java.util.ArrayList;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import smartlock.Communication.service.CommunicationService;
import smartlock.member.vo.UserVO;

@Controller 
public class CommunicationController {
	
	@Resource
	private CommunicationService communicationService;
	
	//맥주소 중복여부 확인(등록된 디바이스인지 확인) - 등록된 디바이스면 true (성공)
	@RequestMapping(value="/check/mac", method=RequestMethod.POST)
	public @ResponseBody boolean checkMac(
			@RequestBody Map<String, String> map,
			HttpServletRequest request) throws Exception{
		String mac = map.get("mac");
		String id = map.get("user_id");
		boolean check = false;
		try{
			ArrayList<String> macList = new ArrayList<String>();
			macList = communicationService.getMac(id);
			System.out.println(macList);
			for(int i = 0; i < macList.size() ; i++){
				if(mac.equals(macList.get(i))){
					check = true;
					break;
				}
			}
			return check;
		} catch(Exception e) {
			return false;
		}
	}
	
	//등록가능횟수 초과 > false 리턴 
		@RequestMapping(value="/check/count", method=RequestMethod.POST)
		public @ResponseBody boolean checkCount(
				@RequestBody Map<String, String> map,
				HttpServletRequest request) throws Exception{
			String id = map.get("user_id");
			boolean check = true;
			int count;
			try{
				count = communicationService.getCount(id);
				if(count == 0){
					check = false;
				}
				return check;
			} catch(Exception e) {
				return false;
			}
		}
			
	
	//회사의 전체 소프트웨어 프로세스명 리턴 (성공)
	@RequestMapping(value="/check/all", method = RequestMethod.POST)
	public @ResponseBody ArrayList<String> checkAll(
			@RequestBody Map<String, String> map,
			HttpServletRequest request) throws Exception{
		ArrayList<String> list = new ArrayList<String>();
		String id = map.get("user_id");
		try{
			System.out.println(id);
			list = communicationService.getAllSoftwareList(id);
			System.out.println(list);
			return list;
		} catch(Exception e){
			return null;
		}
	}
	
//	//사용자의 사용 가능한 소프트웨어 프로세스명 리턴 
//	@RequestMapping(value="/check", method = RequestMethod.POST)
//	public @ResponseBody ArrayList<String> check(
//			@RequestBody Map<String, String> map,
//			HttpServletRequest request) throws Exception{
//		ArrayList<String> list = new ArrayList<String>();
//		String mac = map.get("mac");
//		String id = map.get("user_id");
//		UserVO userVO = (UserVO) request.getSession().getAttribute("user");
//		try{
//			list = communicationService.getSoftwareList(id, mac);
//			return list;
//		} catch(Exception e){
//			return null;
//		}
//	}
	
	
	
	//사용자의 사용 가능한 소프트웨어 프로세스명 리턴 
		@RequestMapping(value="/check", method = RequestMethod.POST)
		public @ResponseBody boolean check(
				@RequestBody Map<String, String> map,
				HttpServletRequest request) throws Exception{
			boolean check = true;
			String name;
			String mac = map.get("mac");
			String id = map.get("user_id");
			String proc_name = map.get("name");
			System.out.println(proc_name);
			UserVO userVO = (UserVO) request.getSession().getAttribute("user");
			try{
				name = communicationService.getSoftware(map);
				if(name.equals(null))
					check = false;
				return check;
			} catch(Exception e){
				return false;
			}
		}
	
	//디바이스 닉네임 중복 여부 확인 - 닉네임 중복이면  (성공)
	@RequestMapping(value="/check/nickname", method = RequestMethod.POST)
	public @ResponseBody boolean checkNickname(
			@RequestBody Map<String, String> map,
			HttpServletRequest request) throws Exception{
		int count = 0;
		String nickname = map.get("nickname");
		String id = map.get("user_id");
		String mac = map.get("map");
		System.out.println(nickname +"!!!!"+ id);
		ArrayList<String> list = new ArrayList<String>();
		boolean check = false;
		try{
			list = communicationService.getNicknameList(id);
			for(int i = 0; i < list.size() ; i++){
				if(nickname.equals(list.get(i))){
					check = true;
					break;
				}
			}
			if(check == false){
				communicationService.addDevice(map);
				communicationService.decreaseCount(id);
			}
			return check;
		} catch(Exception e){
			return false;
		}
	}
	
}
