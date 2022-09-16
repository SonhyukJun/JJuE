<%@page import="java.awt.print.Printable"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pid.members.service.MembersVO"%>
<!DOCTYPE html>
<html>
<link href="resource/static/css/bootstrap.min.css" rel="stylesheet">
<link href="resource/static/css/font-awesome.min.css" rel="stylesheet">
<link href="resource/static/css/common.css" rel="stylesheet">
<link href="resource/static/css/custom-theme.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
<style>
#asd:hover {
background: none;
}

#asd >a:hover {
background: none;
cursor: default;
}
.disable {
pointer-events: none;
cursor: default;
}
.navbar-flame{ 
    height: 9%;
}
</style>
<body>
<%
	String memberId = (String) session.getAttribute("SessionMemberId");
	String memberNickname = (String) session.getAttribute("SessionMemberNickname");
	String memberTelNumber = (String) session.getAttribute("SessionMemberTelNumber");
	String memberGrade = (String) session.getAttribute("SessionMemberGrade");
	
	MembersVO sessionMember = (MembersVO) session.getAttribute("SessionMember");

%>
	
	<div class="navbar navbar-flame navbar-fixed-top">
            <div class="navbar-header">
                 <a href="/PetInDeligth/login.do" class="navbar-brand" style="text-decoration:none;">          
                    <span style="vertical-align:middle;">
                    <img src="${pageContext.request.contextPath}/resource/img/ex1.png">
                    </span>
                </a>                
            </div>            
            <div class="collapse navbar-collapse" id="#myNavbar">
            	<ul class="nav navbar-nav navbar-right">
            		<br>
            		<li>
            			<a href="main.do">홈으로</a>
            		</li>
            		<li>
            			<a href="reserve.do">예약 하러가기</a>
            		</li>
            		<li>
            			<a href="reviewBoardlist.do">후기 게시판</a>
            		</li>
            		              
                	<li>
            			<a href="freeboard.do">QnA 게시판</a>
            		</li>
            		<%
                	if(memberId == null) {                
                %>      
                	<li>                       
                        <a href="login.do">LOGIN</a>
                    </li>
                    <li>
                		<a class="disable">&nbsp;&nbsp;&nbsp;&nbsp;</a>
                	</li>

                <%
                	} else if(memberGrade.equals("Admin")) {
                %>
                	
                	<li>
                		<a href="admin.do">관리 메뉴</a>
               		</li> 
                	<li>         
                   		<a href="logout.do">LOGOUT</a>
                   	</li>
                   	<li id="asd">
                		<a class="disable">${SessionMemberGrade}님 반갑습니다.</a>
                	<li>
                	<li>
                		<a class="disable">&nbsp;&nbsp;&nbsp;&nbsp;</a>
                	</li>
                <%	
                	} else {
                %>	 
                	<li>
                		<a href="reserveStatus.do">예약내역조회</a>
                	</li>                	
                	<li>
                		<a href="selectMember.do">개인정보조회</a>
                	</li> 
                	<li>         
                   		<a href="logout.do">LOGOUT</a>
                    </li>   
                    <li id="asd">
                		<a class="disable">${SessionMemberNickname}님 반갑습니다.</a>
                	</li>
                	<li>
                		<a class="disable">&nbsp;&nbsp;&nbsp;&nbsp;</a>
                	</li>

                <%
                	}
                %>
            	</ul>	
<%--                 <ul class="nav navbar-nav navbar-right">  
                	<br>              	
                <%
                	if(memberId == null) {                
                %>      
                	<li>                       
                        <a href="login.do">LOGIN</a>
                    </li>
                <%
                	} else if(memberGrade.equals("Admin")) {
                %>
                	<li id="asd">
                		<a class="disable">${SessionMemberGrade}님 반갑습니다.</a>
                	<li>
                	<li>
                		<a href="membersList.do">전체 회원 정보 조회</a>
               		</li> 
                	<li>         
                   		<a href="logout.do">LOGOUT</a>
                   	</li>
                <%	
                	} else {
                %>	
                	<li id="asd">
                		<a class="disable">${SessionMemberNickname}님 반갑습니다.</a>
                	</li>
                	<li>
                		<a href="selectMember.do">개인정보조회</a>
                	</li> 
                	<li>         
                   		<a href="logout.do">LOGOUT</a>
                    </li>           
                <%
                	}
                %>
                </ul> --%>
            </div>
    </div>
</body>
</html>