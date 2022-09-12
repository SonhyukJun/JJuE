<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<br><br><br>
<h1>전체 회원 조회</h1>

<table border="1" cellpadding="0" cellspacing="0">
	<thead>
		<tr>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>닉네임</th>
			<th>생년월일</th>
			<th>주소</th>
			<th>전화번호</th>
			<th>가입날짜</th>
			<th>등급</th>
			<th>비고</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="membersList" items="${membersList}">
		<tr> 
			<td align="center"><a href="adminSelectMember.do?memberId=${membersList.memberId}">${membersList.memberId}</a></td>
			<td align="center">${membersList.memberPassword}</td>
			<td align="center">${membersList.memberName}</td>
			<td align="center">${membersList.memberNickname}</td>
			<td align="center">${membersList.memberResident}</td>
			<td align="center">${membersList.memberAddress}</td>
			<td align="center">${membersList.memberTelNumber}</td>
			<td><fmt:formatDate value="${membersList.memberSignDate}" pattern="yyyy-MM-dd"/></td>
			<td align="center">${membersList.memberGrade}</td>
			<td align="center">${membersList.memberEtc}</td>
		</tr>
		</c:forEach>
	</tbody>		
</table>
</body>
</html>