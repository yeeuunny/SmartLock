package smartlock.license.vo;

import java.util.Date;

public class LicenseManagerReqVO {
	private String sw_name;
	private String user_name;
	private Date request_date;
	private String id;
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
	public Date getRequest_date() {
		return request_date;
	}
	public void setRequest_date(Date request_date) {
		this.request_date = request_date;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
		return "LicenseManagerReqVO [sw_name=" + sw_name + ", user_name=" + user_name + ", request_date=" + request_date
				+ ", id=" + id + ", state=" + state + ", sw_id=" + sw_id + "]";
	}
}
