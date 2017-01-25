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
		String dno=new String(request.getParameter("dno").getBytes("ISO-8859-1"),"UTF-8");
		String sno=new String(request.getParameter("sno").getBytes("ISO-8859-1"),"UTF-8");
	%>
	<center>
	<form action="repair_add" method="post">
		填写相关信息:<br>
		宿舍号:<%=dno %><br>
		<input type="hidden" name="dno" value="<%=dno %>">
		<input type="hidden" name="sno" value="<%=sno %>">
		<input type="text" value="填写内容" name="rdetail"><br>
		<input type="submit" value="提交"> 
	</form>
	</center>
</body>
</html>