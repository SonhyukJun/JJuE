<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.a{
	display: block;
	}
</style>
<script type="text/javascript">

</script>
</head>
<body>
<h1>
	TEST  Reserve Able Room Page
</h1>
	
	<div>
			<c:forEach items="${roomList}" var="room">
				<img src="${pageContext.request.contextPath}/resource/img/${room.picturePath}" style="width:200px; height:200; ">
				<a href="roominformationview.do?roomNo=${room.roomNo}">
				<%-- <a href="#" onclick="goInfromationView(${room.roomNo}); return false;"> --%>
				<div>
					<c:out value="${room.roomNo}"/>
				</div>
				<div>
					<c:out value="${room.price}"/>
					<p><c:out value="${room.count}"/></p>
				</div>
				</a>
			</c:forEach>
	</div>
	<a href="#">
		<div>
			<h1>test</h1>
		</div>
	</a>
</body>
</html>