package smartlock.common.vo;

import smartlock.member.vo.UserVO;
import smartlock.profile.vo.PasswordVO;

import javax.servlet.http.HttpServletRequest;

public class MsgResVO {

    private String status;
    private String message;

    public MsgResVO() {}

    public MsgResVO(HttpServletRequest request, RunnableMsgResVO runnable) {
        try {
            setStatus("success");

            UserVO userVO = (UserVO) request.getSession().getAttribute("user");
                        
            String data = runnable.run(userVO);
            setMessage(data);
        } catch (Exception e) {
            e.printStackTrace();
            setStatus("error");
            setMessage("error");
        }
    }

    public MsgResVO(HttpServletRequest request, RunnableMsgResVOWithSelf runnable) {
        try {
            setStatus("success");

            UserVO userVO = (UserVO) request.getSession().getAttribute("user");
            String data = runnable.run(userVO, this);
            setMessage(data);
        } catch (Exception e) {
            e.printStackTrace();
            setStatus("error");
            setMessage("error");
        }
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    @FunctionalInterface
    public interface RunnableMsgResVO {
        public abstract String run(UserVO userVO) throws Exception;
    }

    @FunctionalInterface
    public interface RunnableMsgResVOWithSelf {
        public abstract String run(UserVO userVO, MsgResVO msgResVO) throws Exception;
    }
}
