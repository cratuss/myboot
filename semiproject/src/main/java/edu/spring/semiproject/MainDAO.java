package edu.spring.semiproject;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MainDAO {
	
	@Autowired
	SqlSession session;

	public int userInsert(UserVO vo) {
		int result = session.insert("web.userInsert", vo);
		return result;
	}

	public UserVO userSelectOne(UserVO vo) {
		UserVO vo1 = session.selectOne("web.userSelectOne", vo);
		return vo1;
	}

	public List<BoardVO> boardSelectAll() {
		List<BoardVO> list = session.selectList("web.boardSelectAll");
		return list;
	}

	public BoardVO boardSelectOne(int b) {
		BoardVO vo = session.selectOne("web.boardSelectOne", b);
		return vo;
	}

	public int boardInsert(BoardVO vo) {
		int result = session.insert("web.boardInsert", vo);
		return result;
	}

	public int boardDelete(int a) {
		int result = session.delete("web.boardDelete", a);
		return result;
	}

	public List<CommentVO> commentSelect(int c) {
		List<CommentVO> list = session.selectList("web.commentSelect", c);
		return list;
	}

	public int commentInsert(CommentVO vo) {
		int result = session.insert("web.commentInsert", vo);
		return result;
	}

	public int commentDelete(int d) {
		int result = session.delete("web.commentDelete", d);
		return result;
	}
	
	public List<BoardVO> boardSelectType(String a) {
		List<BoardVO> list = session.selectList("web.boardSelectType", a);
		return list;
	}
	
	public List<UserVO> userSelectAll() {
		List<UserVO> list = session.selectList("web.userSelectAll");
		return list;
	}
	
}
