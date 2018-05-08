package smartlock.member.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import smartlock.common.CommonDAO;
import smartlock.common.Util;
import smartlock.member.vo.CorpVO;
import smartlock.member.vo.LoginReqVO;
import smartlock.member.vo.SignupReqVO;
import smartlock.member.vo.UserInfoVO;
import smartlock.member.vo.UserVO;

@Service
public class UserService {

	@Resource(name="commonDAO")
	private CommonDAO commonDAO;

	/**
	 * id 로 UserVO 를 가져오는 메소드
	 * @param id 아이디
	 * @return UserVO
	 * @throws Exception DAO 예외
	 */
	public UserVO getUserVO(String id) throws Exception {
		return (UserVO) commonDAO.selectOne("user.selectUser", id);
	}

	/**
	 * id 로 UserInfoVO 를 가져오는 메소드
	 * @param id 아이디
	 * @return UserInfoVO
	 * @throws Exception DAO 예외
	 */
	public UserInfoVO getUserInfoVO(String id) throws Exception{
		return (UserInfoVO) commonDAO.selectOne("user.userInfo", id);
	}

	/**
	 * 아이디가 존재하는지 확인하는 메소드
	 * @param id 아이디
	 * @return 아이디가 존재하면 true
	 * @throws Exception DAO 예외
	 */
	public boolean existId(String id) throws Exception {
		return getUserVO(id) != null;
	}

	/**
	 * 비밀번호를 확인하는 메소드
	 * @param loginReqVO id 와 pw 가 담겨있는 VO
	 * @return 올바른 비밀번호 인지 여부
	 * @throws Exception DAO Exception
	 */
	public Boolean checkPassword(LoginReqVO loginReqVO) throws Exception {
		String id = loginReqVO.getId();
		String pw = (String) commonDAO.selectOne("user.selectPassword", id);
		
		if(pw != null)
			return pw.equals(Util.encrypt(loginReqVO.getPwd()));
		else 
			return null;
	}

	/**
	 * 회원가입
	 * @param userVO user 정보가 담겨있는 VO
	 * @return 성공시 true
	 * @throws Exception DAO Exception
	 */
	public boolean signup(UserVO userVO) throws Exception{
		// 비밀번호 암호화
		userVO.setPassword(Util.encrypt(userVO.getPassword()));

		int result = commonDAO.insert("user.insertUser", userVO);
		return result > 0;
	}

	/**
	 * 회원가입
	 * @param signupReqVO user 정보가 담겨있는 VO
	 * @return 성공시 true
	 * @throws Exception DAO Exception
	 */
	public boolean signup(SignupReqVO signupReqVO) throws Exception{
		return signup(new UserVO(signupReqVO));
	}
	
	/**
	 * 회사존재여부 확인
	 * @param corpName 회사명
	 * @return
	 * @throws Exception
	 */
	public List<CorpVO> searchCorpName(String corpName) throws Exception {
		return (ArrayList)commonDAO.selectList("corp.selectCorp", corpName);
	}
	
	/**
	 * 회사정보 조회
	 * @param corpName 회사명
	 * @return
	 * @throws Exception
	 */
	public CorpVO getCorpInfo(String corpName) throws Exception {
		return (CorpVO)commonDAO.selectOne("corp.selectCorp", corpName);
	}
	
	public boolean insertCorp(CorpVO corpVO) throws Exception {
		int result = commonDAO.insert("corp.insertCorp", corpVO);
		return result > 0;
	}
}
