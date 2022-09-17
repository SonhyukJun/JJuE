<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resource/static/css/star.css" rel="stylesheet"/>
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	
	function star() {
		var a = $('input[name="reviewStar"]:checked').val();
		alert(a)		
	}
</script>
</head>
<body>
<form class="mb-3" name="myform" id="myform" method="post">
	<fieldset>
		<span class="text-bold">별점을 선택해주세요</span>
		<input type="radio" name="reviewStar" value="5" onclick="star5()" id="rate1"><label
			for="rate1">🐾</label>
		<input type="radio" name="reviewStar" value="4" id="rate2"><label
			for="rate2">🐾</label>
		<input type="radio" name="reviewStar" value="3" id="rate3"><label
			for="rate3">🐾</label>
		<input type="radio" name="reviewStar" value="2" id="rate4"><label
			for="rate4">🐾</label>
		<input type="radio" name="reviewStar" value="1" id="rate5" checked="checked"><label
			for="rate5">🐾</label>
		<input type="button" onclick="star()" value="dddd"/>
	</fieldset>
</form>
</body>
</html>