<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
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
//		String sno=new String(request.getParameter("sno").getBytes("ISO-8859-1"),"UTF-8");
//		String spass=new String(request.getParameter("spass").getBytes("ISO-8859-1"),"UTF-8");
		String sno=request.getParameter("sno");
		String spass=request.getParameter("spass");
		String status=null;
		
		HashMap<String,Object> accept_message=(HashMap<String,Object>)request.getAttribute("message_p_r");
		if( accept_message != null)
		{
			sno=(String)accept_message.get("sno");
			status=(String)accept_message.get("status");
		}
		
		
	%>
	<center>
	<form action="personal_pass_reset" method="post">
		<br>
		<input type="hidden" name="sno" value="<%=sno %>">
		请输入新密码:<input type="text" name="newpass"><br>
		确认密码:<input type="text" name="surepass"><br>
		<input type="submit" value="提交">
	</form>
	
	<a href="personal?sno=<%=sno %>">返回</a><br><br>
	
	<%
		if(status!=null)
		{
			out.print(status);
		}
	%>
	
	</center>
</body>
</html>