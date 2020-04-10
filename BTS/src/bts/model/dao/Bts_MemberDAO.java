package bts.model.dao;

import java.util.List;

import bts.model.vo.Bts_MemberVO;

public interface Bts_MemberDAO {
	
	//회원 가입
	public void signupMember(Bts_MemberVO vo) throws Exception;
	//아이디 비번 확인
	public int loginCheck(Bts_MemberVO vo) throws Exception;
	//전체 회원 데이터 조회
	public List selectAll() throws Exception;
	//회원 한명 데이터 조회
	public Bts_MemberVO selectMember(String id) throws Exception;
	//회원 데이터 수정
	public void updateMember(Bts_MemberVO vo) throws Exception;
	//회원 데이터 삭제
	public void deleteMember(String id) throws Exception;
	//아이디 사용가능여부 조회
	public int idAvailCheck(String id) throws Exception;

	
}
