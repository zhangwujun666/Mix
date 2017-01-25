package control_student;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.DB;

/**
 * Servlet implementation class personal_tel_reset
 */
@WebServlet("/personal_tel_reset")
public class personal_tel_reset extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public personal_tel_reset() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		
		String sno=request.getParameter("sno");
		String tel=request.getParameter("tel");
		
		if(tel != null || tel.length()<=0  )
		{
			if( isLegal(tel) && tel.length()<=20 )
			{
				DB db=new DB();
				db.student_tel_update(sno, tel);
				
				db.db_close();
		    	out.println("<script type='text/javascript' language='javascript'>");
		    	out.println("alert('修改成功')");
		    	out.println("window.location='personal?sno="+sno+"'");
		    	out.println("</script>");
			}
			else
			{
		    	out.println("<script type='text/javascript' language='javascript'>");
		    	out.println("alert('修改失败!请不要包含非法字符或者长度过长')");
		    	out.println("window.location='personal?sno="+sno+"'");
		    	out.println("</script>");
			}
		}
		else
		{
	    	out.println("<script type='text/javascript' language='javascript'>");
	    	out.println("alert('修改失败!检查手机号是否填写')");
	    	out.println("window.location='personal?sno="+sno+"'");
	    	out.println("</script>");
		}
		
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(request, response);
	}

    public static boolean isLegal(String str) 
    {
        for (int i = str.length(); --i >= 0;) 
        {
            int chr = str.charAt(i);
            if (chr < 43 || chr > 57 && chr<64 || chr>=44 && chr<=45 || chr>=91 && chr<=96 || chr>122 )
                return false;
        }
        return true;
    }
}
