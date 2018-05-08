package smartlock.license.vo;

import java.util.Date;

public class LicenseUserVO {
	private String nickname;
	private String sw_name;
	private Date start_date;
	private Date end_date;
	private int state;
	private String corp_name;
	private int sw_id;
	private int device_count;
	
	public int getDevice_count() {
		return device_count;
	}
	public void setDevice_count(int device_count) {
		this.device_count = device_count;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
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
	public String getCorp_name() {
		return corp_name;
	}
	public void setCorp_name(String corp_name) {
		this.corp_name = corp_name;
	}
	public int getSw_id() {
		return sw_id;
	}
	public void setSw_id(int sw_id) {
		this.sw_id = sw_id;
	}
	@Override
	public String toString() {
		return "LicenseUserVO [nickname=" + nickname + ", sw_name=" + sw_name + ", start_date=" + start_date
				+ ", end_date=" + end_date + ", state=" + state + ", corp_name=" + corp_name + ", sw_id=" + sw_id
				+ ", device_count=" + device_count + "]";
	}
	
	
}
