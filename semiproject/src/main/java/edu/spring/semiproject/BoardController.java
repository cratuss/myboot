package edu.spring.semiproject;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class BoardController {

	@Autowired
	MainService service;
	
	
	@RequestMapping("/boardmain")
	public ModelAndView main() {
		System.out.println("");
		List<BoardVO> list = service.boardSelectAll();
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("boardlist", list);
		mv.setViewName("boardmain");

		return mv;
	}
	
	@RequestMapping("/login")
	public ModelAndView login(String result) {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("login");
		
		if(result != null) {
			mv.addObject("result", result);
		}
		
		return mv;
	}
	
	@RequestMapping(value ="/loginaccess", method=RequestMethod.POST, produces = {"application/json;charset=utf-8"})
	public ModelAndView loginaccess(UserVO vo, HttpSession session) {
		
		UserVO real = service.userSelectOne(vo);
		
		
		ModelAndView mv = new ModelAndView();
		
		if(service.userSelectOne(vo) != null) {
			session.setAttribute("iuser", real);
			mv.setViewName("redirect:boardmain");
		}else {
			mv.addObject("result", "로그인 실패하였습니다.");
			mv.setViewName("redirect:login");
		}
		
		return mv;
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		
		session.removeAttribute("iuser");
		
		return "redirect:boardmain";
	}
	
	@RequestMapping("/boardtype")
	public ModelAndView boardtype(String category) {
		
		ModelAndView mv = new ModelAndView();
		List<BoardVO> list = service.boardSelectType(category);
		mv.addObject("boardlist", list);
		mv.addObject("category", category);
		mv.setViewName("boardmain");
		
		return mv;
	}
	
	@RequestMapping("/boarddetail")
	public ModelAndView boarddetail(@RequestParam("iboard_id") int iboard_id) {

		BoardVO vo = service.boardSelectOne(iboard_id);
		List<CommentVO> list = service.commentSelect(iboard_id);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("boarddetail", vo);
		mv.addObject("commentlist", list);
		mv.setViewName("boarddetail");
		
		return mv;
	}
	
	@RequestMapping("/boardinsert")
	public String boardinsert() {
		
		return "boardinsert";
	}
	
	@RequestMapping("/boardinsertaccess")
	public String boardinsertaccess(BoardVO vo, HttpSession session) {
		
		UserVO vo3 = (UserVO)session.getAttribute("iuser");
		
		vo.setIboard_iuser_id(vo3.getIuser_id());
		vo.setIboard_iuser_name(vo3.getIuser_name());
		
		service.boardInsert(vo);

		return "redirect:boardmain";
	}
	
	@RequestMapping("/contentsdelete")
	public String contentsdelete(int iboard_id) {
		
		service.boardDelete(iboard_id);
		
		return "redirect:boardmain";
	}
	
	
	
	@RequestMapping(value ="/commentsadd", method=RequestMethod.POST, produces = {"application/json;charset=utf-8"})
	@ResponseBody
	public String commentsadd(CommentVO vo, HttpSession session) {
		
		UserVO real = (UserVO)session.getAttribute("iuser");
		
		vo.setComments_iuser_id(real.getIuser_id());
		vo.setComments_iuser_name(real.getIuser_name());
		
		service.commentInsert(vo);
		
		String success= "{\"process\" : \"댓글 작성 완료\"}";
		
		return success;
	}
	
	@RequestMapping("/commentsdelete")
	public String commentsdelete(int comments_id, int comments_iboard_id, RedirectAttributes redirectAttributes) {
		
		service.commentDelete(comments_id);
		
		redirectAttributes.addAttribute("iboard_id", comments_iboard_id);
		
		return "redirect:boarddetail";
	}
	
}
