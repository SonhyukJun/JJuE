package pid.members.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import pid.members.service.MembersService;
import pid.members.service.MembersVO;

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

	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String loginForm(HttpSession session, HttpServletRequest request) {
		String memberId = "";
		String employeeNo = "";
		session = request.getSession();
		memberId = (String) session.getAttribute("SessionMemberId");
		employeeNo = (String) session.getAttribute("SessionEmployeeNo");		
		if (memberId != null || employeeNo != null) {		
			return "main";
		} else {
			return "login";
		}
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
			String nickname = service.memberNickname(memberId);
			String telNumber = service.memberTelNumber(memberId);
			MembersVO memberSession = service.selectMember(memberId);
			session.setAttribute("SessionMemberId", membersVo.getMemberId());
			session.setAttribute("SessionMemberNickname", nickname);
			session.setAttribute("SessionMemberTelNumber", telNumber);
			session.setAttribute("SessionMember", memberSession);

		} else {
			System.out.println("로그인 실패");
		}
		return result;
	}

	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String mainForm() {
		return "main";
	}

	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("SessionMember");
		session.removeAttribute("SessionMemberId");
		session.removeAttribute("SessionMemberNickname");
		session.removeAttribute("SessionMemberTelNumber");		
		
		session.removeAttribute("SessionEmployee");
		session.removeAttribute("SessionEmployeeNo");
		session.removeAttribute("SessionEmployeeNickname");
		session.removeAttribute("SessionEmployeeRole");
		return "main";
	}

	@RequestMapping(value = "/selectMember.do", method = RequestMethod.GET)
	public String selectMember(HttpSession session, HttpServletRequest request, Model model) throws Exception {
		String memberId = "";
		session = request.getSession();
		memberId = (String) session.getAttribute("SessionMemberId");
		if (memberId != null) {
			model.addAttribute("memberSelect", service.selectMember(memberId));
			return "member/selectMember";
		} else {
			return "loginCheck";
		}
	}

	@RequestMapping(value = "/modifyMemberLogin.do", method = RequestMethod.GET)
	public String modifyMemberLogin(HttpSession session, HttpServletRequest request) throws Exception {
		String memberId = "";
		session = request.getSession();
		memberId = (String) session.getAttribute("SessionMemberId");
		if (memberId != null) {
			return "member/modifyMemberLogin";
		} else {
			return "loginCheck";
		}
	}

	@RequestMapping(value = "/modifyMember.do", method = RequestMethod.GET)
	public String modifyMemberForm(HttpSession session, HttpServletRequest request, Model model) throws Exception {
		String memberId = "";
		session = request.getSession();
		memberId = (String) session.getAttribute("SessionMemberId");
		if (memberId != null) {
			model.addAttribute("memberSelect", service.selectMember(memberId));
			return "member/modifyMember/modifyMember";
		} else {
			return "loginCheck";
		}
	}

	@RequestMapping(value = "/modifyMemberPassword.do", method = RequestMethod.GET)
	public String modifyMemberPassword(HttpSession session, HttpServletRequest request) throws Exception {
		String memberId = "";
		session = request.getSession();
		memberId = (String) session.getAttribute("SessionMemberId");
		if (memberId != null) {
			MembersVO memberSession = (MembersVO) service.selectMember(memberId);
			session.setAttribute("SessionMember", memberSession);
			return "member/modifyMember/modifyMemberPassword";
		} else {
			return "loginCheck";
		}
	}

	@ResponseBody
	@RequestMapping(value = "/modifyMemberPassword.do", method = RequestMethod.POST)
	public String modifyMemberPassword(@RequestParam(name = "memberId") String memberId,
			@RequestParam(name = "memberPassword") String memberPassword,
			@RequestParam(name = "memberCheckPassword") String memberCheckPassword, MembersVO membersVo)
			throws Exception {
		membersVo.setMemberId(memberId);
		membersVo.setMemberPassword(memberPassword);
		membersVo.setMemberCheckPassword(memberCheckPassword);
		service.modifyMemberPassword(membersVo);
		String data = "ok";
		System.out.println(data);
		return data;
	}

	@RequestMapping(value = "/modifyMemberNickname.do", method = RequestMethod.GET)
	public String modifyMemberNickname(HttpSession session, HttpServletRequest request) throws Exception {
		String memberId = "";
		session = request.getSession();
		memberId = (String) session.getAttribute("SessionMemberId");
		if (memberId != null) {
			MembersVO memberSession = (MembersVO) service.selectMember(memberId);
			session.setAttribute("SessionMember", memberSession);
			return "member/modifyMember/modifyMemberNickname";
		} else {
			return "loginCheck";
		}
	}

	@ResponseBody
	@RequestMapping(value = "/modifyMemberNickname_check.do", method = RequestMethod.POST)
	public String modifyMemberNickname_check(@RequestParam(name = "memberNickname") String memberNickname)
			throws Exception {
		String data = "";
		int result = service.memberNickname_check(memberNickname);
		if (result == 1) {
			data = "no";
		} else {
			data = "ok";
		}
		return data;
	}

	@ResponseBody
	@RequestMapping(value = "/modifyMemberNickname.do", method = RequestMethod.POST)
	public String modifyMemberNickname(@RequestParam(name = "memberId") String memberId,
			@RequestParam(name = "memberNickname") String memberNickname, MembersVO membersVo, HttpSession session,
			HttpServletRequest request) throws Exception {
		String data = "";
		String memberNick = "";
		session = request.getSession();
		memberId = (String) session.getAttribute("SessionMemberId");
		memberNick = (String) session.getAttribute("SessionMemberNickname");
		int result = service.memberNickname_check(memberNickname);
		if (memberNickname.equals(memberNick) && result == 1 || result == 0) {
			membersVo.setMemberId(memberId);
			membersVo.setMemberNickname(memberNickname);
			service.modifyMemberNickname(membersVo);
			data = "ok";
		} else if (memberNickname != memberNick && result == 1) {
			data = "no";
		}
		return data;
	}

	@RequestMapping(value = "/modifyMemberTelNumber.do", method = RequestMethod.GET)
	public String modifyMemberTelNumber(HttpSession session, HttpServletRequest request) throws Exception {
		String memberId = "";
		session = request.getSession();
		memberId = (String) session.getAttribute("SessionMemberId");
		if (memberId != null) {
			MembersVO memberSession = (MembersVO) service.selectMember(memberId);
			System.out.println(memberSession);
			session.setAttribute("SessionMember", memberSession);
			return "member/modifyMember/modifyMemberTelNumber";
		} else {
			return "loginCheck";
		}
	}

	@ResponseBody
	@RequestMapping(value = "/modifyMemberTelNumber.do", method = RequestMethod.POST)
	public String modifyMemberTelNumber(@RequestParam(name = "memberId") String memberId,
			@RequestParam(name = "memberTelNumber") String memberTelNumber, MembersVO membersVo, HttpSession session,
			HttpServletRequest request) throws Exception {
		String data = "";
		String memberTelNum = "";
		session = request.getSession();
		memberId = (String) session.getAttribute("SessionMemberId");
		memberTelNum = (String) session.getAttribute("SessionMemberTelNumber");
		int result = service.memberTelNumber_check(memberTelNumber);
		if (memberTelNumber.equals(memberTelNum) && result == 1 || result == 0) {
			membersVo.setMemberId(memberId);
			membersVo.setMemberNickname(memberTelNumber);
			service.modifyMemberTelNumber(membersVo);
			data = "ok";
		} else if (memberTelNumber != memberTelNum && result == 1) {
			data = "no";
		}
		return data;
	}

	@RequestMapping(value = "/unSignUpMember.do", method = RequestMethod.GET)
	public String unSignUpMemberForm(HttpSession session, HttpServletRequest request) {
		String memberId = "";
		session = request.getSession();
		memberId = (String) session.getAttribute("SessionMemberId");
		if (memberId != null) {
			return "member/unSignUpMember";
		} else {
			return "loginCheck";
		}
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

	@RequestMapping(value = "/findMemberId.do", method = RequestMethod.GET)
	public String findMemberIdForm(HttpSession session) {
		session.removeAttribute("findById");
		return "member/findMemberId";
	}
	
	@RequestMapping(value = "/modifylogin.do", method = RequestMethod.GET)
	public String loginForm(HttpSession session) {
		session.removeAttribute("findById");
		return "login";
	}
	@ResponseBody
	@RequestMapping(value = "/findMemberId.do", method = RequestMethod.POST)
	public String findMemberId(@RequestParam(name = "memberName") String memberName,
			@RequestParam(name = "memberResident") String memberResident,
			@RequestParam(name = "memberTelNumber") String memberTelNumber, MembersVO membersVo, HttpSession session)
			throws Exception {
		String data = "";
		membersVo.setMemberName(memberName);
		membersVo.setMemberResident(memberResident);
		membersVo.setMemberTelNumber(memberTelNumber);
		String findId = service.findMemberId(membersVo);
		if (findId == null) {
			data = "no";
		} else {
			session.setAttribute("findById", findId);
			data = "ok";
		}
		return data;
	}

	@RequestMapping(value = "/findMember.do", method = RequestMethod.GET)
	public String findMemberForm() {
		return "member/findMember";
	}

	@RequestMapping(value = "/findMemberPassword.do", method = RequestMethod.GET)
	public String findMemberPasswordForm() {
		return "member/findMemberPassword";
	}

	@ResponseBody
	@RequestMapping(value = "findMemberPassword1.do", method = RequestMethod.POST)
	public String findMemberPassword1(@RequestParam(name = "memberId") String memberId,
			@RequestParam(name = "memberPassword") String memberPassword,
			@RequestParam(name = "memberCheckPassword") String memberCheckPassword, MembersVO membersVo)
			throws Exception {
		String data = "";
		if (memberId != null) {
			membersVo.setMemberId(memberId);
			membersVo.setMemberPassword(memberPassword);
			membersVo.setMemberCheckPassword(memberCheckPassword);
			service.findMemberPassword1(membersVo);
			data = "ok";
		} else {
			data = "no";
		}
		return data;
	}

	@ResponseBody
	@RequestMapping(value = "findMemberPassword2.do", method = RequestMethod.POST)
	public String findMemberPassword2(@RequestParam(name = "memberId") String memberId,
			@RequestParam(name = "memberTelNumber") String memberTelNumber,
			@RequestParam(name = "memberPassword") String memberPassword,
			@RequestParam(name = "memberCheckPassword") String memberCheckPassword, MembersVO membersVo)
			throws Exception {
		String data = "";
		membersVo.setMemberId(memberId);
		membersVo.setMemberTelNumber(memberTelNumber);
		int result = service.findMemberPassword2(membersVo);
		if (result == 1) {
			membersVo.setMemberPassword(memberPassword);
			membersVo.setMemberCheckPassword(memberCheckPassword);
			service.findMemberPassword1(membersVo);
			data = "ok";
		} else {
			data = "no";
		}
		return data;
	}
	
	@RequestMapping(value = "/membersList.do", method= RequestMethod.GET)
	public String memberListForm(MembersVO membersVo, Model model,
			HttpSession session, HttpServletRequest request) throws Exception {
		String employeeNo = "";
		session = request.getSession();
		employeeNo = (String) session.getAttribute("SessionEmployeeNo");
		if(employeeNo != null) {
			model.addAttribute("membersList", service.selectMembers(membersVo));
			return "member/membersList";
		} else {
			return "loginCheck";
		}
	}
	
	@RequestMapping(value = "/adminSelectMember.do", method = RequestMethod.GET)
	public String adminSelectMember(String memberId, Model model,
			HttpSession session, HttpServletRequest request) throws Exception {
		String employeeNo = "";
		session = request.getSession();
		employeeNo = (String) session.getAttribute("SessionEmployeeNo");
		if(employeeNo != null) {
			model.addAttribute("memberSelect", service.selectMember(memberId));
			return "member/selectMember";
		} else {
			return "loginCheck";
		}		
	}	
}