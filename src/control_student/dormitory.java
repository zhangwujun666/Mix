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
import bean.student_bean;

/**
 * Servlet implementation class dormitory
 */
@WebServlet("/dormitory")
public class dormitory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dormitory() {
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
		
		DB db=new DB();
		//��ȡ������Ϣ
		ArrayList<dormitory_bean> dormitory_info=db.get_dormitory_info(sno);
		//��ȡѧ����Ϣ
		ArrayList<student_bean> student_info=db.get_student_info(sno);
		String sname=student_info.get(0).getSname();//ѧ������
		
		Map<String,Object> sendMessage=new HashMap<String, Object>();
		sendMessage.put("dormitory_info", dormitory_info);
		sendMessage.put("sno", sno);
		sendMessage.put("sname", sname);
		
		db.db_close();
		request.setAttribute("sendMessage_d", sendMessage);
		request.getRequestDispatcher("view_student_dormitory.jsp").forward(request, response);
		
/*		request.setAttribute("list", list);
		request.getRequestDispatcher("xxx.jsp").forward(request, response);*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(request, response);
	}

}
