<%@page import="java.sql.Date"%>
<%@page import="bean.repair_bean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
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
		HashMap<String,Object> accept_message=(HashMap<String,Object>)request.getAttribute("sendMessage_r");
		String sno=(String)accept_message.get("sno");
		String sname=(String)accept_message.get("sname");
		String dno=(String)accept_message.get("dno");
		
		String status=(String)accept_message.get("status");
	%>
	<h3>欢迎 <%=sname %></h3>
	
	<center>
	<% 
	    ArrayList<repair_bean> repair_info=(ArrayList<repair_bean>)accept_message.get("repair_info");
//	    String dno=repair_info.get(0).getDno();
	    out.print("宿舍号:"+dno);
	    
	    out.print("<table border=1 width=700 height=200>");
	    out.print("<tr>");
//	    out.print("<td bgcolor=#FFD700>宿舍号</td>");
	    out.print("<td bgcolor=#FFD700>提交时间</td>");
	    out.print("<td bgcolor=#FFD700>解决时间</td>");
	    out.print("<td bgcolor=#FFD700>内容</td>");
	    

	    for(int i=0;i<repair_info.size();i++)
	    {
//	    dno=repair_info.get(i).getDno();
	    Date rsubtime=repair_info.get(i).getRsubtime();
	    Date rsolvetime=repair_info.get(i).getRsolvetime();
	    String rdetail=repair_info.get(i).getRdetail();
	    
	    out.print("<tr>");
//    	out.print("<td bgcolor=#00FF7F>"+dno+"</td>");
    	out.print("<td bgcolor=#00FF7F>"+rsubtime+"</td>");
    	out.print("<td bgcolor=#00FF7F>"+rsolvetime+"</td>");
    	out.print("<td bgcolor=#00FF7F>"+rdetail+"</td>");
    	out.print("</tr>");
	    }
    	
    	out.print("</table><p>");
    	
    	out.print("<br>");
	%>
	
	<a href="view_student_repair_add.jsp?dno=<%=dno %>&&sno=<%=sno %>">新增报修</a>
	<br><br>
	
	<%
		if(status!=null)
		{
			out.print(status);
		}
	%>
	
	</center>
	
</body>
</html>