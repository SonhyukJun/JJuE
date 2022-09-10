<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ph.service.MembersVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 		
	String memberId = (String) session.getAttribute("SessionMemberId");
	MembersVO memberSession = (MembersVO) session.getAttribute("SessionMember");
	System.out.println(memberSession);
%>
<% if(memberId != null) { %>
		${SessionMember.getMemberNickname()} //
		${SessionMember.getMemberId()} //
		<a href="selectMember.do">개인정보조회</a>
		<a href="logout.do">로그아웃</a>
<% } else {%>
		비로그인입니다.
		<a href="login.do">로그인</a>
<% } %>
</body>  
</html>