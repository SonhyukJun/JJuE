<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인 정보 조회</title>
</head>
<body>
<% 
	String memberId = (String) session.getAttribute("SessionMemberId");
	System.out.print(memberId);
%>
<h1>개인 정보 조회</h1>
아이디 : ${memberSelect.memberId}<br>
비밀번호 : ${memberSelect.memberPassword}<br>
이름 : ${memberSelect.memberName}<br>
닉네임 : ${memberSelect.memberNickname}<br>
생년월일 : ${memberSelect.memberResident}<br>
주소 : ${memberSelect.memberAddress}<br>
전화번호 : ${memberSelect.memberTelNumber}<br>
등급 : ${memberSelect.memberGrade}<br>


<button type="button" class="btn btn-primary" onclick="location.href='modifyMemberLogin.do'">개인 정보 수정</button>
<button type="button" class="btn btn-primary" onclick="location.href='unSignUpMember.do'">회원 탈퇴 </button>

</body>
</html>