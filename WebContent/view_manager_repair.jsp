<%@page import="java.sql.Date"%>
<%@page import="bean.repair_bean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
	<h3>报修管理处</h3><br>
	<%
		String aid=(String)session.getAttribute("aid");//request.getParameter("aid");
		
		out.print("<h5>Welcome,"+aid+"</h5><br>");
		ArrayList<repair_bean> accept_info=(ArrayList<repair_bean>)session.getAttribute("repair_info");
		
		out.print("<table border=1 width=600 height=100>");
	    out.print("<tr>");
	    out.print("<td bgcolor=#FFD700>宿舍号</td>");
	    out.print("<td bgcolor=#FFD700>提交时间</td>");
	    out.print("<td bgcolor=#FFD700>报修信息</td>");
	    out.print("<td bgcolor=#FFD700>解决日期</td>");
	    out.print("<td bgcolor=#FFD700>更新信息</td>");
	    out.print("<td bgcolor=#FFD700>清除更新</td>");
	    out.print("</tr>");
	    
	    for(int i=0;i<accept_info.size();i++)
	    {
	    	String dno=accept_info.get(i).getDno();
	    	Date rsubtime=accept_info.get(i).getRsubtime();
	    	String rdetail=accept_info.get(i).getRdetail();
	    	Date rsolvetime=accept_info.get(i).getRsolvetime();
		    
	    	out.print("<tr>");
		    out.print("<td bgcolor=#00FF7F>"+dno+"</td>");
		    out.print("<td bgcolor=#00FF7F>"+rsubtime+"</td>");
		    out.print("<td bgcolor=#00FF7F>"+rdetail+"</td>");
		    out.print("<td bgcolor=#00FF7F>"+rsolvetime+"</td>");
		    out.print("<td bgcolor=#00FF7F> <a href='view_manager_repair_update.jsp?dno="+dno+"&&rsubtime="+rsubtime+"&&rdetail="+rdetail+"&&action=update'>修改这条</a> </td>");
		    out.print("<td bgcolor=#00FF7F> <a href='view_manager_repair_update.jsp?dno="+dno+"&&rsubtime="+rsubtime+"&&action=setnull'>清除记录</a> </td>");
		    out.print("</tr>");
	    }
	%>
	<a href="view_manager_home.jsp">返回</a>
	</center>
</body>
</html>