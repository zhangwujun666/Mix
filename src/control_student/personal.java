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
import bean.student_bean;

/**
 * Servlet implementation class personal
 */
@WebServlet("/personal")
public class personal extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public personal() {
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
		
		String sno=request.getParameter("sno");
		String status=null;
		status=request.getParameter("status");
//		status=new String(status.getBytes("ISO-8859-1"),"UTF-8");

//		//
//		if(session.getAttribute("sno")!=null)
//		{
//			sno=(String) session.getAttribute("sno");
//		}
//		if(session.getAttribute("status") != null)
//		{
//			status=(String) request.getAttribute("status");
//		}
//		//
//		HashMap<String,Object> accept_pass_set=(HashMap<String,Object>)request.getAttribute("message_p_r");
//		if( accept_pass_set != null)
//		{
//			sno=(String)accept_pass_set.get("sno");
//			status=(String)accept_pass_set.get("status");
//		}
		
		
		DB db=new DB();
		ArrayList<student_bean> student_info=db.get_student_info(sno);
		
		Map<String,Object> sendMessage=new HashMap<String, Object>();
		sendMessage.put("student_info", student_info);
		sendMessage.put("sno",sno);
		sendMessage.put("status", status);
		
		db.db_close();
		request.setAttribute("sendMessage_p", sendMessage);
		request.getRequestDispatcher("view_student_personal.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

}
