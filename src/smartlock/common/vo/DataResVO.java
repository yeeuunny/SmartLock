package smartlock.common.vo;

import smartlock.member.vo.UserVO;

import javax.servlet.http.HttpServletRequest;

public class DataResVO {

    private String status;
    private Object data;

    public DataResVO() {}

    public DataResVO(HttpServletRequest request, RunnableDataResVO runnable) {
        try {
            setStatus("success");

            UserVO userVO = (UserVO) request.getSession().getAttribute("user");
            Object data = runnable.run(userVO);
            setData(data);
        } catch (Exception e) {
            e.printStackTrace();
            setStatus("error");
            setData("error");
        }
    }

    public DataResVO(HttpServletRequest request, RunnableDataResVOWithSelf runnable) {
        try {
            setStatus("success");

            UserVO userVO = (UserVO) request.getSession().getAttribute("user");
            Object data = runnable.run(userVO, this);
            setData(data);
        } catch (Exception e) {
            e.printStackTrace();
            setStatus("error");
            setData("error");
        }
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    @FunctionalInterface
    public interface RunnableDataResVO {
        public abstract Object run(UserVO userVO) throws Exception;
    }

    @FunctionalInterface
    public interface RunnableDataResVOWithSelf {
        public abstract Object run(UserVO userVO, DataResVO dataResVO) throws Exception;
    }
}
