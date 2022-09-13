<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pid.members.service.MembersVO"%>
<!DOCTYPE html>
<% 
	String memberId = (String) session.getAttribute("SessionMemberId");
	System.out.println(memberId);
%>
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
	function loginMember() {
		var id = $('#memberId').val();
		var pw = $('#memberPassword').val();
		if(pw == ""){
			alert("비밀번호를 입력해주세요.")
		} else {
			$.ajax({
				url: 'loginMember.do',
				type: 'POST',
				data: {
					memberId:id,
					memberPassword:pw
					},
				datatype: 'JSON',
				success: function (data) {
					if(data == 1){
						alert("확인되셨습니다.");
						location="modifyMember.do";
					} else {
						alert("비밀번호를 확인해 주세요.");
					}
				}
			})			
		}		
	}
</script>
<title>수정 로그인</title>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<br><br><br>
<h1>수정화면 로그인</h1>
    <form>    
    	<input type="hidden" id="memberId" name="memberId" value="${SessionMemberId}">
        <div class="form-group">
            <label for="memberPassword">비밀번호</label>
            <input type="password" id="memberPassword" name="memberPassword" placeholder="비밀번호 입력해주세요" >
        </div>
        &nbsp;
        <input type="button" class="btn" onclick="loginMember()" value="확인"/>
    </form>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>