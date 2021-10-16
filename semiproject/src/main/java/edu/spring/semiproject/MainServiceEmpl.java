package edu.spring.semiproject;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("service")
public class MainServiceEmpl implements MainService{
	
	@Autowired
	MainDAO dao;

	@Override
	public int userInsert(UserVO vo) {
		return dao.userInsert(vo);
	}

	@Override
	public UserVO userSelectOne(UserVO vo) {
		return dao.userSelectOne(vo);
	}

	@Override
	public List<BoardVO> boardSelectAll() {
		return dao.boardSelectAll();
	}

	@Override
	public BoardVO boardSelectOne(int b) {
		return dao.boardSelectOne(b);
	}

	@Override
	public int boardInsert(BoardVO vo) {
		return dao.boardInsert(vo);
	}

	@Override
	public int boardDelete(int a) {
		return dao.boardDelete(a);
	}

	@Override
	public List<CommentVO> commentSelect(int c) {
		return dao.commentSelect(c);
	}

	@Override
	public int commentInsert(CommentVO vo) {
		return dao.commentInsert(vo);
	}

	@Override
	public int commentDelete(int d) {
		return dao.commentDelete(d);
	}

	@Override
	public List<BoardVO> boardSelectType(String a) {
		return dao.boardSelectType(a);
	}

	@Override
	public List<UserVO> userSelectAll() {
		return dao.userSelectAll();
	}
	
	

}
