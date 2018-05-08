package smartlock.reqlicense.vo;

import java.sql.Date;

public class ReqLicenseVO {

    private int id;
    private String user_id;
    private Date request_date;
    private int sw_id;
    private int state;

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

    public Date getRequest_date() {
        return request_date;
    }

    public void setRequest_date(Date request_date) {
        this.request_date = request_date;
    }

    public int getSw_id() {
        return sw_id;
    }

    public void setSw_id(int sw_id) {
        this.sw_id = sw_id;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    @Override
    public String toString() {
        return "ReqLicenseVO{" +
                "id=" + id +
                ", user_id='" + user_id + '\'' +
                ", request_date=" + request_date +
                ", sw_id=" + sw_id +
                ", state=" + state +
                '}';
    }
}
