package smartlock.device.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import smartlock.common.vo.DataResVO;
import smartlock.device.service.DeviceService;
import smartlock.device.vo.DeviceVO;

@Controller
public class DeviceApiController {

	@Resource
	private DeviceService deviceService;

	/**
	 * 디바이스 등록
	 * @param deviceVO TODO: 필요한 변수에 대한 주석
	 * @return 등록된 row 수
	 */
	@RequestMapping(value = "/device/add", method = RequestMethod.POST)
	public @ResponseBody DataResVO addDevice(
			//@RequestBody DeviceVO deviceVO,
			HttpServletRequest request) {

		return new DataResVO(request, (userVO) -> {
			// TODO: 디바이스 등록 구현
			//return deviceService.addDevice(deviceVO) != 0 ? true : false;

			return true;
		});
	}

	/**
	 * 디바이스 제거
	 * @param deviceVO {@link DeviceVO#id}
	 * @return 제거된 row 수
	 */
	@RequestMapping(value = "/device/delete", method = RequestMethod.POST)
	public @ResponseBody DataResVO deleteDevice(
			@RequestBody DeviceVO deviceVO,
			HttpServletRequest request) {

		return new DataResVO(request, (userVO) -> {
			return deviceService.deleteDevice(deviceVO.getId());
		});
	}

	/**
	 * 디바이스 닉네임 업데이트
	 * @param deviceVO {@link DeviceVO#id},
	 *                 {@link DeviceVO#nickname}
	 * @return 업데이트된 row 수
	 */
	@RequestMapping(value = "/device/update/nickname", method = RequestMethod.POST)
	public @ResponseBody DataResVO updateDeviceNickname(
			@RequestBody DeviceVO deviceVO,
			HttpServletRequest request) {

		return new DataResVO(request, (userVO) -> {
			return deviceService.updateDeviceNickname(deviceVO);
		});
	}
}
