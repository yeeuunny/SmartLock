package smartlock.statistics.service;

import java.util.ArrayList;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import smartlock.common.CommonDAO;
import smartlock.statistics.vo.StatisticsMonthlyVO;

@Repository
public class StatisticsMonthlyService {
	@Resource(name = "commonDAO")
	private CommonDAO commonDAO;
	
	public ArrayList<StatisticsMonthlyVO> viewStatisticsMonthly(int id) throws Exception
	{
		return (ArrayList)commonDAO.selectList("statistics.countAllLic", id);
	}
	public ArrayList<StatisticsMonthlyVO> 
		viewStatisticsMonthlyBySW(Map<String, Integer> map) throws Exception
	{
		return (ArrayList)commonDAO.selectList("statistics.countLicBySW", map);
	}
}