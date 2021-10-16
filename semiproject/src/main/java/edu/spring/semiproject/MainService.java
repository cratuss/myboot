package edu.spring.semiproject;

import java.util.List;

public interface MainService {
	public List<UserVO> userSelectAll();
	public int userInsert(UserVO vo);
	public UserVO userSelectOne(UserVO vo);
	public List<BoardVO> boardSelectAll();
	public List<BoardVO> boardSelectType(String a);
	public BoardVO boardSelectOne(int b);
	public int boardInsert(BoardVO vo);
	public int boardDelete(int a);
	public List<CommentVO> commentSelect(int c);
	public int commentInsert(CommentVO vo);
	public int commentDelete(int d);
	
}
