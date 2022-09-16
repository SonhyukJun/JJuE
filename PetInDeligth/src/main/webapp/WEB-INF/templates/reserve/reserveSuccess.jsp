<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style>
html {
height: 100%;
}
body {
margin: 0;
height: 100%;
}
.a {
min-height: 100%;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<br><br><br><br><br>
<div class="a">
<fmt:parseNumber var="startDate_N" value="${reserve.reserveStartDate.time / (1000*60*60*24)}" integerOnly="true" />
<fmt:parseNumber var="endDate_N" value="${reserve.reserveEndDate.time / (1000*60*60*24)}" integerOnly="true" /> 
<					 


<div>
<h2>${member.memberNickname}님의 예약이 완료되었습니다.</h2>
	<table border="1" style="margin:30px;">
			<tr>
				<th>예약 번호</th>
				<th>예약 정보</th>
				<th>결제 금액</th>
			</tr>
			<tr>
				<td><strong>${reserve.reserveNo}</strong></td>
				<td>
					<strong>${reserve.roomNo}번방</strong>
					<fmt:formatDate value="${reserve.reserveStartDate}" pattern="yyyy-MM-dd" /> ~
					<fmt:formatDate value="${reserve.reserveEndDate}" pattern="yyyy-MM-dd" /> 
					<br>
					${reserve.count}마리
					<br>
					호텔 위치 : 대구 수성구 알파시티1로 170 PID애견호텔
				</td>
				<td>
					${reserve.price}<br>${endDate_N - startDate_N}박
				</td>
			</tr>
	</table>
	
	<a href="main.do" class="btn">홈으로 가</a>

</div>
</div>
<div id="footer" align="center">
<jsp:include page="../footer.jsp"></jsp:include>
</div>
</body>
</html>