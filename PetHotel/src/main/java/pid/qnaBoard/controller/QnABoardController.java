package pid.qnaBoard.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import pid.members.service.MembersService;
import pid.members.service.MembersVO;
import pid.qnaBoard.service.BoardVO;
import pid.qnaBoard.service.QnABoardService;
import pid.qnaBoard.service.ReplyQnABoardService;
import pid.qnaBoard.service.ReplyQnABoardVO;

@Controller
public class QnABoardController {
	
	@Resource(name = "memberService")
	private MembersService service;
	
	@Resource(name="QnAboardService")
	private QnABoardService qnAboardService; 
	
	@Resource(name="ReplyQnABoardService")
	private ReplyQnABoardService replyQnABoardService;
	
	@RequestMapping("success.do")
	public String success(HttpSession session, HttpServletRequest request) {
		String memberId ="";
		session = request.getSession();
		memberId = (String) session.getAttribute("SessionMemberId");	
		session.setAttribute("SessionMemberId",memberId);
		return "QnAboard/success";
		 
	}
	
	@RequestMapping("freeboard.do")
	public String board(HttpSession session, HttpServletRequest request,Model model,MembersVO membersVo,BoardVO boardVo,ReplyQnABoardVO replyVo) throws Exception {
		String memberId ="";
		session = request.getSession();
		memberId = (String) session.getAttribute("SessionMemberId");	
		session.setAttribute("SessionMemberId",memberId);
		List<MembersVO> membersList = service.selectMembers(membersVo);
		List<BoardVO> boardList = qnAboardService.qnABoardList(boardVo);
		List<ReplyQnABoardVO> replyQnABoardList = replyQnABoardService.replyQnABoardList(replyVo);
		model.addAttribute("memberList", membersList);
		model.addAttribute("boardList",boardList);
		model.addAttribute("replyQnABoardList",replyQnABoardList);
		return "QnAboard/QnA";
	}
	
	@RequestMapping(value="insert.do",method = RequestMethod.GET)
	public String insert(HttpSession session, HttpServletRequest request,Model model) throws Exception {
		String memberId ="";
		session = request.getSession();
		memberId = (String) session.getAttribute("SessionMemberId");  
		session.setAttribute("SessionMemberId",memberId);
		//model.addAttribute("boardSelect", boardService.selectBoard(boardNo));
		model.addAttribute("memberSelect", service.selectMember(memberId));
		
		return "QnAboard/insertBoard";
	}
	
	@RequestMapping(value="ins.do", method = RequestMethod.POST)
	public String ins(HttpSession session, HttpServletRequest request,BoardVO boardVo) throws Exception {
		String memberId ="";
		session = request.getSession();
		memberId = (String) session.getAttribute("SessionMemberId");
		session.setAttribute("SessionMemberId",memberId);
		boardVo.setMemberId(memberId);
		boardVo.setBoardType("QnA");
		qnAboardService.QnABoardInsert(boardVo);
		
		return "QnAboard/QnA";
	}
	
	@RequestMapping(value="QnAView.do", method = RequestMethod.GET)
	public String qnABoardView(HttpSession session, HttpServletRequest request,BoardVO boardVo,Model model,ReplyQnABoardVO replyQnABoardVo) throws Exception {
		String memberId ="";
		session = request.getSession();
		memberId = (String) session.getAttribute("SessionMemberId");  
		session.setAttribute("SessionMemberId",memberId);
		BoardVO board = qnAboardService.selectQnABoard(boardVo);
		int min = replyQnABoardService.minReplyQnABoardNo(replyQnABoardVo);
		int max = replyQnABoardService.maxReplyQnABoardNo(replyQnABoardVo);
		model.addAttribute("board",board);
		model.addAttribute("min",min);
		model.addAttribute("max",max);
		return "QnAboard/QnAView";
	}
	
