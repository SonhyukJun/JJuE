<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		error();
	});
	
	function error(){
		alert('작성자가 아닙니다')
		location.href = "freeboard.do"
	};
</script>
<title>Insert title here</title>
</head>
<body>
</body>
</html>