package smartlock.statistics.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import smartlock.member.vo.UserVO;
import smartlock.statistics.service.StatisticsMonthlyService;
import smartlock.statistics.service.StatisticsService;
import smartlock.statistics.vo.StatisticsMonthlyVO;
import smartlock.statistics.vo.StatisticsVO;

// TODO: StatisticsWebController 구현

@Controller
public class StatisticsWebController {

	@Resource(name = "statisticsService")
	private StatisticsService statisticsService;
	
	@Resource(name = "statisticsMonthlyService")
	private StatisticsMonthlyService statisticsMonthlyService;
	
    @RequestMapping(value = "/statistics", method = RequestMethod.GET)
    public ModelAndView statistics(HttpServletRequest request,
    		 @RequestParam(value="sw_id", required=false, defaultValue="0") String sw_id) throws Exception {
    	
        HttpSession httpSession = request.getSession();
        UserVO userVO = (UserVO) httpSession.getAttribute("user");

        if (userVO != null && userVO.getAuthority() == 1) {
        	StatisticsVO statistics = new StatisticsVO();
            ModelAndView modelAndView = new ModelAndView("/smartlock/statistics");
            
            // sw_id : 0 => all
            if(sw_id.equals("0")) {
            	statistics = statisticsService.viewStatistics(userVO.getId());
            } else {
            	Map<String, String> map = new HashMap<String, String>();
            	map.put("sw_id", sw_id);
            	map.put("corp_id", ""+userVO.getCorpId());
            	statistics = statisticsService.viewStatisticsByName(map);
            }
            
            modelAndView.addObject("sw_id", sw_id);
            modelAndView.addObject("statistics", statistics);
            return modelAndView;
        } else {
            return new ModelAndView("redirect:/");
        }
    }

    @RequestMapping(value = "/statistics/filter", method = RequestMethod.GET)
    public ModelAndView statisticsByName(HttpServletRequest request) {
        HttpSession httpSession = request.getSession();
        UserVO userVO = (UserVO) httpSession.getAttribute("user");

        if (userVO != null && userVO.getAuthority() == 1) {
            return new ModelAndView("/smartlock/statistics");
        } else {
            return new ModelAndView("redirect:/");
        }
    }
    
    /*
     * 라이센스 SW별로 통계 - 전체보기
     */
    @RequestMapping(value = "/statistics/monthly", method = RequestMethod.GET)
    public ModelAndView statisticsMonthly(HttpServletRequest request) throws Exception {
    	/*
    	 * 세션 얻기
    	 */
        HttpSession httpSession = request.getSession();
        UserVO userVO = (UserVO) httpSession.getAttribute("user");

        if (userVO != null && userVO.getAuthority() == 1) 
        {
        	/*
        	 * DB에서 1년치 라이센스 가져오기
        	 */
        	ArrayList<StatisticsMonthlyVO> dataList 
        		= statisticsMonthlyService.viewStatisticsMonthly(userVO.getCorpId());
        
        	LinkedHashMap<Integer, String> swList = new LinkedHashMap<Integer, String>();
    		GregorianCalendar cal = new GregorianCalendar();
    		int[] monthCnt = new int[12]; 
    		int swID;
    		
        	/*
        	 * DB에서 뽑은 데이터 월에 따라 배열에 담기
        	 */
        	for(StatisticsMonthlyVO vo : dataList)
        	{        		
        		cal.setTime(vo.getStart_date());
        		++monthCnt[cal.get(Calendar.MONTH)];
        		
        		/*
            	 * SW목록 뽑기
            	 */
        		swID = vo.getSw_id();
        		//if(swList.get(swID) == null)
        			swList.put(swID, vo.getSw_name());
        		
        	}        	
        	
        	ModelAndView modelAndView = new ModelAndView("/smartlock/statistics_monthly");
        	modelAndView.addObject("monthCnt", monthCnt);
        	modelAndView.addObject("swList",swList);
        	
            return modelAndView;    
        }
        else 
            return new ModelAndView("redirect:/");
    }
    
    @RequestMapping(value = "/statistics/monthly/filter", method = RequestMethod.POST)
    public @ResponseBody int[] statisticsMonthlyBySW
    	(HttpServletRequest request, @RequestBody Map<String, String> reqMap) throws Exception
    { 
    	/*
    	 * 세션 얻기
    	 */
        HttpSession httpSession = request.getSession();
        UserVO userVO = (UserVO) httpSession.getAttribute("user");

        if (userVO != null && userVO.getAuthority() == 1) 
        {
        	/*
        	 * DB에서 해당 소프트웨어의 1년치 라이센스 가져오기
        	 */
        	Map<String, Integer> map = new HashMap<String, Integer>();
        	map.put("sw_id", Integer.parseInt(reqMap.get("sw_id")));
        	map.put("corp_id", userVO.getCorpId());
        	
        	ArrayList<StatisticsMonthlyVO> dataList 
        		= statisticsMonthlyService.viewStatisticsMonthlyBySW(map);
        
        	GregorianCalendar cal = new GregorianCalendar();
    		int[] monthCnt = new int[12]; 
        	/*
        	 * DB에서 뽑은 데이터 월에 따라 배열에 담기
        	 */
        	for(StatisticsMonthlyVO vo : dataList)
        	{        		
        		cal.setTime(vo.getStart_date());
        		++monthCnt[cal.get(Calendar.MONTH)];
        	}    
        	return monthCnt;
        } 
        return null;
    }
}
