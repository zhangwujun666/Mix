<%@page import="bean.repair_bean"%>
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
		DB db=new DB();
		ArrayList<repair_bean> repair_info=(ArrayList<repair_bean>) db.all_repair();
		
		session.setAttribute("repair_info",repair_info);
		response.sendRedirect("../view_manager_repair.jsp");
	%>
</body>
</html>