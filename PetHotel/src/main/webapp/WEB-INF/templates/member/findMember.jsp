<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<br><br><br>
<h1>파인드아이디 페이지</h1>
아이디 : ${findById}
<br>
<a href="modifylogin.do">로그인하러가기</a>
<a href="findMemberPassword.do">비밀번호찾으로가기</a>
</body>
</html>