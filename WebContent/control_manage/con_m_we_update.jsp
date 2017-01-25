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
		String action=null;
		action=request.getParameter("action");
		out.print("更新");
		String aid=null;
		aid=(String)session.getAttribute("aid");
		
		ArrayList<String> d_list;
		
		DB db=new DB();
		try
		{
		if(action.equals("water"))
		{
			String[] dwaters = request.getParameterValues("upwater");
			double[] newdwaters=new double[dwaters.length];
			d_list=(ArrayList<String>)session.getAttribute("d_list_w");
			for(int i=0;i<d_list.size();i++)
			{
				if(dwaters[i].length()==0)
				{
					continue;
					//scores[i]=null;
				}
				
				newdwaters[i]=Double.parseDouble(dwaters[i]);
				

				db.dormitory_water_update(d_list.get(i),newdwaters[i]);
				
			}
			db.db_close();
	    	out.println("<script type='text/javascript' language='javascript'>");
	    	out.println("alert('完成')");
	    	out.println("window.location='con_m_ele_wat.jsp?action=water'");
	    	out.println("</script>");
		}
		else if(action.equals("elector"))
		{
			String[] delectors = request.getParameterValues("upelector");
			double[] newdelectors=new double[delectors.length];
			d_list=(ArrayList<String>)session.getAttribute("d_list_e");
			for(int i=0;i<d_list.size();i++)
			{
				if(delectors[i].length()==0)
				{
					continue;
					//scores[i]=null;
				}
				
				newdelectors[i]=Double.parseDouble(delectors[i]);
				

				db.dormitory_elector_update(d_list.get(i),newdelectors[i]);
				
			}
			db.db_close();
	    	out.println("<script type='text/javascript' language='javascript'>");
	    	out.println("alert('完成')");
	    	out.println("window.location='con_m_ele_wat.jsp?action=elector'");
	    	out.println("</script>");
		}
		else
		{
	    	out.println("<script type='text/javascript' language='javascript'>");
	    	out.println("alert('更新失败')");
	    	out.println("window.location='../view_manager_home.jsp?aid="+aid+"'");
	    	out.println("</script>");
		}
		}catch(Exception e)
		{
	    	out.println("<script type='text/javascript' language='javascript'>");
	    	out.println("alert('更新失败')");
	    	out.println("window.location='../view_manager_home.jsp?aid="+aid+"'");
	    	out.println("</script>");
		}
	%>
</body>
</html>