	//
	@RequestMapping(value="backPage.do", method = RequestMethod.GET)
	public String backPage(HttpSession session, HttpServletRequest request,BoardVO boardVo,Model model, ReplyQnABoardVO replyQnABoardVo) throws Exception {
		String memberId ="";
		session = request.getSession();
		memberId = (String) session.getAttribute("SessionMemberId");  
		session.setAttribute("SessionMemberId",memberId);
		BoardVO board = qnAboardService.backQnABoard(boardVo);
		int min = replyQnABoardService.minReplyQnABoardNo(replyQnABoardVo);
		model.addAttribute("board",board);
		model.addAttribute("min",min);
		return "QnAboard/QnAView";
	}
	
	@RequestMapping(value="nextPage.do", method = RequestMethod.GET)
	public String nextPage(HttpSession session, HttpServletRequest request,BoardVO boardVo,Model model,ReplyQnABoardVO replyQnABoardVo) throws Exception {
		String memberId ="";
		session = request.getSession();
		memberId = (String) session.getAttribute("SessionMemberId");  
		session.setAttribute("SessionMemberId",memberId);
		BoardVO board = qnAboardService.nextQnABoard(boardVo);
		int max = replyQnABoardService.maxReplyQnABoardNo(replyQnABoardVo);
		model.addAttribute("board",board);
		model.addAttribute("max",max);
		return "QnAboard/QnAView";
	}
	
	
	
	@RequestMapping(value="updateQnABoard.do", method = RequestMethod.GET)
	public String updateQnABoard(HttpSession session, HttpServletRequest request,BoardVO boardVo,Model model) throws Exception {
		String memberId ="";
		session = request.getSession();
		memberId = (String) session.getAttribute("SessionMemberId");  
		session.setAttribute("SessionMemberId",memberId);
		BoardVO board = qnAboardService.selectQnABoard(boardVo);
		model.addAttribute("board",board);
		return "QnAboard/updateQnABoard";
	}
	
	@ResponseBody
	@RequestMapping(value="up.do", method = RequestMethod.POST)
	public String up(HttpSession session, HttpServletRequest request,BoardVO boardVo,Model model) throws Exception {
		String memberId ="";
		session = request.getSession();
		memberId = (String) session.getAttribute("SessionMemberId");  
		session.setAttribute("SessionMemberId",memberId);
		qnAboardService.updateQnABoard(boardVo);
	
		return "QnAboard/QnA";
	}
	
	@RequestMapping(value="del.do", method = RequestMethod.POST)
	public String del(HttpSession session, HttpServletRequest request,BoardVO boardVo,Model model,int boardNo) throws Exception{
		String memberId ="";
		session = request.getSession();
		memberId = (String) session.getAttribute("SessionMemberId");  
		session.setAttribute("SessionMemberId",memberId);
		MembersVO selectMemberId = service.selectMemberId(boardNo);
		
		if(memberId.equals(selectMemberId.getMemberId())) {
			qnAboardService.deleteQnABoard(boardVo);
			return "QnAboard/updateQnABoard";
		}
		return "QnAboard/error";
	} 
	
	@RequestMapping(value="replyQnABoard.do", method = RequestMethod.GET)
	public String replyQnABoard(HttpSession session, HttpServletRequest request, ReplyQnABoardVO replyQnABoardVo, Model model,BoardVO boardVo,int boardNo) throws Exception {
		String memberIds ="";
		session = request.getSession();
		memberIds = (String) session.getAttribute("SessionMemberId");  
		session.setAttribute("SessionMemberId",memberIds);
		ReplyQnABoardVO selectReplyQnABoard = replyQnABoardService.selectReplyQnABoard(replyQnABoardVo);
		BoardVO board = qnAboardService.selectQnABoard(boardVo);
		MembersVO selectMemberId =service.selectMemberId(boardNo);
		
		if(memberIds.equals(selectMemberId.getMemberId())) {
			model.addAttribute("selectReplyQnABoard",selectReplyQnABoard);
			model.addAttribute("board",board);
			return "QnAboard/replyQnAView";
		}else {
			return "QnAboard/error";
		}
	}
}
