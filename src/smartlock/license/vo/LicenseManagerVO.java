package smartlock.license.vo;

import java.util.Date;

public class LicenseManagerVO {
	private String sw_name;
	private String user_name;
	private Date start_date;
	private Date end_date;
	private int state;
	private int sw_id;
	public String getSw_name() {
		return sw_name;
	}
	public void setSw_name(String sw_name) {
		this.sw_name = sw_name;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getSw_id() {
		return sw_id;
	}
	public void setSw_id(int sw_id) {
		this.sw_id = sw_id;
	}
	@Override
	public String toString() {
		return "LicenseManagerVO [sw_name=" + sw_name + ", user_name=" + user_name + ", start_date=" + start_date
				+ ", end_date=" + end_date + ", state=" + state + ", sw_id=" + sw_id + "]";
	}
}
