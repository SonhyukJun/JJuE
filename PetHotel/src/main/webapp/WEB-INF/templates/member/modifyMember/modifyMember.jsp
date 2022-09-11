<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		
		const url = "http://localhost:8080/PetHotel/modifyMemberPassword.do";
		window.open(url, "비밀번호 변경", windowStatus);		
	}
	function modifyMemberNickname() {
		var width = 600;
		var height = 600;
		
		var left = (window.screen.width/2) - (width/2);
		var top = (window.screen.height / 4);
		
		var windowStatus = 'width='+width+', height='+height+', left='+left+', top='+top+', scrollbars=yes, status=yes, resizable=yes, titlebar=yes';
		
		const url = "http://localhost:8080/PetHotel/modifyMemberNickname.do";
		window.open(url, "닉네임 변경", windowStatus);		
	}
	function modifyMemberTelNumber() {
		var width = 600;
		var height = 600;
		
		var left = (window.screen.width/2) - (width/2);
		var top = (window.screen.height / 4);
		
		var windowStatus = 'width='+width+', height='+height+', left='+left+', top='+top+', scrollbars=yes, status=yes, resizable=yes, titlebar=yes';
		
		const url = "http://localhost:8080/PetHotel/modifyMemberTelNumber.do";
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
<a href="javascript:modifyMemberPassword()">비밀번호 변경</a><br>
<a href="javascript:modifyMemberNickname()">닉네임 변경</a><br>
<a href="">주소 변경</a><br>
<a href="javascript:modifyMemberTelNumber()">전화번호 변경</a><br>
</body>
</html>