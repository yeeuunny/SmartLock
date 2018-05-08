package smartlock.device.vo;

import java.sql.Date;

public class DeviceVO {
	private int id;
	private String user_id;
	private String sw_name;
	private String nickname;
	private Date reg_date;
	private int type;
	private String mac;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getSw_name() {
		return sw_name;
	}
	public void setSw_name(String sw_name) {
		this.sw_name = sw_name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getMac() {
		return mac;
	}
	public void setMac(String mac) {
		this.mac = mac;
	}
	@Override
	public String toString() {
		return "DeviceVO [id=" + id + ", user_id=" + user_id + ", sw_name=" + sw_name + ", nickname=" + nickname
				+ ", reg_date=" + reg_date + ", type=" + type + ", mac=" + mac + "]";
	}
	
	
	
}
