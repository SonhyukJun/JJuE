<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resource/static/css/bootstrap.min.css" rel="stylesheet">
<link href="resource/static/css/font-awesome.min.css" rel="stylesheet">
<link href="resource/static/css/common.css" rel="stylesheet">
<link href="resource/static/css/custom-theme.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
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

.btn{
	background-color: #FFA500;
}
.btn:hover{
	background-color: #FFA500;
}


</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<br/><br/><br/><br/><br/>
<div class="a">
<div class="container">
	<div class="page-header">
            <h1>예약 정보</h1>
    </div>


	<div>
	<input type="hidden" id="roomNo" value="${room.roomNo}" readonly/>
	<input type="hidden" id="reserveStartDatee" value="<fmt:formatDate value="${reserve.reserveStartDate}" pattern="yyyy-MM-dd" />" readonly/>
	<input type="hidden" id="reserveEndDatee" value="<fmt:formatDate value="${reserve.reserveEndDate}" pattern="yyyy-MM-dd" />" readonly/>
	<input type="hidden" id="count" value="${reserve.count}" readonly/>
	<input type="hidden" id="memberId" value="${member.memberId }" readonly/>
	<input type="hidden" id="price" value="${room.price * days}" readonly/>
	
		<div>
			<section>
				<table class="table">
  		         
  		         <tr>
  		         	<th rowspan="5" style="width: 200px"><h3>방 정보</h3></th>
	                <td>날짜</td>
	                <td><fmt:formatDate value="${reserve.reserveStartDate}" pattern="yyyy-MM-dd" />~
				<fmt:formatDate value="${reserve.reserveEndDate}" pattern="yyyy-MM-dd" /> </td>
  		         </tr>
  		         
  		         <tr>
	                <td>숙박일수</td>
	                <td>${days} 박</td>
  		         </tr>
  		         
  		        <tr>
	                <td>마리수/최대마리수</td>
	                <td> ${reserve.count }/${room.count}</td>
  		         </tr>
  		         
  		        <tr>
	                <td>결제금액</td>
	                <td>${room.price * days}원</td>
  		         </tr>
  		         
				</table>
				<br/><br/><br/><br/>
				
				
				<table class="table">
  		         <tr>
	            	<th rowspan="3" style="width: 200px"><h3>예약자 정보</h3></th>
	                <td>예약자</td>
	                <td>${member.memberNickname} </td>
  		         </tr>
  		         
  		         <tr>
	                <td>연락처</td>
	                <td>${member.memberTelNumber}</td>
  		         </tr>
  		         
  		        <tr>
	                <td>요청사항</td>
	                <td><textarea id="reqContent" maxlength="140" rows="10" cols="100" style="height: 100px; Placeholder="주의사항을 입력해 주세요"></textarea></td>
  		         </tr>

				</table>
				<br/><br/><br/><br/>
				
				
				<table class="table">
				 <tr>
	            	<th style="width: 200px"><h3>주의사항</h3></th>
	                <td colspan="2"><p>주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사<br/>
	                항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의<br/>
	               항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의<br/>
	               항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의<br/>
	               항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의<br/>
	               항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의<br/>
	               항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의<br/></p></td>
  		         </tr>
				</table>
				<br/><br/><br/><br/>
				
				<table class="table">
				 <tr>
	            	<th style="width: 200px"><h3>약관</h3></th>
	            	<td colspan="2"><p>주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사<br/>
	                항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의<br/>
	               항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의<br/>
	               항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의<br/>
	               항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의<br/>
	               항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의<br/>
	               항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의사항주의<br/></p></td>
  		         </tr>
				</table>
				<br/><br/><br/><br/>
			
		<div align="right">
       		<h2>${days} 박 총 금액 : ${room.price * days}원&nbsp;<br/></h2><br>
			<button class="btn" value="결제하기" onclick="payment()">결제하기</button>
       	</div>
		
		<br/><br/><br/><br/>
		
		
		<!-- 
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
			
			 -->
		</div>
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