package smartlock.license.vo;

public class DeviceRequestVO {
	private String mac;
	private int type;
	private String nickname;
	
	public String getMac() {
		return mac;
	}
	public void setMac(String mac) {
		this.mac = mac;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	@Override
	public String toString() {
		return "DeviceRequestVO [mac=" + mac + ", type=" + type + ", nickname=" + nickname + "]";
	}
	
}
