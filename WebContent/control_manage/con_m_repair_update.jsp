<%@page import="bean.DB"%>
<%@page import="java.sql.Date"%>
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
		String dno=request.getParameter("dno");
		String stime=request.getParameter("rsubtime");
		Date rsubtime=Date.valueOf(stime);
		
		String action=request.getParameter("action");
		DB db=new DB();
		boolean s=false;
		if(action.equals("update"))
		{
			String time=request.getParameter("date");
			Date rsolvetime=Date.valueOf(time);
			s=db.repair_solvetime_update(dno,rsolvetime,rsubtime);
			

		}
		else if(action.equals("setnull"))
		{
			s=db.repair_solvetime_update(dno,null,rsubtime);
		}
		db.db_close();
		if(s)
		{
	    	out.println("<script type='text/javascript' language='javascript'>");
	    	out.println("alert('更新成功')");
	    	out.println("window.location='con_m_repair.jsp'");
	    	out.println("</script>");
		}
		else
		{
	    	out.println("<script type='text/javascript' language='javascript'>");
	    	out.println("alert('更新失败')");
	    	out.println("window.location='con_m_repair.jsp'");
	    	out.println("</script>");
		}
		//out.print(dno+time);
		
		
		

	%>
</body>
</html>