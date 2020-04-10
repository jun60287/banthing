package bts.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import bts.model.vo.Bts_ChatVO;

public class Bts_ChatDAO {
	
	private SqlSessionTemplate sqlSession = null;

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public void createChat(Bts_ChatVO vo) {
		sqlSession.insert("chat.createChat", vo);
	}
  public List<Bts_ChatVO> getChatInfo() {
      List<Bts_ChatVO> chatList = sqlSession.selectList("chat.getChatInfo");
      return chatList;
   }
   
	 
}