<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="resource/static/css/bootstrap.min.css" rel="stylesheet">
<link href="resource/static/css/font-awesome.min.css" rel="stylesheet">
<link href="resource/static/css/common.css" rel="stylesheet">
<link href="resource/static/css/custom-theme.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <!-- 
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
<title>Insert title here</title>
<style>
.btn{
	background-color: #FFA500;
	color: white;
}
.btn:hover{
	background-color: #FFA500;
	color: white;
}


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
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<br/><br/><br/><br/><br/>
<div class="a">
<div class="container">

	<div class="page-header">
            <h1>객실 예약하기</h1>
    </div>

        <table  class="table">

<div>
	<div align="center">
		<div>
			<img src="${pageContext.request.contextPath}/resource/img/${room.picturePath}" class="img-thumbnail" style="width:300px; height:300; ">
		</div>
	</div>
	<br/><br/>

		 <form id="reserve" action="detailreserve.do" method="post">
		 	<tr>
                <th  style="width: 500px" ><h3>ROOM ${room.roomNo}&nbsp;<br/></h3></th>
                <td><input type="hidden" name="roomNo" value="${room.roomNo}" readonly></td>
            </tr>
		    <tr>
                <th style="width: 100px">체크인</th>
                <td><input type="text" name="reserveStartDatee" style="width:90px;" value="<fmt:formatDate value="${reserve.reserveStartDate}" pattern="yyyy-MM-dd" />" readonly><br/></td>
            </tr>
            <tr>
           		<th style="width: 100px">체크아웃</th>
                <td><input type="text" name="reserveEndDatee" style="width:90px;" value="<fmt:formatDate value="${reserve.reserveEndDate}" pattern="yyyy-MM-dd" />" readonly><br/></td>
            </tr>
            <tr>
           		<th style="width: 100px">마리수</th>
                <td><input type="text" name="count" style="width:25px;" value="${reserve.count}" readonly><br/></td>
            </tr>
            <tr>
            	<th style="width: 100px">일수</th>
                <td> ${days} 박<br/></td>
            </tr>
            <tr>
            	<th style="width: 100px">가격</th>
                <td>${room.price}<br/><br/></td>
            </tr>
            
           <tr>
            	<th style="width: 100px">최대 마리수</th>
                <td> ${room.count}<br/><br/></td>
            </tr>
           </form>
       </table>

       	
       	<div align="right">
       		<h2>${days} 박 총 금액 : ${room.price * days}원&nbsp;<br/></h2><br>
       		 <input class="btn" type="submit" form="reserve" value="객실 예약하기">
       	</div>
       
   <!--     
    <div>
        <form id="reserve" action="detailreserve.do" method="post">    
		<input type="hidden" name="roomNo" value="${room.roomNo}">
		check in : <input type="text" name="reserveStartDatee" style="width:90px;" value="<fmt:formatDate value="${reserve.reserveStartDate}" pattern="yyyy-MM-dd" />" readonly>
		check out : <input type="text" name="reserveEndDatee" style="width:90px;" value="<fmt:formatDate value="${reserve.reserveEndDate}" pattern="yyyy-MM-dd" />" readonly>
		마리수 : <input type="text" name="count" style="width:25px;" value="${reserve.count}" readonly>
		&nbsp;&nbsp; ${days} 박
		</form>
	</div> 
	
</div>

<p>
	${room.roomNo}&nbsp;번실<br/>
	1박당&nbsp;:&nbsp;${room.price}<br/>
	최대 마리수&nbsp;:&nbsp;${room.count}<br/>
</p>

<h2>
	${days} 박 총 금액 : ${room.price * days}원
</h2>


<input type="submit" form="reserve" value="객실 예약하기">

-->


<br/><br/><br/><br/><br/>
</div>

</div>
<div id="footer" align="center">
<jsp:include page="../footer.jsp"></jsp:include>
</div>


</body>
</html>