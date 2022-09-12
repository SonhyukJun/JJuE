<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<head>
<meta charset="UTF-8">
<style>
.btn{
	background-color: #FFC846;
}
.btn:hover{
	background-color: #FFC846;
}

</style>
<title>개인 정보 조회</title>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<br><br><br>
<%-- <% 
	String memberId = (String) session.getAttribute("SessionMemberId");
	System.out.print(memberId);
%> --%>
<h1>개인 정보 조회</h1>
<table border="1">
	<tr>
		<th>아이디</th>
		<td>${memberSelect.memberId}</td>
	</tr>
	<tr>
		<th>이름</th>
		<td>${memberSelect.memberName}</td>
	</tr>
	<tr>
		<th>닉네임</th>
		<td>${memberSelect.memberNickname}</td>
	</tr>
	<tr>
		<c:set var="resident" value="${memberSelect.memberResident}"/>
		<c:set var="firstResident" value="${fn:substring(resident,0,6)}"/>
		<c:set var="lastResident" value="${fn:substring(resident,6,7)}"/>
		<th>생년월일</th>
		<td>${firstResident} - ${lastResident}******</td> 
	</tr>
	<tr>
		<th>주소</th>
		<td>${memberSelect.memberAddress}</td>
	</tr>
	<tr>
		<c:set var="telnumber" value="${memberSelect.memberTelNumber}"/>
       	<c:set var="FirstNumber" value="${fn:substring(telnumber,0,3)}"/>
       	<c:set var="MiddleNumber" value="${fn:substring(telnumber,3,4)}"/>
       	<c:set var="LastNumber" value="${fn:substring(telnumber,7,8)}"/>       
		<th>전화번호</th>
		<td>${FirstNumber} - ${MiddleNumber}*** - ${LastNumber}***</td>
	</tr>
	<tr>
		<th>등급</th>
		<td>${memberSelect.memberGrade}</td>
	</tr>
</table>
<br>
<button type="button" class="btn" onclick="location.href='modifyMemberLogin.do'">개인 정보 수정</button>
<button type="button" class="btn" onclick="location.href='unSignUpMember.do'">회원 탈퇴 </button>

</body>
</html>