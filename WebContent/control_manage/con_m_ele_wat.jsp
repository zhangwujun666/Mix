<%@page import="bean.DB"%>
<%@page import="bean.dormitory_bean"%>
<%@page import="java.util.ArrayList"%>
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
		String w_e=request.getParameter("action");
		if(w_e==null)
		{
			w_e="not";
		}
	%>

	<%
		DB db=new DB();
		ArrayList<dormitory_bean> we_info=(ArrayList<dormitory_bean>) db.dormitory_w_e();
		
		session.setAttribute("we_info",we_info);
		
		if(w_e.equals("water"))
		{
			response.sendRedirect("../view_manager_water.jsp");
		}
		else if(w_e.equals("elector"))
		{
			response.sendRedirect("../view_manager_elector.jsp");
		}
		else
		{
			response.sendRedirect("../view_manager_home.jsp");
		}
	%>
</body>
</html>