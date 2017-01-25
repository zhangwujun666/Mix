<%@page import="java.sql.Date"%>
<%@page import="java.util.HashMap"%>
<%@page import="bean.student_bean"%>
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
	<%
		HashMap<String,Object> accept_message=(HashMap<String,Object>)request.getAttribute("sendMessage_p");
		String sno=(String)accept_message.get("sno");
		String status;
		//修改成功，从personal发来
//		if( ((String)accept_message.get("status")) != null )	
//		{
//			status=(String)accept_message.get("status");
//		}
		status=(String)accept_message.get("status");
/*  		HashMap<String,Object> accept_pass_set=(HashMap<String,Object>)request.getAttribute("message_p_r");
		if( accept_pass_set != null)
		{
			sno=(String)accept_pass_set.get("sno");
			status=(String)accept_pass_set.get("status");
		} */
		
		ArrayList<student_bean> student_info=(ArrayList<student_bean>)accept_message.get("student_info");
		String sname=student_info.get(0).getSname();//姓名
		String sex=student_info.get(0).getSex();//性别
		String spec=student_info.get(0).getSpec();//专业
		Date intime=student_info.get(0).getIntime();//入住时间
		String tel=student_info.get(0).getTel();//联系方式(可改)
		String spass=student_info.get(0).getSpass();//密码(可改)
		String dno=student_info.get(0).getDno();//宿舍号
		
		out.print("<table border=1 width=380 height=650>");
		
		out.print("<tr>");
		out.print("<td bgcolor=#FFD700>学号</td>");
		out.print("<td bgcolor=#00FF7F>"+sno+"</td>");
		out.print("<td bgcolor=#00FF7F>"+"</td>");
		out.print("</tr>");
		
		out.print("<tr>");
		out.print("<td bgcolor=#FFD700>姓名</td>");
		out.print("<td bgcolor=#00FF7F>"+sname+"</td>");
		out.print("<td bgcolor=#00FF7F>"+"</td>");
		out.print("</tr>");
		
		out.print("<tr>");
		out.print("<td bgcolor=#FFD700>宿舍号</td>");
		out.print("<td bgcolor=#00FF7F>"+dno+"</td>");
		out.print("<td bgcolor=#00FF7F>"+"</td>");
		out.print("</tr>");
		
		out.print("<tr>");
		out.print("<td bgcolor=#FFD700>性别</td>");
		out.print("<td bgcolor=#00FF7F>"+sex+"</td>");
		out.print("<td bgcolor=#00FF7F>"+"</td>");
		out.print("</tr>");
		
		out.print("<tr>");
		out.print("<td bgcolor=#FFD700>专业</td>");
		out.print("<td bgcolor=#00FF7F>"+spec+"</td>");
		out.print("<td bgcolor=#00FF7F>"+"</td>");
		out.print("</tr>");
		
		out.print("<tr>");
		out.print("<td bgcolor=#FFD700>联系方式</td>");
		out.print("<td bgcolor=#00FF7F>"+tel+"</td>");
		out.print("<td bgcolor=#00FF7F>"+"<a href='view_student_tel_reset.jsp?sno="+sno+"&&tel="+tel+"'>修改</a>"+"</td>");
		out.print("</tr>");
		
		out.print("<tr>");
		out.print("<td bgcolor=#FFD700>密码</td>");
		out.print("<td bgcolor=#00FF7F>"+spass+"</td>");
		out.print("<td bgcolor=#00FF7F>"+"<a href='view_student_pass_reset.jsp?sno="+sno+"&&spass="+spass+"'>修改</a></td>");
		out.print("</tr>");
		
		out.print("<br><br>");
		
/* 		if(status != null)
		{
			out.print(status);
		} */
	%>
</body>
</html>