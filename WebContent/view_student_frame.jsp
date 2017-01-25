<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
		//String name=new String(request.getParameter("").getBytes("IOS"),"UTF-8" );
		String sno=request.getParameter("sno");
	%>
	<h3>你的学号:<br><%=sno %></h3>
	<br><br>
	<a target="showframe" href="dormitory?sno=<%=sno %>">宿舍情况</a>
	<br><br><br>
	<a target="showframe" href="repair?sno=<%=sno %>">报修记录</a>
	<br><br><br>
	<a target="showframe" href="personal?sno=<%=sno %>">个人信息</a>
	<br><br><br>
	<a target="showframe" href="notice">查看公告</a>
</body>
</html>