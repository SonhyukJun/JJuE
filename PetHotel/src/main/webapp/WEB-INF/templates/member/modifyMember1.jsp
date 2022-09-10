<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	function memberNickname_check() {
		var nickname = $('#memberNickname').val();
		$.ajax({
			url: 'memberNickname_check1.do',
			type: 'POST',
			data: {memberNickname:nickname},
			datatype: 'JSON',
			success: function (data) {
				if(data == 0){
					alert("사용할 수 있는 닉네임입니다.");
					$('#nickname_check').html('V<br>');
    	    	  	$('#nickname_check').attr('color', '#199894b3');
				} else {
					alert("중복된 닉네임이 존재합니다.");
					$('#nickname_check').html('X<br>');
    	    	  	$('#nickname_check').attr('color', '#f82a2aa3');  
				}
			}
		})
	}	
	$(function(){
    	$('#memberPassword').keyup(function(){
	      	$('#password_check').html('');
    	});
   		$('#memberCheckPassword').keyup(function(){
        	if($('#memberPassword').val() != $('#memberCheckPassword').val()){
		    	$('#password_check').html('비밀번호 일치하지 않음<br>');
	        	$('#password_check').attr('color', '#f82a2aa3');	
	        } else{
	          	$('#password_check').html('비밀번호 일치함<br>');
    	      	$('#password_check').attr('color', '#199894b3');
	        }
    	});
	});
	
	function memberTelNumber_check() {
		var telnumber = $('#memberFirstNumber').val() + $('#memberMiddleNumber').val() + $('#memberLastNumber').val();
		$.ajax({
			url: 'memberTelNumber_check.do',
			type: 'POST',
			data: {memberTelNumber:telnumber},
			datatype: 'JSON',
			success: function (data) {
				if(data == 0){
					alert("사용할 수 있는 전화번호 입니다.");
					$('#telNumber_check').html('V<br>');
	    	      	$('#telNumber_check').attr('color', '#199894b3');  
				} else {
					alert("중복된 전화번호 입니다.");
				}
			}
		})
	}
	
	function modifyMember() {
		var id = $('#memberId').val();
		var password = $('#memberPassword').val();
		var checkpassword = $('#memberCheckPassword').val();
		var nickname = $('#memberNickname').val();
		var address = $('#memberAddress').val();
		var telnumber = $('#memberFirstNumber').val() + $('#memberMiddleNumber').val() + $('#memberLastNumber').val();
		if(password ==""){
			alert("비밀번호를 입력해주세요")
		} else if(checkpassword == "") {
			alert("비밀번호 확인이 필요합니다.")
		} else if(nickname==""){
			alert("닉네임을 입력해주세요")
		} else if(address == "") {
			alert("주소를 입력해 주세요")
		} else if(telnumber == ""){
			alert("전화번호를 입력해 주세요")
		} else {
		$.ajax({
			url: 'modifyMember.do',
			type: 'POST',
			data: {
				memberId:id,
				memberPassword:password,
				memberCheckPassword:checkpassword,
				memberNickname:nickname,
				memberAddress:address,
				memberTelNumber:telnumber
			},
			datatype: 'JSON',
			success: function (data) {
				if(data == "ok") {
					alert("정보 수정 성공!");
					location='selectMember.do'
				} else if(data == "nick"){
					alert("닉네임 중복 확인");
				}
			}
		})
		}
	}
</script>
<title>개인 정보 수정</title>
</head>
<body>
<% 
	String memberId = (String) session.getAttribute("SessionMemberId");
	String memberNickname = (String) session.getAttribute("SessionMemberNickname");
	System.out.println(memberId);
	System.out.println(memberNickname);	
%>
<h1>개인 정보 수정</h1>
<div class="container" style="width:400px">
        <div class="form-group">
            <label for="memberId">아이디</label>
            <input type="hidden" id="memberId" name="memberId" value="${memberSelect.memberId }" />
            <a>${memberSelect.memberId}</a>
        </div>
        <div class="form-group">
            <label for="memberPassword">변경할 비밀번호</label>
            <input type="password" id="memberPassword" name="memberPassword" placeholder="비밀번호">
        </div>
        
        <div class="form-group">
            <label for="memberCheckPassword">비밀번호 확인</label>
            <input type="password" id="memberCheckPassword" name="memberCheckPassword" placeholder="비밀번호 확인">
            <br>
            <font id="password_check" size="2"></font>
        </div>
               
        <div class="form-group">
            <label for="memberName">이름</label>
            <a id="memberName">${memberSelect.memberName}</a>
        </div>
       	<div class="form-group">
            <label for="memberNickname">닉네임</label>
            <input type="text" id="memberNickname" name="memberNickname" value="${memberSelect.memberNickname}"/>
            <input type="button" onclick="memberNickname_check()" value="닉네임 중복 체크"/>
            <font id="nickname_check" size="2"></font>
        </div>
        <div class="form-group">
            <label for="memberAddress">주소</label>
            <input type="text" id="memberAddress" name="memberAddress" value="${memberSelect.memberAddress}"/>
        </div>
        <div class="form-group">
        	<c:set var="telnumber" value="${memberSelect.memberTelNumber}"/>
        	<c:set var="memberFirstNumber" value="${fn:substring(telnumber,0,3)}"/>
        	<c:set var="memberMiddleNumber" value="${fn:substring(telnumber,3,7)}"/>
        	<c:set var="memberLastNumber" value="${fn:substring(telnumber,7,11)}"/>
            <label for="memberFirstNumber">전화번호</label>
            <select id="memberFirstNumber" name="memberFirstNumber" >
            	<option value="${memberFirstNumber}">${memberFirstNumber}</option>
            	<option value="010">010</option>
            	<option value="011">011</option>
            	<option value="016">016</option>
            	<option value="017">017</option>
            	<option value="019">019</option>
            </select>
            -
            <input type="text" style="width:30px" maxlength="4" id="memberMiddleNumber" name="memberMiddleNumber" value="${memberMiddleNumber}">
            -
            <input type="text" style="width:30px" maxlength="4" id="memberLastNumber" name="memberLastNumber" value="${memberLastNumber}" >
            <input type="button" onclick="memberTelNumber_check()" value="전화번호 중복 체크"/>
            <font id="telNumber_check" size="2"></font>
        </div>  
        
        <input type="button" id="modifyMember" onclick="modifyMember()" value="수정"/>
        <button type="button" onclick="location.href='login.do'">뒤로 가기</button>
    </div>     

</body>
</html>