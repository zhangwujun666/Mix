<%@page import="bean.dormitory_bean"%>
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
		HashMap<String,Object> accept_message=(HashMap<String,Object>)request.getAttribute("sendMessage_d");
		String sno=(String)accept_message.get("sno");
		String sname=(String)accept_message.get("sname");
	%>
	<h3>欢迎 <%=sname %></h3>
	<center>
	<%
	    out.print("<table border=1 width=700 height=200>");
	    out.print("<tr>");
	    out.print("<td bgcolor=#FFD700>宿舍号</td>");
	    out.print("<td bgcolor=#FFD700>宿舍地址</td>");
	    out.print("<td bgcolor=#FFD700>床位</td>");
	    out.print("<td bgcolor=#FFD700>卫生评分</td>");
	    out.print("<td bgcolor=#FFD700>水费</td>");
	    out.print("<td bgcolor=#FFD700>电费</td>");
	    
	    ArrayList<dormitory_bean> dormitory_info=(ArrayList<dormitory_bean>)accept_message.get("dormitory_info");
	    String dno=dormitory_info.get(0).getDno();
	    String daddress=dormitory_info.get(0).getDaddress();
	    int dbed=dormitory_info.get(0).getDbed();
	    int dscore=dormitory_info.get(0).getDscore();
	    double dwater=dormitory_info.get(0).getDwater();
	    double delector=dormitory_info.get(0).getDelector();
	    
	    out.print("<tr>");
    	out.print("<td bgcolor=#00FF7F>"+dno+"</td>");
    	out.print("<td bgcolor=#00FF7F>"+daddress+"</td>");
    	out.print("<td bgcolor=#00FF7F>"+dbed+"</td>");
    	out.print("<td bgcolor=#00FF7F>"+dscore+"</td>");
    	out.print("<td bgcolor=#00FF7F>"+dwater+"</td>");
    	out.print("<td bgcolor=#00FF7F>"+delector+"</td>");
    	
    	out.print("</tr>");
    	out.print("</table><p>"); 
		
	%>
	</center>
</body>
</html>