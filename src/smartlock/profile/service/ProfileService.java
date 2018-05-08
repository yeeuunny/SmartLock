package smartlock.profile.service;

import java.sql.SQLException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;

import smartlock.common.CommonDAO;
import smartlock.common.Util;
import smartlock.member.vo.UserInfoVO;
import smartlock.member.vo.UserVO;
import smartlock.profile.vo.PasswordVO;
import smartlock.member.vo.CorpVO;
import smartlock.member.vo.LoginReqVO;
import smartlock.member.vo.SignupReqVO;

@Service
public class ProfileService {
	
	@Resource(name="commonDAO")
	private CommonDAO commonDAO;
		
	/**회원정보 수정(UPDATE)
	 * 
	 * @param UserVO
	 * @return int
	 * @throws Exception DAO 예외
	 */
	 public int updateUser(UserVO userVO) throws Exception{
		 userVO.setPassword(Util.encrypt(userVO.getPassword()));
		 
		 int result = commonDAO.update("user.updateUser", userVO);
		 System.out.println(result+"개의 회원정보가 업데이트 되었습니다.");
		 
		 return result;
	 }
	 
	 /**새 비밀번호 변경(UPDATE)
		 * 
		 * @param PasswordVO
		 * @return int
		 * @throws Exception DAO 예외
		 */
	 public int changePasswordUser(PasswordVO passwordVO) throws Exception{
		// 비밀번호 암호화
		 passwordVO.setPassword(Util.encrypt(passwordVO.getPassword()));
		 passwordVO.setNew_password(Util.encrypt(passwordVO.getNew_password()));
		 
		 int result = commonDAO.update("user.changePassword", passwordVO);
		 System.out.println(result+"개의 회원의 비밀번호가 업데이트 되었습니다.");
		 
		 return result;
	 }
	 
	 /**회원 탈퇴(DELETE)
		 * 
		 * @param UserVO
		 * @return void
		 * @throws Exception DAO 예외
		 */
	 public int removeUser(UserVO userVO) throws Exception{
		// 비밀번호 암호화
		 userVO.setPassword(Util.encrypt(userVO.getPassword()));
		 
		 int cnt = commonDAO.delete("user.removeUser", userVO);
		 System.out.println(cnt+"개의 회원이 삭제 되었습니다.");
		 
		 return cnt;
	 }
	 
	 /**기업이름 요청(SELECT)
		 * id로 이름요청
		 * @param userVO
		 * @return String
		 * @throws Exception DAO 예외
		 */
	 public String selectCorpName(UserVO userVO) throws Exception{
		 int corp_id = userVO.getCorpId();
		 System.out.println("기업아이디 : "+corp_id);
		 
		 return (String) commonDAO.selectOne("corp.corpName", corp_id);
	 }
}
