package smartlock.statistics.vo;

import java.sql.Date;


/**
 * 관리자 - 월 별 통계 VO
 * @author yeeun
 *
 */
public class StatisticsMonthlyVO {
	private int sw_id;
	private String sw_name;
	private Date start_date;
	
	public StatisticsMonthlyVO() {
		super();
	}

	public StatisticsMonthlyVO(int sw_id, String sw_name, Date start_date) {
		super();
		this.sw_id = sw_id;
		this.sw_name = sw_name;
		this.start_date = start_date;
	}

	public int getSw_id() {
		return sw_id;
	}

	public void setSw_id(int sw_id) {
		this.sw_id = sw_id;
	}

	public String getSw_name() {
		return sw_name;
	}

	public void setSw_name(String sw_name) {
		this.sw_name = sw_name;
	}

	public Date getStart_date() {
		return start_date;
	}

	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}

	@Override
	public String toString() {
		return "StatisticsMonthlyVO [sw_id=" + sw_id + ", sw_name=" + sw_name
				+ ", start_date=" + start_date + "]";
	}
}
