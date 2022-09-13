<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<head>
<meta charset="UTF-8">
<style>
.btn{
	background-color: #FFC846;
}
.btn:hover{
	background-color: #FFC846;
}

</style>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	function unSignUpMember() {
		var id = $('#memberId').val();
		var pw = $('#memberPassword').val();
		if(id == ""){
			alert("아이디를 입력해주세요.")
		} else if(pw == ""){
			alert("비밀번호를 입력해주세요.")
		} else {
			$.ajax({
				url: 'unSignUpMember.do',
				type: 'POST',
				data: {
					memberId:id,
					memberPassword:pw
					},
				datatype: 'JSON',
				success: function (data) {
					if(data == 1){
						alert("회원 탈퇴 성공");
						location.href = 'login.do';
					} else {
						alert("아이디나 비밀번호를 확인해 주세요.");
					}
				}
			})
		}			
	}
</script>
<title>회원 탈퇴</title>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<br><br><br>
<%-- <% 
	String memberId = (String) session.getAttribute("SessionMemberId");
	System.out.println(memberId);	
%> --%>

<h1>회원 탈퇴</h1>
<div class="container" style="width:400px">    
        <div class="form-group">
            <label for="memberId">아이디</label>
            <input type="text" id="memberId" name="memberId" placeholder="사용자 아이디">
        </div>       
       	 <div class="form-group">
            <label for="memberPassword">비밀번호</label>
            <input type="text" id="memberPassword" name="memberPassword" placeholder="사용자 비밀번호">
        </div>
        <button type="button" id="unSignUpMember" class="btn" onclick="unSignUpMember()">회원 탈퇴</button>
        <button type="button"class="btn"  onclick="location.href='selectMember.do'">뒤로 가기</button>
</div>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
