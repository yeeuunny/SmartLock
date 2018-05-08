package smartlock.statistics.vo;

public class StatisticsVO {
	private int total;
	private int request_license;
	private int license;
	private int demo_license;
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getRequest_license() {
		return request_license;
	}
	public void setRequest_license(int request_license) {
		this.request_license = request_license;
	}
	public int getLicense() {
		return license;
	}
	public void setLicense(int license) {
		this.license = license;
	}
	public int getDemo_license() {
		return demo_license;
	}
	public void setDemo_license(int demo_license) {
		this.demo_license = demo_license;
	}
	@Override
	public String toString() {
		return "StatisticsVO [total=" + total + ", request_license=" + request_license + ", license=" + license
				+ ", demo_license=" + demo_license + "]";
	}
	
}
