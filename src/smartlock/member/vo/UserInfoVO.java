package smartlock.member.vo;

public class UserInfoVO {

    private String id;
    private String user_name;
    private int authority;
    private String email;
    private String phone;
    private String company;
    
	public UserInfoVO() {
		super();
	}
	
	public UserInfoVO(String id, String user_name, int authority,
			String email, String phone, String company) {
		super();
		this.id = id;
		this.user_name = user_name;
		this.authority = authority;
		this.email = email;
		this.phone = phone;
		this.company = company;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public int getAuthority() {
		return authority;
	}

	public void setAuthority(int authority) {
		this.authority = authority;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	@Override
	public String toString() {
		return "UserInfoVO [id=" + id + ", user_name="
				+ user_name + ", authority=" + authority + ", email=" + email
				+ ", phone=" + phone + ", company=" + company + "]";
	}
}
