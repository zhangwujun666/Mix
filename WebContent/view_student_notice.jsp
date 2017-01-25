<%@page import="java.util.Iterator"%>
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
<!-- 参考 -->
<!-- http://blog.csdn.net/xiazdong/article/details/6857515 -->
	<center>
	<h2>公告</h2>
	
	<table border="1" spacing="2" width=700 height=200> 
	<%!
	    int curPage = 1;
		public static final int PAGESIZE = 6; 
		int pageCount;
		
		int i=0;
	%>
	
	<%
		ArrayList<words_bean> words_info=(ArrayList<words_bean>)session.getAttribute("words_info");
		
		//分页
		int size = words_info.size();
        pageCount = (size%PAGESIZE==0)?(size/PAGESIZE):(size/PAGESIZE+1);  
        String tmp = request.getParameter("curPage");  
        if(tmp==null || Integer.parseInt(tmp)==0 )
        {  
            tmp="1";
        }  
        curPage = Integer.parseInt(tmp);  
        if(curPage>=pageCount) curPage = pageCount; 
        i=(curPage-1)*PAGESIZE+1;
        
        out.println(curPage);  
        int count = 0;  
        
	    out.print("<tr>");
	    out.print("<td bgcolor=#FFD700>公告时间</td>");
	    out.print("<td bgcolor=#FFD700>公告人</td>");
	    out.print("<td bgcolor=#FFD700>标题</td>");
	    out.print("<td bgcolor=#FFD700>查看</td>");
	    out.print("</tr>");
        
        do{ 
        	
            if(count>=PAGESIZE)break;
            
            
	    	Timestamp wtime=words_info.get(i).getWtime();
	    	String wid=words_info.get(i).getWid();
	    	String wtitle=words_info.get(i).getWtitle();
	    	String wcontext=words_info.get(i).getWcontext(); 
	    	
         	count++; 
         	
/* 		out.print("<table border=1 width=700 height=200>");
	    out.print("<tr>");
	    out.print("<td bgcolor=#FFD700>公告时间</td>");
	    out.print("<td bgcolor=#FFD700>公告人</td>");
	    out.print("<td bgcolor=#FFD700>标题</td>");
	    out.print("<td bgcolor=#FFD700>查看</td>");
	    out.print("</tr>");
	    
	    for(int i=0;i<words_info.size();i++)
	    {
	    	Timestamp wtime=words_info.get(i).getWtime();
	    	String wid=words_info.get(i).getWid();
	    	String wtitle=words_info.get(i).getWtitle();
	    	String wcontext=words_info.get(i).getWcontext();
	    	
		    out.print("<tr>");
	    	out.print("<td bgcolor=#00FF7F>"+wtime+"</td>");
	    	out.print("<td bgcolor=#00FF7F>"+wid+"</td>");
	    	out.print("<td bgcolor=#00FF7F>"+wtitle+"</td>");
	    	out.print("<td bgcolor=#00FF7F>"+wcontext+"</td>");
	    	out.print("</tr>");
	    }
    	out.print("</table><p>");  */
	%>
	<tr>  
        <td bgcolor="#00FF7F"><%=wtime%></td>  
        <td bgcolor="#00FF7F"><%=wid%></td>  
        <td bgcolor="#00FF7F"><%=wtitle%></td>  
        <!--  <td bgcolor="#00FF7F"><%=wcontext%></td> -->
        <td bgcolor="#00FF7F"><a href="notice_context?wtime=<%=wtime %>&&wid=<%=wid%>">查看</a></td>
    </tr> 
	
	
	<% 
		i++;
        }while(i<words_info.size());
        //}while( it1.hasNext() );  
	%>  
	
	</table>  
	<a href = "view_student_notice.jsp?curPage=1" >首页</a>
	<a href = "view_student_notice.jsp?curPage=<%=curPage-1%>" >上一页</a>  
	<a href = "view_student_notice.jsp?curPage=<%=curPage+1%>" >下一页</a>  
	<a href = "view_student_notice.jsp?curPage=<%=pageCount%>" >尾页</a>
	第<%=curPage%>页/共<%=pageCount%>页 
	
	</center>
</body>
</html>