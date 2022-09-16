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
<br/><br/><br/>
<div class="a">

<div id="reserveList">
	<table border="1" style="padding:10px;">
		<thead>
			<tr>
				<th><strong>예약 번호</strong></th>
				<th>예약 정보</th>
				<th>가격</th>
				<th>진행상태</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="reserve" items="${reserveList}">
			<fmt:parseNumber var="startDate_N" value="${reserve.reserveStartDate.time / (1000*60*60*24)}" integerOnly="true" />
	<fmt:parseNumber var="endDate_N" value="${reserve.reserveEndDate.time / (1000*60*60*24)}" integerOnly="true" /> 
				<tr>
					<td>${reserve.reserveNo}</td>
					<td>
						예약 방 ${reserve.roomNo }<br>
						예약 일 <fmt:formatDate value="${reserve.reserveStartDate}" pattern="yyyy-MM-dd" /> ~
						<fmt:formatDate value="${reserve.reserveEndDate}" pattern="yyyy-MM-dd" /> <br>
						${reserve.count}마리
					</td>
					<td>
						${reserve.price}<br>${endDate_N - startDate_N}박
					</td>
					<c:if test="${reserve.reserveType == 'Y'}">
						<td>
							예약중 <br>
							<button onclick="reserveCancle(${reserve.reserveNo})">취소하기</button>
						</td>
					</c:if>
					<c:if test="${reserve.reserveType == 'I'}">
						<td>
							사용중 <br>
							<button onclick="window.open('http://192.168.0.107:81/stream','${room.roomNo}room', 'width=600,height=600')">방 보기</button>
						</td>
					</c:if>
					<c:if test="${reserve.reserveType == 'O'}">
						<td>
							체크아웃
							<button onclick="reserveReview(${reserve.reserveNo})">리뷰작성</button>
						</td>
					</c:if>
					<c:if test="${reserve.reserveType == 'R'}">
						<td>
							리뷰작성
						</td>
					</c:if>
					<c:if test="${reserve.reserveType == 'C'}">
						<td>
							취소
						</td>
					</c:if>
					
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<c:if test="${member.memberId == reserveList[0].memberId }">
		<script type="text/javascript">
		
			function reserveCancle(no) {
				var result = confirm("예약을 취소하시겠습니까?");
				if(result){
					$.ajax({
						url: "reserveCancle.do",
						type: "POST",
						data: {reserveNo : no},
						success: function(data){
							if(data = 1){
								location.href="reserveStatus.do";
							}
							else{
								alert("예약정보가 일치하지 않습니다. 다시 로그인해 주세요");
							}
						}
					});
				}
					
			}
			
			function reserveReview(no){
				var reserveNoB=no;
				
				 $.ajax({
						url: 'writeAble.do',
						type: 'GET',
						data: {
							reserveNo:reserveNoB,
							},
						datatype: 'JSON',
						success: function (data){
							if(data=="yes"){
								location.href='write.do?reserveNo='+no
							}else if(data=="no"){
								alert("리뷰작성 권한이 없습니다")
							}
						}
					})
				
			}

		
		</script>
	</c:if>
</div>

</div>
</body>
</html>