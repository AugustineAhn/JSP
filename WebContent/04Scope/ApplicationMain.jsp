<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>

<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%
/* 
application 영역에 속성 저장하기
- 어플리케이션 영역에 저장된 속성은 모든 JSP(Servlet) 페이지에서
	공유된다.
- 링크를 통해 새로운 페이지에 대한 요청이나, 포워드, 인클루드 등 모든 페이지에서 
	영역이 공유된다. 이런 페이지들은 하나의 웹어플리케이션
	내에 존재하기 때문이다.

*/
 java.util.Date myUtilDate = new java.util.Date();
System.out.println("myUtilDate=" + myUtilDate);

java.sql.Date mySqlDate = new Date(myUtilDate.getTime());
System.out.println("mySqlDate=" + mySqlDate);

MemberDTO first = new MemberDTO("Kim", "1111", "김길동", mySqlDate);
MemberDTO second = new MemberDTO("Park", "2222", "박길동", null);
MemberDTO third = new MemberDTO("Lee", "3333", "이길동", null);

//리스트 계열의 컬렉션에 DTO객체 저장(ArrayList와 사용법은 동일함)
List<MemberDTO> lists = new Vector<MemberDTO>();
//ArrayList<MemberDTO> lists = new ArrayList<MemberDTO>();
lists.add(first);
lists.add(second);
lists.add(third);

Map<String, MemberDTO> maps = new HashMap<String, MemberDTO>();
maps.put("member1", first);
maps.put("member2", second);
maps.put("member3", third);


application.setAttribute("lists", lists);
application.setAttribute("maps", maps);

pageContext.setAttribute("pageMember", first);
request.setAttribute("requestMember", first);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ApplicationMain.jsp</title>
</head>
<body>
	<h2>어플리케이션 영역의 공유</h2>
	
	<h3>사용자 클릭에 의한 이동</h3>
	<a href="ApplicationResult.jsp">사용자 클릭</a>
	
	<h3>포워드로 페이지 전달하기</h3>
	<% 
	/* request.getRequestDispatcher("ApplicationResult.jsp").
		forward(request, response);*/
	%>
	
	<!-- 
		외부파일 인클루드 
	 -->
	
	<!-- 외부파일 인클루드 -->
	<%@ include file= "ApplicationInclude.jsp" %>
	
</body>
</html>