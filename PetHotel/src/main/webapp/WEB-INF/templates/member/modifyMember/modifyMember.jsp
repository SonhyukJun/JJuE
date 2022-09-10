<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	String memberId = (String) session.getAttribute("SessionMemberId");
	System.out.println(memberId);
%>
<a href="modifyMemberPassword.do">비밀번호 변경</a><br>
<a href="modifyMemberNickname.do">닉네임 변경</a><br>
<a href="">주소 변경</a><br>
<a href="modifyMemberTelNumber.do">전화번호 변경</a><br>
</body>
</html>