<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
	include 지시어 : 공통으로 사용할 jsp파일을 생성한후
		현재문서에 포함시킬때 사용한다. 각각의 jsp파일 상단에는
		반드시 page지시어(Directive)가 삽입되어야한다. 
		※단 하나의 jsp파일에는 page지시어가 중복되어서는 안된다. 
--%>    
<%@ include file = "IncludePage.jsp" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IncludeMain.jsp</title>
<!-- CSS코드는 양이 많으므로 외부파일로 선언하여 현재문서에 링크시킨다.  -->
<link rel="stylesheet" href="./css/div_layout.css" />
</head>
<body>
<div class="AllWrap">
	<div class="header">
		<!-- GNB(Global Navigation Bar)영역 - 전체공통메뉴 -->
		<%@ include file="../common/Top.jsp" %>
	</div>
	<div class="body">
		<div class="left_menu">
			<!-- LNB(Local Navigation Bar)영역 - 로컬메뉴  -->
			<%@ include file="../common/Left.jsp" %>
		</div>
		<div class="contents">
			<!-- Contents 영역-->		
			<%-- 
			해당 변수는 외부파일에 선언하여 본 문서에 include처리되었다. 
			include는 문서자체를 포함시키는 개념이므로 에러가 발생하지
			않는다. 
			--%>
			<h2>오늘의날짜 : <%=todayStr %></h2>
			<br /><br />		
		
			신문기사를 삽입하세요.
			
			<br /><br />
		</div>
	</div>
	<div class="copyright">
		<!-- Copyright -->
		<%@ include file="../common/Copyright.jsp" %>
	</div>
</div>
</body>
</html>