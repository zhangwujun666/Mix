<%@page import="java.sql.Date"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
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
		String aid=request.getParameter("aid");
		String apass=request.getParameter("apass");
		
		DB db=new DB();
		String level=db.login_m(aid,apass);
		
		
		
		if(level==null)
		{
			//db.db_close();
	    	out.println("<script type='text/javascript' language='javascript'>");
	    	out.println("alert('错误')");
	    	out.println("window.location='view_index.jsp'");
	    	out.println("</script>");
		}
		else
		{
			session.setAttribute("aid",aid);
			session.setAttribute("level",level);
			//记录登录时间
			Date logintime=new Date(System.currentTimeMillis());
			db.logintime_update(aid,logintime);
			
//			request.getRequestDispatcher("../view_manager_home.jsp").forward(request, response);
			db.db_close();
			response.sendRedirect("../view_manager_home.jsp");
//			response.sendRedirect("view_manager_home.jsp");//
//			response.sendRedirect("../view_manager_home.jsp?aid="+aid+"&&level="+level);
		}
	%>
</body>
</html>