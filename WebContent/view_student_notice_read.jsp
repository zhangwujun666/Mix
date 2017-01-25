<%@page import="java.sql.Timestamp"%>
<%@page import="bean.words_bean"%>
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
	<%
		ArrayList<words_bean> context_msg=(ArrayList<words_bean>)session.getAttribute("context_info");
		Timestamp time=context_msg.get(0).getWtime();
		String id=context_msg.get(0).getWid();
		String title=context_msg.get(0).getWtitle();
		String context=context_msg.get(0).getWcontext();
		
/* 		out.print("<table border=1 width=700 height=200>");
		out.print("<tr>");
		out.print("<td bgcolor=#FFD700>"+title+"</td>");
		out.print("</tr>");
		
		out.print("<tr>");
		out.print("<td bgcolor=#FFD700>"+time+"</td>");
		out.print("<td bgcolor=#FFD700>"+id+"</td>");
		out.print("</tr>");
		
		out.print("<tr>");
		out.print("<td bgcolor=#FFD700>"+context+"</td>");
		out.print("</tr>");
		out.print("</table>"); */
		out.print("<h2><b>"+title+"</b></h2>");
		out.print("<br>");
		out.print("<h5>时间:"+time+"</h5>");
		out.print("&nbsp;&nbsp;");
		out.print("<h5>发表人:"+id+"</h5>");
		out.print("<br>");
		out.print("<br>");
		out.print("<h3>"+context+"</h3>");
		out.print("<br>");
		
	%>
	<br>
	<a href="view_student_notice.jsp">返回</a>
	
	</center>
</body>
</html>