<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style>
/* .a{
display: block;
} */
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
<script type="text/javascript">


	function goGet(path, method, roomNo) {
		params = {
				reserveStartDatee : $('#datepicker1').val(),
				reserveEndDatee : $('#datepicker2').val(),
				count : $('#animalcnt').val(),
				roomNo : roomNo
		}
		method = method || "GET";
		var form = document.createElement("form");
		form.setAttribute("method", method);
		form.setAttribute("action", path);
		for ( var key in params) {
			var hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", key);
			hiddenField.setAttribute("value", params[key]);
			form.appendChild(hiddenField);
		}
	
		document.body.appendChild(form);
		form.submit();
	}


	/* function goAjax(){
		var sendDate = {
				reserveStartDatee : $('#datepicker1').val(),
				reserveEndDatee : $('#datepicker2').val(),
				count : $('#animalcnt').val(),
				roomNo : $('#roomNo').val()
		}
		  $.ajax({
	         url: "roominformationview.do",
	         type: "GET",
	         data: sendDate,
	         success: function (data) {
	             $("#search_change_board").html(data);
	         },
	         error: function () {
	             alert('수정 실패!');
	         }
	     }); 
	} */
</script>
</head>
<body>
<h1>
	TEST  Reserve Able Room Page
</h1>
<div class="a">
	<div>
			<c:forEach items="${roomList}" var="room">
				<div style="display:inline-flex; flex-direction:column; justify-content:flex-start; align-items:center;">
					<img src="${pageContext.request.contextPath}/resource/img/${room.picturePath}" class="img-thumbnail" style="width:300px; height:300; ">
					<%-- <a href="roominformationview.do?roomNo=${room.roomNo}"> --%>
					<a href="#" onclick="goGet('roominformationview.do','GET', ${room.roomNo}); return false;">
					<%-- <a href="#" onclick="goInfromationView(${room.roomNo}); return false;"> --%>
					<div  style="display:inline-flex;justify-content:flex-start; align-items:center;">
						<div style="width:50px; margin:10px;">
							<c:out value="${room.roomNo}"/>
						</div>
						<div>
							<c:out value="${room.price}"/>
							<p><c:out value="${room.count}"/></p>
						</div>
					</div>
					</a>
				</div>
			</c:forEach>
	</div>
	<a href="#">
		<div>
			<h1>test</h1>
		</div>
	</a>
</div>
</body>
</html>