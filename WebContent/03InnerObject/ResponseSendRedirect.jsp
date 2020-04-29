<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ResponseSendRedirect.jsp</title>
</head>
<body>
<%
//폼값받기
	String id = request.getParameter("user_id");
	String pwd = request.getParameter("user_pwd");

	if(id.equalsIgnoreCase("kosmo")&& pwd.equalsIgnoreCase("1234")){
		
		response.sendRedirect("../common/Welcome.jsp");
	}
	else {
	%>	<script>
		alert("아이디와 패스워드가 일치하지 않습니다.");
		history.go(-1);
		</script>
	<%
		response.sendRedirect("./ResponseMain.jsp");
	}
%>
</body>
</html>