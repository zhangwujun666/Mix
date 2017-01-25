<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
	<%
		String sno=request.getParameter("sno");
		String tel=request.getParameter("tel");
		
	%>
	<form action="personal_tel_reset" method="get">
		输入新手机号:
		<input type="text" value="<%=tel %>" name="tel">
		<input type="hidden" value="<%=sno %>" name="sno">
		
		<input type="submit" value="确定">
	</form>
	
	<a href="personal?sno=<%=sno %>">返回</a><br><br>
	
	</center>
</body>
</html>