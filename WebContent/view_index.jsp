<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body background="image/" >
	
	<center>
	<h1>学生公寓管理系统</h1>
	
	
	<form action="login_s" method="post">
		学号	<input type="text" name="sno"><br>
		密码	<input type="text" name="spass"><br>
			<input type="submit" value="提交">
	</form>
	
	<form action="control_manage/con_m_login.jsp" method="post">
	工号	<input type="text" name="aid"><br>
	密码	<input type="text" name="apass"><br>
		<input type="submit" value="提交">
	</form>
	
	</center>
	
	
	
</body>
</html>