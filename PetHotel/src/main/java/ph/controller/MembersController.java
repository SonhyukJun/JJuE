package ph.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ph.service.MembersService;
import ph.service.MembersVO;

@Controller
public class MembersController {

	@Resource(name = "memberService")
	private MembersService service;

	@RequestMapping(value = "/signUp.do", method = RequestMethod.GET)
	public String signUp() {
		return "member/signUp";
	}

	@ResponseBody
	@RequestMapping(value = "/memberId_check.do", method = RequestMethod.POST)
	public int memberId_check(@RequestParam(name = "memberId") String memberId) throws Exception {
		int result = service.memberId_check(memberId);
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "/memberNickname_check.do", method = RequestMethod.POST)
	public int memberNickname_check(@RequestParam(name = "memberNickname") String memberNickname) throws Exception {
		int result = service.memberNickname_check(memberNickname);
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "/memberTelNumber_check.do", method = RequestMethod.POST)
	public int memberTelNumber_check(@RequestParam(name = "memberTelNumber") String memberTelNumber) throws Exception {
		int result = service.memberTelNumber_check(memberTelNumber);
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "/signUpMember.do", method = RequestMethod.POST)
	public String joinMember(MembersVO membersVo) throws Exception {
		String data = "";
		int idresult = service.memberId_check(membersVo.getMemberId());
		int nickresult = service.memberNickname_check(membersVo.getMemberNickname());
		int telnumberresult = service.memberTelNumber_check(membersVo.getMemberTelNumber());
		if (idresult == 1) {
			data = "id";
		} else if (nickresult == 1) {
			data = "nick";
		} else if (telnumberresult == 1) {
			data = "tel";
		} else {
			service.signUpMember(membersVo);
			data = "ok";
		}
		return data;
	}

	@RequestMapping(value = "/login.do")
	public String loginForm() {
		return "login";
	}

	@ResponseBody
	@RequestMapping(value = "/loginMember.do", method = RequestMethod.POST)
	public int loginMember(@RequestParam(name = "memberId") String memberId,
			@RequestParam(name = "memberPassword") String memberPassword, MembersVO membersVo, HttpSession session)
			throws Exception {
		membersVo.setMemberId(memberId);
		membersVo.setMemberPassword(memberPassword);
		int result = service.loginMember(membersVo);
		if (result == 1) {
			System.out.println("로그인 성공");
			String nickname = (String) service.memberNickname(memberId);
			session.setAttribute("SessionMemberId", membersVo.getMemberId());
			session.setAttribute("SessionMemberNickname", nickname);
		} else {
			System.out.println("로그인 실패");
		}
		return result;
	}

	@RequestMapping(value = "/main.do")
	public String mainForm() {
		return "main";
	}

	@RequestMapping(value = "/logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("SessionMemberId");
		return "main";
	}

	@RequestMapping(value = "/selectMember.do")
	public String selectMember(HttpSession session, HttpServletRequest request, Model model) throws Exception {
		String memberId = "";
		session = request.getSession();
		memberId = (String) session.getAttribute("SessionMemberId");
		model.addAttribute("memberSelect", service.selectMember(memberId));
		return "member/selectMember";
	}

	@RequestMapping(value = "/modifyMember.do", method = RequestMethod.GET)
	public String modifyMemberForm(HttpSession session, HttpServletRequest request, Model model) throws Exception {
		String memberId = "";
		String memberNickname = "";
		session = request.getSession();
		memberId = (String) session.getAttribute("SessionMemberId");
		memberNickname = (String) session.getAttribute("SessionMemberNickname");
		model.addAttribute("memberSelect", service.selectMember(memberId));
		return "member/modifyMember";
	}

	@RequestMapping(value = "/unSignUpMember.do", method = RequestMethod.GET)
	public String unSignUpMemberForm() {
		return "member/unSignUpMember";
	}

	@ResponseBody
	@RequestMapping(value = "/modifyMember.do", method = RequestMethod.POST)
	public String updateMember(@ModelAttribute("memberSelect") MembersVO membersVo, HttpSession session,
			HttpServletRequest request) throws Exception {
		System.out.println(membersVo.toString());
		String data = "";
		String memberId = "";
		String memberNickname = "";
		session = request.getSession();
		memberId = (String) session.getAttribute("SessionMemberId");
		memberNickname = (String) session.getAttribute("SessionMemberNickname");

		int result = service.memberNickname_check(memberNickname);
		if (memberId != null && memberNickname.equals(membersVo.getMemberNickname())) {
			membersVo.getMemberPassword();
			membersVo.getMemberCheckPassword();
			membersVo.getMemberNickname();
			membersVo.getMemberAddress();
			membersVo.getMemberTelNumber();
			service.modifyMember(membersVo);
			data = "ok";
		} else if (memberNickname != membersVo.getMemberNickname() && result == 1) {
			data = "nick";
		}
		String nickname = (String) service.memberNickname(memberId);
		session.setAttribute("SessionMemberNickname", nickname);
		System.out.println(data);
		return data;
	}

	@ResponseBody
	@RequestMapping(value = "/memberNickname_check1.do", method = RequestMethod.POST)
	public int memberNickname_check1(MembersVO membersVo, HttpSession session, HttpServletRequest request,
			@RequestParam(name = "memberNickname") String memberNickname) throws Exception {
		int count = 0;
		int result = service.memberNickname_check(memberNickname);
		String memberNick = "";
		session = request.getSession();
		memberNick = (String) session.getAttribute("SessionMemberNickname");
		if (memberNick.equals(memberNickname) || result == 0) {
			count = 0;
		} else if (memberNick != memberNickname && result == 1) {
			count = 1;
		}

		return count;
	}

	@ResponseBody
	@RequestMapping(value = "/unSignUpMember.do", method = RequestMethod.POST)
	public int unSignUpMember(@RequestParam(name = "memberId") String memberId,
			@RequestParam(name = "memberPassword") String memberPassword, MembersVO membersVo, HttpSession session)
			throws Exception {
		membersVo.setMemberId(memberId);
		membersVo.setMemberPassword(memberPassword);
		int result = service.unSignUpMember_check(membersVo);
		System.out.println(result);
		if (result == 1) {
			service.unSignUpMember(memberId);
		}
		session.removeAttribute("SessionMemberId");
		return result;
	}
}
