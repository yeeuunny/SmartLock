package smartlock.test.vo;

public class TestVO {
    private String id;
    private String password;
    private int authority;
    private String phone_number;
    private String email;
    private int corp_id;

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
    public String getPhone_number() {
        return phone_number;
    }
    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public int getCorp_id() {
        return corp_id;
    }
    public void setCorp_id(int corp_id) {
        this.corp_id = corp_id;
    }
    @Override
    public String toString() {
        return "TestVO [id=" + id + ", password=" + password + ", authority=" + authority + ", phone_number="
                + phone_number + ", email=" + email + ", corp_id=" + corp_id + "]";
    }
}
