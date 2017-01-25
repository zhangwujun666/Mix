package control_student;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.DB;

/**
 * Servlet implementation class personal_pass_reset
 */
@WebServlet("/personal_pass_reset")
public class personal_pass_reset extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public personal_pass_reset() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
//      response.setCharacterEncoding("text/html;UTF-8"); 
        request.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		
		String newpass=request.getParameter("newpass");
		String surepass=request.getParameter("surepass");
		String sno=request.getParameter("sno");
		
		String status;
		Map<String,Object> message_p_r=new HashMap<String,Object>();
		int i;
		if(newpass.equals("") || newpass==null || surepass.equals("") || surepass==null )
		{
			status="修改失败，请检查!";
			//request.setAttribute("status",status);
			message_p_r.put("status", status);
			i=0;
		}
		else if(!newpass.equals(surepass))
		{
			status="修改失败，两次密码不一致!";
			//request.setAttribute("status",status);
			message_p_r.put("status", status);
			i=1;
		}
		else
		{
			status="修改成功!";
			//request.setAttribute("status",status);
			message_p_r.put("status", status);
			i=2;
		}
		
		message_p_r.put("sno", sno);
		
		switch (i) {
		case 0:
			request.setAttribute("message_p_r", message_p_r);
			request.getRequestDispatcher("view_student_pass_reset.jsp").forward(request, response);
			break;
		case 1:
			request.setAttribute("message_p_r", message_p_r);
			request.getRequestDispatcher("view_student_pass_reset.jsp").forward(request, response);
			break;
		case 2:
			if(newpass.length()<=16)
			{
				DB db=new DB();
				db.student_pass_update(sno, newpass);
	//			request.setAttribute("message_p_r", message_p_r);
	//			session.setAttribute("sno", sno);
	//			session.setAttribute("status", status);
	//			request.getRequestDispatcher("personal").forward(request, response);
	//			response.sendRedirect("personal");
				db.db_close();
		    	out.println("<script type='text/javascript' language='javascript'>");
		    	out.println("alert('修改成功')");
		    	out.println("window.location='personal?sno="+sno+"&&status="+status+"'");
		    	out.println("</script>");
			}
			else
			{
		    	out.println("<script type='text/javascript' language='javascript'>");
		    	out.println("alert('修改失败!长度过长')");
		    	out.println("window.location='personal?sno="+sno+"&&status="+status+"'");
		    	out.println("</script>");
			}
			break;
		
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(request, response);
	}

}
