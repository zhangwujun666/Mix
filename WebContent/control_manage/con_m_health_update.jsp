<%@page import="bean.DB"%>
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
		//获取事件(one/all)
		String action=null;
		
	
		action=request.getParameter("action");
		out.print("更新");
		
		ArrayList<String> d_list;
		DB db=new DB();
		
		try{
			int newscore;
		if(action.equals("one"))
		{
			String score=request.getParameter("score");
			String dno=request.getParameter("dno");
			
			if(score.length()==0 || score==null)
			{
				score=null;
			}
			
			newscore=Integer.parseInt(score);
			//更新score
			boolean up= db.dormitory_score_update(dno,newscore);
			db.db_close();
			if(up)
			{
		    	out.println("<script type='text/javascript' language='javascript'>");
		    	out.println("alert('更新成功')");
		    	out.println("window.location='con_m_health.jsp'");
		    	out.println("</script>");
			}
			else
			{
		    	out.println("<script type='text/javascript' language='javascript'>");
		    	out.println("alert('更新失败')");
		    	out.println("window.location='con_m_health.jsp'");
		    	out.println("</script>");
			}
		}
		else if(action.equals("all"))
		{
			String[] scores = request.getParameterValues("upscore");
			int[] newscores=new int[scores.length];
			d_list=(ArrayList<String>)session.getAttribute("d_list");
			//scores[i],d_list.get(i)
			for(int i=0;i<d_list.size();i++)
			{
				if(scores[i].length()==0)
				{
					continue;
					//scores[i]=null;
				}
				
				newscores[i]=Integer.parseInt(scores[i]);
				

				db.dormitory_score_update(d_list.get(i),newscores[i]);
				db.db_close();
			}
	    	out.println("<script type='text/javascript' language='javascript'>");
	    	out.println("alert('完成')");
	    	out.println("window.location='con_m_health.jsp'");
	    	out.println("</script>");
		}
		else
		{
	    	out.println("<script type='text/javascript' language='javascript'>");
	    	out.println("alert('更新失败')");
	    	out.println("window.location='con_m_health.jsp'");
	    	out.println("</script>");
		}
		}//try
		//catch(NumberFormatException e){}
		catch(Exception e)
		{
	    	out.println("<script type='text/javascript' language='javascript'>");
	    	out.println("alert('更新失败')");
	    	out.println("window.location='con_m_health.jsp'");
	    	out.println("</script>");
		}
		
	%>
</body>
</html>