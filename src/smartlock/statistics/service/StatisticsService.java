package smartlock.statistics.service;

import java.util.ArrayList;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import smartlock.common.CommonDAO;
import smartlock.license.vo.LicenseManagerReqVO;
import smartlock.statistics.vo.StatisticsVO;

@Service
public class StatisticsService {
	@Resource(name = "commonDAO")
	private CommonDAO commonDAO;
	
	public StatisticsVO viewStatistics(String id) throws Exception{
		StatisticsVO statisticsVO = new StatisticsVO();
		statisticsVO.setRequest_license((Integer)commonDAO.selectOne("statistics.countReqLicense", id));
		statisticsVO.setLicense((Integer)commonDAO.selectOne("statistics.countLicense", id));
		statisticsVO.setDemo_license((Integer)commonDAO.selectOne("statistics.countDemo", id));
		statisticsVO.setTotal(statisticsVO.getDemo_license()+statisticsVO.getLicense());
		return statisticsVO;
	}
	
	public StatisticsVO viewStatisticsByName(Map<String, String> map) throws Exception{
		StatisticsVO statisticsVO = new StatisticsVO();
		statisticsVO.setRequest_license((Integer)commonDAO.selectOne("statistics.countReqLicenseByName", map));
		statisticsVO.setLicense((Integer)commonDAO.selectOne("statistics.countLicenseByName", map));
		statisticsVO.setDemo_license((Integer)commonDAO.selectOne("statistics.countDemoByName", map));
		statisticsVO.setTotal(statisticsVO.getDemo_license()+statisticsVO.getLicense());
		return statisticsVO;
	}
}
