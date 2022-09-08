<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	function selectmember() {
		
	}
</script>
</head>
<body>
<% 
	String memberId = (String) session.getAttribute("SessionMemberId");
	String memberNickname = (String) session.getAttribute("SessionMemberNickname");
	System.out.print(memberId);
	System.out.println(memberNickname);
%>
<% if(memberId != null) { %>
		${SessionMemberId} 하이영
		<a href="selectMember.do">개인정보조회</a>
		<a href="logout.do">로그아웃</a>
<% } else {%>
		비로그인입니다.
		<a href="login.do">로그인</a>
<% } %>
</body>  
</html>