<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">

	function loginMember() {
		var id = $('#memberId').val();
		var pw = $('#memberPassword').val();
		if(id == "") {
			alert("아이디를 입력해주세요.")
		} else if(pw == ""){
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
						alert(id + "님 로그인성공!");
						location="main.do";
					} else {
						alert("아이디나 비밀번호를 확인해 주세요.");
					}
				}
			})
		}		
	}
	
	function loginEmployee() {
		var no = $('#employeeNo').val();
		var pw = $('#employeePassword').val();
		if(no == ""){
			alert("아이디를 입력해 주세요.")
		} else if(pw == "") {
			alert("비밀번호를 입력해 주세요.")
		} else {
			$.ajax({
				url: 'loginEmployee.do',
				type: 'POST',
				data: {
					employeeNo:no,
					employeePassword:pw
					},
				datatype: 'JSON',
				success: function (data) {
					if(data == 1){
						alert(no + "님 로그인성공!");
						location="main.do";
					} else {
						alert("아이디나 비밀번호를 확인해 주세요.");
					}
				}
			})			
		}
	}
</script>
<title>로그인</title>
</head>
<body>
<div class="jumbotron text-center" style="margin-bottom:0">
  <h1>Pet In Delight</h1>
  <p>강병준 손혁준 이현동 최재선</p> 
</div>
<div class="container mt-3">
  <h1>로그인</h1>
  <br>
  <!-- Nav tabs -->
  <ul class="nav nav-tabs">
    <li class="nav-item">
      <a class="nav-link active" data-toggle="tab" href="#memberLogin">일반 로그인</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="tab" href="#employeeLogin">직원 로그인</a>
    </li>   
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
    <div id="memberLogin" class="container tab-pane active"><br>
      <h3>일반 로그인</h3>
       <div>
            <label for="memberId">아이디</label>
            <input type="text" id="memberId" name="memberId" placeholder="아이디 입력해주세요" >
        </div>
        <div class="form-group">
            <label for="memberPassword">비밀번호</label>
            <input type="password" id="memberPassword" name="memberPassword" placeholder="비밀번호 입력해주세요" >
        </div>
        <input type="button" class="btn" onclick="loginMember()" value="로그인"/>
        <button type="button" class="btn" onclick="location.href='signUp.do'">회원 가입</button><br><br>
        
        <a href="findMemberId.do">아이디 찾기</a> / <a href="findMemberPassword.do">비밀번호 찾기</a>
    </div>
    <div id="employeeLogin" class="container tab-pane fade"><br>
      <h3>직원 로그인</h3>
       <div>
            <label for="employeeNo">직원 아이디</label>
            <input type="text" id="employeeNo" name="employeeNo" placeholder="아이디 입력해주세요" >
        </div>
        <div class="form-group">
            <label for="employeePassword">비밀번호</label>
            <input type="password" id="employeePassword" name="employeePassword" placeholder="비밀번호 입력해주세요" >
        </div>
        <input type="button" class="btn" onclick="loginEmployee()" value="로그인"/>        
    </div>   
  </div>
</div>
<div class="jumbotron text-center" style="margin-bottom:0">
  <p>Pet In Delight</p>
</div>    
</body>
</html>