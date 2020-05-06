<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IncludeAction.jsp</title>
</head>
<body>
	<%
	String directivePath = "./include/DirectivePage.jsp";
	String actionTagPath = "./include/ActionTagPage.jsp";
	
	pageContext.setAttribute("pageVar", "페이지영역에 저장");
	request.setAttribute("requestVar", "리퀘스트영역에 저장");
	%>
	
	<h2>include 액션태그</h2>
	
	<h3>include지시어로 페이지 포함하기</h3>
	<%--  <%@ include file= "<%=directivePath %>" %> --%>
	<%@ include file="./include/DirectivePage.jsp" %>
	
	<h3>include 액션태그로 페이지 포함하기</h3>
	<jsp:include page="<%=actionTagPath %>" />
	<jsp:include page="./include/ActionTagPage.jsp" />
	
	<h2>각각의 포함된 페이지 안에서 선언한 변수 사용하기</h2>
	
	<h3>디렉티브 페이지에서 선언한 변수 사용</h3>
	변수출력: <%=dirString %>
	<h3>액션태그 페이지에서 선언한 변수 사용</h3>
	변수출력 : <%=actionString %>
</body>
</html>