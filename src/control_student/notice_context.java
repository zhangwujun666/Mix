package control_student;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.DB;
import bean.words_bean;

/**
 * Servlet implementation class notice_context
 */
@WebServlet("/notice_context")
public class notice_context extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public notice_context() {
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
		
		String w=request.getParameter("wtime");
		String wid=request.getParameter("wid");
		
		Timestamp wtime=Timestamp.valueOf(w);
		
		
		
		DB db=new DB();
		ArrayList<words_bean> context_info=db.notice_title(wtime, wid);
		
		session.setAttribute("context_info", context_info);
		response.sendRedirect("view_student_notice_read.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
