<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("UTF-8");

String color = request.getParameter("color");
String font = request.getParameter("font");

if(color==null || color.length()==0) color="black";
if(font==null || font.length()==0) font="Verdana";
%>
<!DOCTYPE html>
<html>

<style type= "text/css">
	span {
		font-size: 2em;
		color: <%=color%>;
		font-family: <%=font%>;
	}
</style>
<head>
<meta charset="UTF-8">
<title>ResponseUse.jsp</title>
</head>
<body>
	<h2>Request 객체와 Scripting Element 응용하기</h2>
	
	<h3>HTML 안에서 스크립팅 요소 사용하기</h3>
	<% for(int i=1; i<=6; i++){ %>
		<h<%=i %>>제목<%=i %>입니다.</h<%=i %>>
	
	<% } %>
	
	<h3>숫자를 입력후 버튼을 눌러수제요</h3>
	<form>
		<input type="text" name="counter"/>
		<input type="submit" value="이미지카운터" />
	
	</form>
	<%
	String counter=request.getParameter("counter");
	if(counter!=null){
		char[] ch=counter.toCharArray();
		for(int i=0; i<ch.length; i++){
	%>
		<img src="../images/num_<%=ch[i] %>.gif" 
				alt="<%=ch[i] %>번 이미지" />
	<%
		}
	}
	
	%>
		<h2>CSS안에서 스크립팅 요소 사용하기</h2>
		<span>CSS 적용한 텍스트</span>
		<form method="post">
			[글자색]
			<select name="color" >
				<option value="red">빨간색</option>
				<option value="blue">파란색</option>
				<option value="green">녹색</option>
			</select>
			[글꼴]
			<select name="font">
				<option value="굴림체">굴림체</option>
				<option value="바탕체">바탕체</option>
				<option value="휴먼옛체">휴먼옛체</option>
			</select>
			<input type="submit" value="폰트&색상변경" />
		</form>
		
	</%>
</body>
</html>