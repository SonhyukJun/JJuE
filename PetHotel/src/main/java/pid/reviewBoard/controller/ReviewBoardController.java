package pid.reviewBoard.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import pid.members.service.MembersVO;
import pid.reviewBoard.service.BoardVO;
import pid.reviewBoard.service.ReviewBoardService;
 
@Controller
public class ReviewBoardController {
	
	@Resource(name="reviewBoardService")
	private ReviewBoardService boardService;
	
	
	@RequestMapping(value="/write.do")
	public String write(HttpSession session, HttpServletRequest request,Model model) {
		String memberId=null;
		session= request.getSession();
		memberId=(String) session.getAttribute("SessionMemberId");
		
		model.addAttribute("memberId",memberId);
		return "ReviewBoard/ReviewWriteForm";
	}

	//리뷰 글쓰기
	@ResponseBody
	@RequestMapping(value="/insertReviewboard.do", method=RequestMethod.GET)
	public String insertReviewBoard(BoardVO boardVO, MembersVO membersVO, HttpSession session, HttpServletRequest request) throws Exception {
		//System.out.println("값 넘어왔당");
		String memberId=null;
		String memberNickname=null;
		String data="";
		session= request.getSession();
		//System.out.println(session);
		memberId=(String) session.getAttribute("SessionMemberId");
		memberNickname=(String) session.getAttribute("SessionMemberNickname");
		//System.out.println("닉네임"+memberNickname);
		boardVO.setMemberId(memberId);
		boardVO.setMemberNickname(memberNickname);
		//System.out.println("값 넘어왔당");
		if(memberId!=null) {
			boardService.insertBoard(boardVO);
		}else if(memberId==null)
			data="no";
		return data;	
	}
	
	//리뷰 검색
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap(){
		Map<String, String> conditionMap=new HashMap<String, String>();
		conditionMap.put("제목","TITLE");
		conditionMap.put("내용","CONTENT");
		return conditionMap;
	}
	
	
	//리뷰글 조회 
	@RequestMapping(value="/reviewBoardlist.do")
	public String reviewBoardlist(BoardVO boardVo, Model model, HttpSession session, HttpServletRequest request) throws Exception {
		//System.out.println("목록보기");
		String memberId=null;
		session= request.getSession();
		memberId=(String) session.getAttribute("SessionMemberId");
		
		int total=boardService.totalReview(boardVo);
		
		int totalPage=(int)Math.ceil((double)total/10);
		
		int pageList=boardVo.getPageList();
		
		int viewPage=boardVo.getViewPage();
		
		int firstPage = ((viewPage - 1) / pageList) * pageList + 1;
		int lastPage = firstPage + pageList - 1;
		if (lastPage > totalPage) {
			lastPage = totalPage;
		}
		int startIndex = (viewPage - 1) * 10;
		int endIndex = 10;
		
		boardVo.setStartIndex(startIndex);
		boardVo.setEndIndex(endIndex);

		boardVo.setPageList(pageList);
		boardVo.setFirstPage(firstPage);
		boardVo.setLastPage(lastPage);
		
		if(boardVo.getSearchCondition()==null) boardVo.setSearchCondition("TITLE");
		if(boardVo.getSearchKeyword()==null) boardVo.setSearchKeyword("");
		
		model.addAttribute("memberId",memberId);
		model.addAttribute("total", total);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("pageList", pageList);
		model.addAttribute("firstPage", firstPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("reviewBoardList",boardService.selectReviewList(boardVo));
		
		return "ReviewBoard/reviewBoardlist";
	}
	
	//리뷰글 1개조회
	@RequestMapping(value="/reviewBoard.do")
	public String reviewBoard(BoardVO boardVo, Model model, HttpSession session, HttpServletRequest request) throws Exception {
		//System.out.println("리뷰보드 컨트롤러");
		//System.out.println("보드"+boardVo);
		String memberId=null;
		session= request.getSession();
		memberId=(String) session.getAttribute("SessionMemberId");
		
		BoardVO reviewBoard=boardService.selectReview(boardVo);
		model.addAttribute("reviewBoard",reviewBoard);
		model.addAttribute("memberId",memberId);
		model.addAttribute("minReview",boardService.minReview());
		model.addAttribute("maxReview",boardService.maxReview());
		return "ReviewBoard/reviewBoard";
	}
	
	//리뷰글 삭제
	@RequestMapping(value="/deleteReview.do")
	public String deleteReview(BoardVO boardVo) throws Exception {
		//System.out.println("딜리트시작");
		//System.out.println("딜리트넘버값"+boardVo.toString());
		boardService.deleteReview(boardVo);
		return "ReviewBoard/reviewBoard";
	}
	
	//수정페이지 이동
	@RequestMapping(value="reviewUp.do")
	public String reviewUp(BoardVO boardVo, Model model, HttpSession session, HttpServletRequest request) throws Exception {
		//System.out.println(boardVo);
		String memberId=null;
		session= request.getSession();
		memberId=(String) session.getAttribute("SessionMemberId");
		
		model.addAttribute("memberId",memberId);
		model.addAttribute("reviewBoard",boardService.selectReview(boardVo));
		//System.out.println(reviewBoard.toString());
		return "ReviewBoard/ReviewWriteForm";
	}
	
	//진짜 수정
	@RequestMapping(value="reviewUpdate.do")
	public String reviewUpdate(BoardVO boardVo) throws Exception {
		//System.out.println("넘어온 값"+boardVo.toString());
		boardService.updateReview(boardVo);
		return "ReviewBoard/reviewBoardlist";
	}
	
	//이전글 이동
	@RequestMapping(value="beforeReview.do")
	public String reviewBefore(BoardVO boardVo, Model model, HttpSession session, HttpServletRequest request) throws Exception {
		System.out.println("이전글 이동"+boardVo);
		String memberId=null;
		session= request.getSession();
		memberId=(String) session.getAttribute("SessionMemberId");
		model.addAttribute("reviewBoard",boardService.beforeReview(boardVo));
		model.addAttribute("memberId",memberId);
		model.addAttribute("minReview",boardService.minReview());
		return "ReviewBoard/reviewBoard";

	}
	
	//다음 글 이동
	@RequestMapping(value="afterReview.do")
	public String afterReview(BoardVO boardVo, Model model, HttpSession session, HttpServletRequest request) throws Exception {
		//System.out.println("다음글 이동"+boardVo);
		String memberId=null;
		session= request.getSession();
		memberId=(String) session.getAttribute("SessionMemberId");
		
		//System.out.println("다음글" + reviewBoard);
		model.addAttribute("reviewBoard",boardService.afterReview(boardVo));
		model.addAttribute("memberId",memberId);
		model.addAttribute("maxReview",boardService.maxReview());
		return "ReviewBoard/reviewBoard";

	}
}
