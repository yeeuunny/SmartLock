package smartlock.license.vo;

import java.util.Date;

public class LicenseUserReqVO {
	private String sw_name;
	private String corp_name;
	private Date request_date;
	private int state;
	private int sw_id;
	public String getSw_name() {
		return sw_name;
	}
	public void setSw_name(String sw_name) {
		this.sw_name = sw_name;
	}
	public String getCorp_name() {
		return corp_name;
	}
	public void setCorp_name(String corp_name) {
		this.corp_name = corp_name;
	}
	public Date getRequest_date() {
		return request_date;
	}
	public void setRequest_date(Date request_date) {
		this.request_date = request_date;
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
		return "LicenseUserReqVO [sw_name=" + sw_name + ", corp_name=" + corp_name + ", request_date=" + request_date
				+ ", state=" + state + ", sw_id=" + sw_id + "]";
	}
	
}
