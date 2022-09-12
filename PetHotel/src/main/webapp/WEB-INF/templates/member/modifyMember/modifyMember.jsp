<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	function modifyMemberPassword() {
		var width = 600;
		var height = 600;
		
		var left = (window.screen.width/2) - (width/2);
		var top = (window.screen.height / 4); 
		
		var windowStatus = 'width='+width+', height='+height+', left='+left+', top='+top+', scrollbars=yes, status=yes, resizable=yes, titlebar=yes';
		
		const url = "http://localhost:8080/PetInDeligth/modifyMemberPassword.do"; 
		window.open(url, "비밀번호 변경", windowStatus);		
	}
	function modifyMemberNickname() {
		var width = 600;
		var height = 600;
		
		var left = (window.screen.width/2) - (width/2);
		var top = (window.screen.height / 4);
		
		var windowStatus = 'width='+width+', height='+height+', left='+left+', top='+top+', scrollbars=yes, status=yes, resizable=yes, titlebar=yes';
		
		const url = "http://localhost:8080/PetInDeligth/modifyMemberNickname.do";
		window.open(url, "닉네임 변경", windowStatus);		
	}
	function modifyMemberTelNumber() {
		var width = 600;
		var height = 600;
		
		var left = (window.screen.width/2) - (width/2);
		var top = (window.screen.height / 4);
		
		var windowStatus = 'width='+width+', height='+height+', left='+left+', top='+top+', scrollbars=yes, status=yes, resizable=yes, titlebar=yes';
		
		const url = "http://localhost:8080/PetInDeligth/modifyMemberTelNumber.do";
		window.open(url, "전화번호 변경", windowStatus);		
	}
</script>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../../header.jsp"></jsp:include>
<br><br><br>
<% 
	String memberId = (String) session.getAttribute("SessionMemberId");
	System.out.println(memberId);
%>
<table border="1">
	<tr>
		<th>아이디</th>
		<td colspan="2">${memberSelect.memberId}</td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td>${memberSelect.memberPassword}</td>
		<td><button onclick="javascript:modifyMemberPassword()">비밀번호 변경</button></td>
	</tr>
	<tr>
		<th>이름</th>
		<td colspan="2">${memberSelect.memberName}</td>
	</tr>
	<tr>
		<th>닉네임</th>
		<td>${memberSelect.memberNickname}</td>
		<td><button onclick="javascript:modifyMemberNickname()">닉네임 변경</button></td>
	</tr>
	<tr>
		<c:set var="resident" value="${memberSelect.memberResident}"/>
		<c:set var="firstResident" value="${fn:substring(resident,0,6)}"/>
		<c:set var="lastResident" value="${fn:substring(resident,6,7)}"/>
		<th>생년월일</th>
		<td colspan="2">${firstResident} - ${lastResident}******</td>
	</tr>
	<tr>
		<th>주소</th>
		<td colspan="2">${memberSelect.memberAddress}</td>
	</tr>
	<tr>
		<c:set var="telnumber" value="${memberSelect.memberTelNumber}"/>
       	<c:set var="FirstNumber" value="${fn:substring(telnumber,0,3)}"/>
       	<c:set var="MiddleNumber" value="${fn:substring(telnumber,3,4)}"/>
       	<c:set var="LastNumber" value="${fn:substring(telnumber,7,8)}"/>       
		<th>전화번호</th>
		<td>${FirstNumber} - ${MiddleNumber}*** - ${LastNumber}***</td>
		<td><button onclick="javascript:modifyMemberTelNumber()">전화번호 변경</button></td>
	</tr>
</table>
</body>
</html>