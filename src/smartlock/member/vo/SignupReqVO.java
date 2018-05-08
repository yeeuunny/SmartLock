package smartlock.member.vo;

public class SignupReqVO extends UserIdReqVO {

    private String pwd;
    private String name;
    private String email;
    private String phone;
    private int corp_id;
    private int authority;

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public int getCorp_id() {
        return corp_id;
    }

    public void setCorp_id(int corp_id) {
        this.corp_id = corp_id;
    }

    public int getAuthority() {
        return authority;
    }

    public void setAuthority(int authority) {
        this.authority = authority;
    }

    @Override
    public String toString() {
        return "SignupReqVO{" +
                "pwd='" + pwd + '\'' +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", corp_id=" + corp_id +
                ", authority=" + authority +
                '}';
    }
}
