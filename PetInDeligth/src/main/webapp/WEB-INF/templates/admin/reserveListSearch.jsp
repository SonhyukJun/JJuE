<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<div id="mainHide">	
		<table class="table table-hover">
			<thead>
				<tr>
					<td align="center">예약번호</td>
					<td align="center">방번호</td>
					<td align="center">시작일자</td>
					<td align="center">종료일자</td>
					<td align="center">마리수</td>
					<td align="center">아이디</td>
					<td align="center">가격</td>
					<td align="center">예약상태</td>
					<td align="center">요청사항</td>					
				</tr>
			</thead>
			<tbody>
				<c:forEach var="reserveListAll" items="${reserveListAll}">
				<tr> 
					<td align="center">${reserveListAll.reserveNo}</td>
					<td align="center">${reserveListAll.roomNo}</td>
					<td align="center"><fmt:formatDate value="${reserveListAll.reserveStartDate}" pattern="yyyy-MM-dd"/></td>
					<td align="center"><fmt:formatDate value="${reserveListAll.reserveEndDate}" pattern="yyyy-MM-dd"/></td>
					<td align="center">${reserveListAll.count}</td>
					<td align="center">${reserveListAll.memberId}</td>
					<td align="center">${reserveListAll.price}</td>
					<td align="center">${reserveListAll.reserveType}</td>
					<td align="center">${reserveListAll.reqContent}</td>
				</tr>
				</c:forEach>
			</tbody>		
		</table>
	</div>
</div>
</body>
</html>