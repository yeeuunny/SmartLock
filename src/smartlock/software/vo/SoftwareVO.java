package smartlock.software.vo;

import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;


@Repository("softwareVO")
public class SoftwareVO {
	private String corp_name;
	private int id;
    private String sw_name;
    private String version;
    private String proc_name;
    private String info;
    private MultipartFile sw_img;
    
	public SoftwareVO() {
		super();
	}

	public SoftwareVO(String corp_name, int id, String sw_name, String version,
			String proc_name, String info, MultipartFile sw_img) {
		super();
		this.corp_name = corp_name;
		this.id = id;
		this.sw_name = sw_name;
		this.version = version;
		this.proc_name = proc_name;
		this.info = info;
		this.sw_img = sw_img;
	}

	public String getCorp_name() {
		return corp_name;
	}

	public void setCorp_name(String corp_name) {
		this.corp_name = corp_name;
	}

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

	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

	public String getProc_name() {
		return proc_name;
	}

	public void setProc_name(String proc_name) {
		this.proc_name = proc_name;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public MultipartFile getSw_img() {
		return sw_img;
	}

	public void setSw_img(MultipartFile sw_img) {
		this.sw_img = sw_img;
	}

	@Override
	public String toString() {
		return "SoftwareVO [corp_name=" + corp_name + ", id=" + id
				+ ", sw_name=" + sw_name + ", version=" + version
				+ ", proc_name=" + proc_name + ", info=" + info + ", sw_img="
				+ sw_img + "]";
	}
}