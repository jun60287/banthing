package bts.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import bts.model.vo.Bts_MemberVO;

//sql.xml 호출하는 곳
public class Bts_MemberDAOImpl  implements Bts_MemberDAO {
	
	private SqlSessionTemplate sqlSession = null;

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public void signupMember(Bts_MemberVO vo) throws Exception {
		sqlSession.insert("member.signupMember", vo);
	}

	@Override
	public int loginCheck(Bts_MemberVO vo) throws Exception {
		return sqlSession.selectOne("member.loginCheck", vo);
	}
	
	public int apiIdCheck(String id) throws Exception {
		return sqlSession.selectOne("member.apiIdCheck", id);
	}

	@Override
	public List selectAll() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Bts_MemberVO selectMember(String id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateMember(Bts_MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteMember(String id) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int idAvailCheck(String id) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
