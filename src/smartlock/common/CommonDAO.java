package smartlock.common;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository("commonDAO")
public class CommonDAO extends SqlSessionDaoSupport{
	
	@Resource(name="sqlSession")
	public void setSuperSqlMapClient(SqlSessionTemplate sqlSessionTemplate) throws Exception {
        super.setSqlSessionTemplate(sqlSessionTemplate);
    }

	/**
	 * 목록을 가져오는 기능을 한다
	 * @param sql
	 * @param paramVO 목록을 가져오기 위해 필요한 VO
	 * @return List<Object> 결과 목록을 반환한다
	 */
	public List<Object> selectList(String sql, Object paramVO) throws Exception {
		return getSqlSession().selectList(sql, paramVO);
	}

	/**
	 * 상세정보를 Object형태로 반환한다.
	 * @param sql
	 * @param paramVO
	 * @return
	 */
	public Object selectOne(String sql, Object paramVO) throws Exception {
		return getSqlSession().selectOne(sql, paramVO);
	}

	/**
	 * 항목을 등록하는 기능을 한다
	 * @param sql
	 * @param paramVO
	 * @return 성공시 null / 실패시 에러
	 */
	public int insert(String sql, Object paramVO) throws Exception {
		return getSqlSession().insert(sql, paramVO);
	}

	/**
	 * 항목을 수정하는 기능을 한다
	 * @param sql
	 * @param paramVO
	 * @return 성공시 1 / 실패시 0
	 */
	public int update(String sql, Object paramVO) throws Exception {
		return getSqlSession().update(sql, paramVO);
	}

	/**
	 * 항목을 삭제하는 기능을 한다
	 * @param sql
	 * @param paramVO
	 * @return 삭제한 row수를 반환한다
	 */
	public int delete(String sql, Object paramVO) throws Exception {
		return getSqlSession().delete(sql, paramVO);
	}
}
