<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="bean.dormitory_bean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	function getvalue(value)
	{
	 var d=value;
	 var a;
	 a=window.prompt("请输入分数","NULL");
	 window.location.href="control_manage/con_m_health_update.jsp?action=one&&score="+a+"&&dno="+d;
	}

</script>

</head>
<body>
	
	<%
		//request.getAttribute();
		String aid=(String)session.getAttribute("aid");//request.getParameter("aid");
		
		out.print("<h5>Welcome,"+aid+"</h5><br>");
		out.print("<center>");
		ArrayList<dormitory_bean> accept_info=(ArrayList<dormitory_bean>)session.getAttribute("score_info");
		
		out.print("<form action='control_manage/con_m_health_update.jsp?action=all' method='post'>");
		
		out.print("<table border=1 width=520 height=100>");
	    out.print("<tr>");
	    out.print("<td bgcolor=#FFD700>宿舍号</td>");
	    out.print("<td bgcolor=#FFD700>分数</td>");
	    out.print("<td bgcolor=#FFD700>批量更新</td>");
	    out.print("<td bgcolor=#FFD700>单个更新</td>");
	    out.print("</tr>");
	    
	    //Map<String,String> dno_list=new HashMap<String,String>();//批量传dno
	    ArrayList<String> d_list=new ArrayList<String>();
	    
		for(int i=0;i<accept_info.size();i++)
		{
			String dno=accept_info.get(i).getDno();
			int dscore=accept_info.get(i).getDscore();
			
			d_list.add(i,dno);
			
			out.print("<tr>");
		    out.print("<td bgcolor=#00FF7F>"+dno+"</td>");
		    out.print("<td bgcolor=#00FF7F>"+dscore+"</td>");
		    %>	    
		    <td bgcolor=#00FF7F> <input type="text" name="upscore" id="socre<%=i %>"> </td>	<!-- action判断是否数字 -->
		    <%
//		    out.print("<td bgcolor=#00FF7F> <a href='con_m_health_update.jsp?action=one&&dno="+dno+"&&newscore='>修改</a> </td>");
		    out.print("<td bgcolor=#00FF7F> <input type='button' name='"+dno+"' value='点击输入' onClick='getvalue(this.name)'> </td>");
		}
		session.setAttribute("d_list",d_list);
		out.print("<br>");
		out.print("<input type='submit' name='提 交'/>");
		
		out.print("</form>");
	%>
	<a href="view_manager_home.jsp">返回</a>
	</center>
</body>
</html>