<%@page import="bean.dormitory_bean"%>
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
		String aid=(String)session.getAttribute("aid");//request.getParameter("aid");
		out.print("<h5>Welcome,"+aid+"</h5><br>");
		
		ArrayList<dormitory_bean> accept_info=(ArrayList<dormitory_bean>)session.getAttribute("we_info");
		out.print("<form action='control_manage/con_m_we_update.jsp?action=water' method='post'>");
		out.print("<br>");
		out.print("<table border=1 width=520 height=100>");
	    out.print("<tr>");
	    out.print("<td bgcolor=#FFD700>宿舍号</td>");
	    out.print("<td bgcolor=#FFD700>水费</td>");
	    out.print("<td bgcolor=#FFD700>水费更新</td>");
	    out.print("</tr>");
	    
	    ArrayList<String> d_list_w=new ArrayList<String>();
	    
	    for(int i=0;i<accept_info.size();i++)
	    {
	    	String dno=accept_info.get(i).getDno();
	    	double dwater=accept_info.get(i).getDwater();
	    	
	    	d_list_w.add(i,dno);
	    	
	    	out.print("<tr>");
		    out.print("<td bgcolor=#00FF7F>"+dno+"</td>");
		    out.print("<td bgcolor=#00FF7F>"+dwater+"</td>");
		    %>	    
		    <td bgcolor=#00FF7F> <input type="text" name="upwater" id="dwater<%=i %>"> </td>	<!-- action判断是否数字 -->
		    <%
			
	    }
	    session.setAttribute("d_list_w",d_list_w);
	    out.print("<br>");
	    out.print("<input type='submit' name='提 交'/>");
	    
	    out.print("</form>");
	%>
	<a href="view_manager_home.jsp">返回</a>
	</center>
</body>
</html>