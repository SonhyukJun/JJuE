package ph.service;

import java.util.List;

public interface MembersService {
	
	int memberId_check(String memberId) throws Exception;
	
	int memberNickname_check(String memberNickname) throws Exception;
	
	int memberNickname_check2(MembersVO membersVo) throws Exception;
	
	int memberTelNumber_check(String memberTelNumber) throws Exception;

	void signUpMember(MembersVO membersVo) throws Exception;
	
	int loginMember(MembersVO membersVo) throws Exception;
	
	MembersVO selectMember(String memberId) throws Exception;	
	
	void modifyMember(MembersVO membersVo) throws Exception;
	
	int unSignUpMember_check(MembersVO membersVo) throws Exception;
	
	void unSignUpMember(String memberId) throws Exception;
	
	String memberNickname(String memberId) throws Exception;

	
	String memberRole() throws Exception;
	
	List<MembersVO> selectMembersList() throws Exception;
	

}
