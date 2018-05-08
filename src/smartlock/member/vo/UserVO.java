package smartlock.member.vo;

public class UserVO {
	private String id;
	private String password;
	private int authority;
	private String phone_number;
	private String email;
	private int corp_id;
	private String user_name;

	public UserVO() {}

	public UserVO(SignupReqVO signupReqVO) {
		this.id = signupReqVO.getId();
		this.password = signupReqVO.getPwd();
		this.authority = signupReqVO.getAuthority();
		this.phone_number = signupReqVO.getPhone();
		this.email = signupReqVO.getEmail();
		this.corp_id = signupReqVO.getCorp_id();
		this.user_name = signupReqVO.getName();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getAuthority() {
		return authority;
	}

	public void setAuthority(int authority) {
		this.authority = authority;
	}

	public String getPhoneNumber() {
		return phone_number;
	}

	public void setPhoneNumber(String phone_number) {
		this.phone_number = phone_number;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getCorpId() {
		return corp_id;
	}

	public void setCorpId(int corp_id) {
		this.corp_id = corp_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	@Override
	public String toString() {
		return "UserVO{" +
				"id='" + id + '\'' +
				", password='" + password + '\'' +
				", authority=" + authority +
				", phone_number='" + phone_number + '\'' +
				", email='" + email + '\'' +
				", corp_id=" + corp_id +
				", user_name='" + user_name + '\'' +
				'}';
	}

	
}
