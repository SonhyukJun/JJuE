package ph.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ph.service.MembersDAO;
import ph.service.MembersService;
import ph.service.MembersVO;

@Service("memberService")
public class MembersServiceImpl implements MembersService {
	
	@Resource(name = "memberDAOMybatis")
	private MembersDAO dao;

	@Override
	public int memberId_check(String memberId) throws Exception {
		int result = dao.memberId_check(memberId);
		return result;
	}

	@Override
	public int memberNickname_check(String memberNickname) throws Exception {
		int result = dao.memberNickname_check(memberNickname);
		return result;
	}
	
	@Override
	public int memberNickname_check2(MembersVO membersVo) throws Exception {
		int result = dao.memberNickname_check2(membersVo);
		return result;
	}
	
	@Override
	public int memberTelNumber_check(String memberTelNumber) throws Exception {
		int result = dao.memberTelNumber_check(memberTelNumber);
		return result;
	}

	@Override
	public void signUpMember(MembersVO membersVo) throws Exception {
		dao.signUpMember(membersVo);		
	}
	
	@Override
	public int loginMember(MembersVO membersVo) throws Exception {
		int result = dao.loginMember(membersVo);
		return result;
	}

	@Override
	public MembersVO selectMember(String memberId) throws Exception {		
		return dao.selectMember(memberId);
	}
	
	@Override
	public void modifyMember(MembersVO membersVo) throws Exception {
		dao.modifyMember(membersVo);		
	}

	@Override
	public int unSignUpMember_check(MembersVO membersVo) throws Exception {
		int result = dao.unSignUpMember_check(membersVo);
		return result;
	}

	@Override
	public void unSignUpMember(String memberId) throws Exception {
		dao.unSignUpMember(memberId);
	}
	
	@Override
	public String memberNickname(String memberId) throws Exception {
		return dao.memberNickname(memberId);
	}

	@Override
	public String memberRole() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MembersVO> selectMembersList() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}


	
}
