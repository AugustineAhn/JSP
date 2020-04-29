<%@page import="java.util.Date"%>
<%@page import="java.util.Collection"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <% 
 response.setHeader("Pragma", "no-cache");
 response.setHeader("cache-control", "no-cache");
 
 
 /* 
 파일다운로드 구현시 사용
 : 웹브라우져가 인식하지 못하는 MIME타입으로 설정하면
 웹브라우저는 파일다운로드 창을 통해 파일을 다운로드 시켜버린다.
 jpg와 같은 이미지 파일은 웹브라우저가 인식하는 MIME
 */
 //response.setContentType("cache-control", "no-cache");
 
 
 /* 
 응답헤더 추가/설정하기
 	add계열: 기존의 헤더명이 존재할 경우 기존의 값을 유지하면서
 		계속 추가한다. 없을 때에는 새롭게 생성한다.
 	set계열: 기존 헤더명이 존재할 경우 기존값이 변경된다.
 		없을 때는 새롭게 생성한다.
 */
 long time = new Date().getTime();
 System.out.println(time);
 response.setDateHeader("currentDate", time);
 
 SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd HH:mm");
 time = simple.parse("2017-12-31 10:30").getTime();
 System.out.println(time);
 response.addDateHeader("currentDate2", time);
 response.addIntHeader("numberOfCrew", 100);//새로운 헤더 추가
 
 response.setIntHeader("numberOfCrew", 99);//기존헤더 덮어쓰기(수정) - 99
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ResponseHeader.jsp</title>
</head>
<body>
	<h2>응답 헤더 정보 출력하기</h2>
	<%
	Collection<String> headerNames = response.getHeaderNames();
	
	for(String headerName : headerNames){
		String headerValue = response.getHeader(headerName);
	
	%>
	
		<li><%=headerName %> : <%=headerValue %></li>
	<% 
	}
	%>
	<h2>응답 헤더명 존재여부 확인하기</h2>
	<h3>currentDate 응답헤더명</h3>
	<%=response.containsHeader("currentDate") ?
			"존재함"  : "존재하지 않음" %>
			
	<h3>Content-type 응답헤더명</h3>
	<%=response.containsHeader("Content-type") ?
	 		"존재함"  : "존재하지 않음" %>
	
</body>
</html>