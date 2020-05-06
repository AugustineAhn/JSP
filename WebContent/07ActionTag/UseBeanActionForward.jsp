<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UseBeanActionForward.jsp</title>
</head>
<body>
	<h2>포워드 된 페이지입니다.</h2>
	
	<h2>자바코드를 통해 영역의 객체얻기</h2>
	<%
	MemberDTO memberJ = (MemberDTO)request.getAttribute("member");
	%>
	
	<h3>자바코드로 출력하기</h3>
	<ul>
		<li>아이디: <%=memberJ.getId() %></li>
		<li>패스워드: <%=memberJ.getPass() %></li>
		<li>이름: <%=memberJ.getName() %></li>
	</ul>
	
	<h2>액션태그로 영역의 객체 얻기</h2>
	<!-- 
	자바코드를 통해
	 -->
	<jsp:useBean id="member" class="model.MemberDTO" scope="request" />
	
	<h2>액션태그로 출력하기</h2>
	<ul>
		<li>아이디:
		<jsp:getProperty property="id" name="member" />
		</li>
		<li>패스워드:
		<jsp:getProperty property="pass" name="member" />
		</li>
		<li>이름:
		<jsp:getProperty property="name" name="member" />
		</li>
	</ul>
</body>
</html>