<%@page import="java.awt.print.Printable"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ph.service.MembersVO"%>
<!DOCTYPE html>
<html>
<body>
<%
	String memberId = (String) session.getAttribute("SessionMemberId");
	String memberNickname = (String) session.getAttribute("SessionMemberNickname");
	String memberTelNumber = (String) session.getAttribute("SessionMemberTelNumber");
	MembersVO sessionMember = (MembersVO) session.getAttribute("SessionMember");
%>

<div class="header">
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a href="/PetHotel/login.do" class="navbar-brand" style="text-decoration:none;">          
                    <span style="vertical-align:middle;">header </span>
                </a>
            </div>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                <%
                	if(memberId == null) {                
                %>      
                	<li>                       
                        <a href="login.do">LOGIN</a>
                    </li>
                <%
                	} else {
                %>	
                	<li>
                		<a>${SessionMemberNickname}님 반갑습니다.</a>
                	<li>
                	<li>
                		<a href="selectMember.do">개인정보조회</a>
                	</li> 
                	<li>         
                   		<a href="logout.do">LOGOUT</a>
                    </li>           
                <%
                	}
                %>
                </ul>
            </div>
        </div>
    </nav>
</div>
</body>
</html>