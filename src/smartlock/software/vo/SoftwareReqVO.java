package smartlock.software.vo;

public class SoftwareReqVO {

	private int id;
    private String sw_name;
    private String corp_name;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
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
	@Override
	public String toString() {
		return "SoftwareReqVO [id=" + id + ", sw_name=" + sw_name + ", corp_name=" + corp_name + "]";
	}
	
}
