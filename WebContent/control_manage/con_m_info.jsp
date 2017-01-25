<%@page import="bean.dormitory_bean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.DB"%>
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
		String action=null;
		action=request.getParameter("action");
		if(action==null)
		{
			action="not";
		}
		
		DB db=new DB();
		ArrayList<dormitory_bean> dormitory_base_info=(ArrayList<dormitory_bean>)db.dormitory_base_info();
		session.setAttribute("dormitory_base_info",dormitory_base_info);
		db.db_close();
		
		if(action.equals("student"))
		{
			response.sendRedirect("../view_manager_info_add.jsp?action=student");
		}
		else if(action.equals("dormitory"))
		{
			response.sendRedirect("../view_manager_info_add.jsp?action=dormitory");
		}
		else
		{
	    	out.println("<script type='text/javascript' language='javascript'>");
	    	out.println("alert('失败')");
	    	out.println("window.location='../view_manager_home.jsp'");
	    	out.println("</script>");
		}
		
	%>
</body>
</html>