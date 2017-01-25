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
 * Servlet implementation class login_s
 */
@WebServlet("/login_s")
public class login_s extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login_s() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		
		String sno=request.getParameter("sno");
		String spass=request.getParameter("spass");
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		
		DB db=new DB();
		boolean premit=db.login_s(sno, spass);
		db.db_close();
		if(premit)
		{
			//session.setAttribute("sno", sno);
			String url="view_student_show.jsp?sno="+sno;
			response.sendRedirect(url);
			//request.getRequestDispatcher("view_student_frame.jsp").forward(request, response);
		}
		else
		{
	    	out.println("<script type='text/javascript' language='javascript'>");
	    	out.println("alert('µÇÂ¼´íÎó')");
	    	out.println("window.location='view_index.jsp'");
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

}
