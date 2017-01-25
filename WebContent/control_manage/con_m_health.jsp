<%@page import="bean.dormitory_bean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.DB"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		
		//更新do(增加Admin表字段)
		
		
		//查询宿舍表(宿舍号，卫生评分)	批量录入
		DB db=new DB();
		ArrayList<dormitory_bean> score_info=(ArrayList<dormitory_bean>) db.dormitory_health();
		
		
		
		session.setAttribute("score_info",score_info);
		response.sendRedirect("../view_manager_health.jsp");
		
	%>
</body>
</html>