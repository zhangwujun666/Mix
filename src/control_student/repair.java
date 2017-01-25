package control_student;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.DB;
import bean.dormitory_bean;
import bean.repair_bean;
import bean.student_bean;

/**
 * Servlet implementation class repair
 */
@WebServlet("/repair")
public class repair extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public repair() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		
		String sno=request.getParameter("sno");
		
		if(session.getAttribute("sno")!=null)
		{
			sno=(String) session.getAttribute("sno");
		}
		String status=(String) request.getAttribute("status");
		
		DB db=new DB();
		ArrayList<repair_bean> repair_info=db.get_repair_info(sno);
		
		//获取学生信息
		ArrayList<student_bean> student_info=db.get_student_info(sno);
		String sname=student_info.get(0).getSname();//学生姓名
		String dno=student_info.get(0).getDno();//宿舍号
		
		Map<String,Object> sendMessage=new HashMap<String, Object>();
		sendMessage.put("repair_info", repair_info);
		sendMessage.put("sno", sno);
		sendMessage.put("sname", sname);
		sendMessage.put("dno", dno);
		sendMessage.put("status", status);
		
		db.db_close();
		request.setAttribute("sendMessage_r", sendMessage);
		request.getRequestDispatcher("view_student_repair.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(request, response);
	}

}
