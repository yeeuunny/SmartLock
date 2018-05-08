package smartlock.member.vo;

public class LoginReqVO extends UserIdReqVO {

    private String pwd;

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    @Override
    public String toString() {
        return "LoginReqVO{" +
                "pwd='" + pwd + '\'' +
                '}';
    }
}
