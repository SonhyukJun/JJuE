<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pid.members.service.MembersVO"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#footer { 
    overflow: hidden;
    position: absolute;
    bottom: 0; 
    height: 50px; width:100%; text-align: center;
    margin-left:0px; margin-bottom:-1px;
    color: #333;
    background-color: #fff;
    }
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
<br><br><br>
<a href="freeboard.do">자유게시판</a><br>
<a href="reviewBoardlist.do">후기게시판</a><br>
<a href="reserve.do">예약하러가기</a><br>
Body Form <br>
Body Form <br>
Body Form <br>
Body Form <br>
Body Form <br>
Body Form <br>
Body Form <br>
Body Form <br>

<div class="container">
  <p>Others:</p>
  <i class="fas fa-cloud"></i>
  <i class="fas fa-coffee"></i>
  <i class="fas fa-car"></i>
  <i class="fas fa-file"></i>
  <i class="fas fa-home"></i>
</div>
	<input type="button" class="fas fa-home" value="fas fa-home"/>
	<a href="#" ><i class="fas fa-home"/></a>
<div id="footer">
	<jsp:include page="footer.jsp"></jsp:include>
</div>
</body>  
</html>