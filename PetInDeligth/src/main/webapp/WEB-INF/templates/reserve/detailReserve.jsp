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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<br/><br/><br/>
<div class="a">
<div>

	<div>
	<input type="hidden" id="roomNo" value="${room.roomNo}" readonly/>
	<input type="hidden" id="reserveStartDatee" value="<fmt:formatDate value="${reserve.reserveStartDate}" pattern="yyyy-MM-dd" />" readonly/>
	<input type="hidden" id="reserveEndDatee" value="<fmt:formatDate value="${reserve.reserveEndDate}" pattern="yyyy-MM-dd" />" readonly/>
	<input type="hidden" id="count" value="${reserve.count}" readonly/>
	<input type="hidden" id="memberId" value="${member.memberId }" readonly/>
	<input type="hidden" id="price" value="${room.price * days}" readonly/>
		<div><section>
				<h2>Pet In Delight</h2><br>
				<h4>
				${room.roomNo}번방<br/>
				<fmt:formatDate value="${reserve.reserveStartDate}" pattern="yyyy-MM-dd" />~
				<fmt:formatDate value="${reserve.reserveEndDate}" pattern="yyyy-MM-dd" /> |	${days} 박 <br/>
				최대 수용 마리수 : ${room.count}
				체크인 16:00 | 체크아웃 12:00<br>
				마리수 : ${reserve.count }
				</h4>
				<div><h4>
				총 결제 금액 : ${room.price * days}
				</h4></div>
			</section>
			
			<section>
				<div>
					<label>이용자</label> 
					${member.memberNickname} <br/>
					<label>연락처</label>
					${member.memberTelNumber}
				</div>
			</section>
			
			<section>
				<label> 주의사항</label><br/>
				<input type="text" id="reqContent" Placeholder="주의사항을 입력해 주세요"/>
			</section>
			
			<button value="결제하기" onclick="payment()">결제하기</button>
		</div>
	</div>
</div>


<script type="text/javascript">
function payment() {
	var sendDate = {
			roomNo : $('#roomNo').val(),
			reserveStartDatee : $('#reserveStartDatee').val(),
			reserveEndDatee : $('#reserveEndDatee').val(),
			count : $('#count').val(),
			memberId : $('#memberId').val(),
			price : $('#price').val(),
			roomNo : $('#roomNo').val(),
			reqContent : $('#reqContent').val()
		}
	$.ajax({
		url: "insertReserve.do",
		type: "POST",
		data: sendDate,
		success: function(data){
			if ( data == 1 ){
				goPost();
/*location.href="reserveSuccess.do"*/
			}else {
				alert("TT")
			}
		}
	});
};
	
	function goPost(){
		method = "POST";
		var form = document.createElement("form");
		form.setAttribute("method", "POST");
		form.setAttribute("action", "reserveSuccess.do");
			
		document.body.appendChild(form);
		form.submit();
	}
</script>

</div>
<div id="footer" align="center">
<jsp:include page="../footer.jsp"></jsp:include>
</div>
</body>
</html>