package control_student;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.DB;

/**
 * Servlet implementation class repair_add
 */
@WebServlet("/repair_add")
public class repair_add extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public repair_add() {
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
		
//		String dno=request.getParameter("dno");
//		String sno=request.getParameter("sno");
		String dno=new String(request.getParameter("dno").getBytes("ISO-8859-1"),"UTF-8");
		String sno=new String(request.getParameter("sno").getBytes("ISO-8859-1"),"UTF-8");
		
		session.setAttribute("sno", sno);
		
		String rdetail=request.getParameter("rdetail");
		Date rsubtime=new Date(System.currentTimeMillis());
		
		DB db=new DB();
		boolean s=db.repair_insert_s(dno, rsubtime, rdetail);
		
		db.db_close();
		if(s)
		{
			request.getRequestDispatcher("repair").forward(request, response);
		}
		else
		{
			String status="提交失败!一天不能多次提交";
			request.setAttribute("status", status);
			request.getRequestDispatcher("repair").forward(request, response);
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
