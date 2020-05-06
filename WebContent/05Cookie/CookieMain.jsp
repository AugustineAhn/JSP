<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타이틀</title>
</head>
<body>
	<h2>쿠키 (Cookie)</h2>
	<h3>쿠키 설정</h3>
	
	<%
	Cookie cookie = new Cookie("UserID", "KOSMO");
	
	System.out.println("rerquest.getContextPath()"
				+ request.getContextPath());
	
	cookie.setPath(request.getContextPath());
	
	cookie.setMaxAge(3600);
	
	response.addCookie(cookie);
	%>
	<h2>쿠키를 설정하는 현재페이지에서 쿠키값 확인하기</h2>
	<%
	
	/* 쿠키는 첫 실행시에는 출력되지 않는다. 이유는 클라이언트 측으로 응답헤더를 
	통해 전송되는 생성은 되었으나, 서버측으로 다시 응답헤더를 
	통해 전송해야지만 확인이 가능하기때문
	즉, 새로고침이나 다른페이지로 요청이 있을 씨 쿠키를 확일할 수 있다.*/
	Cookie[] cookies = request.getCookies();
	if(cookies!= null){
		
		for(Cookie c : cookies){
			String cookieName = c.getName();
			String cookieValue = c.getValue();
			
			out.println(String.format("%s : %s<br/>",
					cookieName, cookieValue));
		}
	}	
	
	%>
	<h2>페이지 이동후 쿠키값 확인하기</h2>
	<a href="CookieResult.jsp">
		쿠키값 다음 페이지에서 확인하기
	</a>
</body>
</html>