package bean;

import java.sql.*;
import java.util.ArrayList;


public class DB {

	Connection conn;
	java.sql.PreparedStatement pst;
	
	public DB() {
		// TODO Auto-generated constructor stub
		 try {
			Class.forName("com.mysql.jdbc.Driver");
			 
			 conn=DriverManager.getConnection
			 		  ("jdbc:mysql://localhost:3306/mix", "root", "123456");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


	}

	
	/**
	 * 登录确认
	 */
	public boolean login_s(String name,String pass)
	{
//		DB db=new DB();
		ResultSet rs;
		try {
//			Connection conn=db.getConn();
			String sql="select * from t_student where sno=? AND spass=?";
			pst=conn.prepareStatement(sql);
			pst.setString(1, name);
			pst.setString(2, pass);
			rs=pst.executeQuery();
			if(rs.next())
			{
				return true;
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
	
	public String login_m(String name,String pass)
	{
		ResultSet rs;
		String sql="select * from t_admin where aid=? AND apass=?";
		String level = null;
		try {
			pst=conn.prepareStatement(sql);
			pst.setString(1, name);
			pst.setString(2, pass);
			rs=pst.executeQuery();
			
			if(rs.next())
			{
				
				level=String.valueOf(rs.getInt(3));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return level;
	}
	
	public void logintime_update(String aid,Date alogin)
	{
		String sql="update t_admin set alogin=? where aid=?";
		try {
			pst=conn.prepareStatement(sql);
			pst.setDate(1, alogin);
			pst.setString(2, aid);
			pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 学生信息
	 * @param sno
	 * @return
	 */
	public ArrayList<student_bean> get_student_info(String sno)
	{
		ResultSet rs;
		ArrayList<student_bean> info=new ArrayList<student_bean>();
		String sql="select * from t_student where sno=?";
		try {
			pst=conn.prepareStatement(sql);
			pst.setString(1, sno);
			rs=pst.executeQuery();
			
			while(rs.next())
			{
				String sname=rs.getString(2);
				String sex=rs.getString(3);
				String spec=rs.getString(4);
				java.sql.Date intime=rs.getDate(5);
				String tel=rs.getString(6);
				String spass=rs.getString(7);
				String sdno=rs.getString(8);
				
				info.add(new student_bean(sname, sex, spec, intime, tel, spass, sdno));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return info;
	}
	
	/**
	 * 宿舍信息
	 * @param sno
	 * @return
	 */
	public ArrayList<dormitory_bean> get_dormitory_info(String sno)
	{
		ResultSet rs;
		ArrayList<dormitory_bean> info=new ArrayList<dormitory_bean>();
		String sql="select t_dormitory.dno , daddress , dbed , dscore , dwater , delector from t_dormitory , t_student where sno=?";
		try {
			pst=conn.prepareStatement(sql);
			pst.setString(1, sno);
			rs=pst.executeQuery();
			
			while(rs.next())
			{
				String dno=rs.getString(1);
				String daddress=rs.getString(2);
				int dbed=rs.getInt(3);
				int dscore=rs.getInt(4);
				double dwater=rs.getDouble(5);
				double delector=rs.getDouble(6);
				
				info.add(new dormitory_bean(dno, daddress, dbed, dscore, dwater, delector));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return info;
	}
	
	/**
	 * 报修信息
	 * @param sno
	 * @return
	 */
	public ArrayList<repair_bean> get_repair_info(String sno)
	{
		ResultSet rs;
		ArrayList<repair_bean> info=new ArrayList<repair_bean>();
		String sql="select t_repair.dno , rsubtime , rsolvetime , rdetail from t_student , t_dormitory , t_repair where sno=?";
		try {
			pst=conn.prepareStatement(sql);
			pst.setString(1, sno);
			rs=pst.executeQuery();
			
			while(rs.next())
			{
				String dno=rs.getString(1);
				Date rsubtime=rs.getDate(2);
				Date rsolvetime=rs.getDate(3);
				String rdetail=rs.getString(4);
				
				info.add(new repair_bean(dno, rsubtime, rsolvetime, rdetail));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return info;
	}
	
	/**
	 * 添加报修信息
	 * @param dno
	 * @param rsubtime
	 * @param rdetail
	 * @return
	 */
	public boolean repair_insert_s(String dno,Date rsubtime,String rdetail)
	{
		int i=0;
		String sql="insert into t_repair (dno , rsubtime , rdetail ) values (? , ? , ?)";
		try {
			pst=conn.prepareStatement(sql);
			pst.setString(1, dno);
			pst.setDate(2, rsubtime);
			pst.setString(3, rdetail);
			i=pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(i!=0)
		{
			return true;
		}
		return false;
	}
	
	/**
	 * 修改学生密码
	 * @param sno
	 * @param spass
	 */
	public void student_pass_update(String sno,String spass)
	{
		String sql="update t_student set spass=? where sno=?";
		try {
			pst=conn.prepareStatement(sql);
			pst.setString(1, spass);
			pst.setString(2, sno);
			pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 修改学生联系方式
	 * @param sno
	 * @param tel
	 */
	public void student_tel_update(String sno,String tel)
	{
		String sql="update t_student set stel=? where sno=?";
		try {
			pst=conn.prepareStatement(sql);
			pst.setString(1, tel);
			pst.setString(2, sno);
			pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 查所有公告
	 * @return
	 */
	public ArrayList<words_bean> notice_title()
	{
		ResultSet rs;
		ArrayList<words_bean> info=new ArrayList<words_bean>();
		String sql="select * from t_words";
		try {
			pst=conn.prepareStatement(sql);
			rs=pst.executeQuery();
			
			while(rs.next())
			{
				Timestamp wtime=rs.getTimestamp(1);
				String wid=rs.getString(2);
				String wtitle=rs.getString(3);
				String wcontext=rs.getString(4);
				
				info.add(new words_bean(wtime, wid, wtitle, wcontext));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return info;
	}
	/**
	 * 查公告内容
	 * @param wtime
	 * @param wid
	 * @return
	 */
	public ArrayList<words_bean> notice_title(Timestamp wtime ,String wid )
	{
		ResultSet rs;
		ArrayList<words_bean> info=new ArrayList<words_bean>();
		String sql="select wtitle , wcontext from t_words where wtime=? and wid=?";
		try {
			pst=conn.prepareStatement(sql);
			pst.setTimestamp(1, wtime);
			pst.setString(2, wid);
			rs=pst.executeQuery();
			
			while(rs.next())
			{
				String wtitle=rs.getString(1);
				String wcontext=rs.getString(2);
				
				info.add(new words_bean(wtime, wid, wtitle, wcontext));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return info;
	}
	
	/*				管理员专用				*/

	/**
	 * 查询宿舍评分
	 */
	public ArrayList<dormitory_bean> dormitory_health()
	{
		ResultSet rs;
		ArrayList<dormitory_bean> info=new ArrayList<dormitory_bean>();
		String sql="select dno , dscore from t_dormitory";
		try {
			pst=conn.prepareStatement(sql);
			rs=pst.executeQuery();
			
			while(rs.next())
			{
				String dno=rs.getString(1);
				int dscore=rs.getInt(2);
				
				info.add(new dormitory_bean(dno, dscore));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
			
		return info;
	}
	
	/**
	 * 更新宿舍评分
	 * @param dno
	 * @param score
	 * @return
	 */
	public boolean dormitory_score_update(String dno,int score)
	{
		String sql="update t_dormitory set dscore=? where dno=?";
		int i=0;
		try {
			pst=conn.prepareStatement(sql);
			pst.setInt(1, score);
			pst.setString(2, dno);
			i=pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(i==0)
		{
			return false;
		}
		else
		{
			return true;
		}
	}
	
	/**
	 * 查询宿舍水电
	 */
	public ArrayList<dormitory_bean> dormitory_w_e()
	{
		ResultSet rs;
		ArrayList<dormitory_bean> info=new ArrayList<dormitory_bean>();
		String sql="select dno , dwater , delector from t_dormitory";
		try {
			pst=conn.prepareStatement(sql);
			rs=pst.executeQuery();
			
			while(rs.next())
			{
				String dno=rs.getString(1);
				double dwater=rs.getDouble(2);
				double delector=rs.getDouble(3);
				
				info.add(new dormitory_bean(dno, dwater ,delector));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		return info;
	}
	
	/**
	 * 更新宿舍水费
	 * @param dno
	 * @param dwater
	 */
	public void dormitory_water_update(String dno,double dwater)
	{
		String sql="update t_dormitory set dwater=? where dno=?";
		try {
			pst=conn.prepareStatement(sql);
			pst.setDouble(1, dwater);
			pst.setString(2, dno);
			pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 更新宿舍电费
	 * @param dno
	 * @param dwater
	 */
	public void dormitory_elector_update(String dno,double delector)
	{
		String sql="update t_dormitory set delector=? where dno=?";
		try {
			pst=conn.prepareStatement(sql);
			pst.setDouble(1, delector);
			pst.setString(2, dno);
			pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 获取所有报修信息
	 * @return
	 */
	public ArrayList<repair_bean> all_repair()
	{
		ResultSet rs;
		ArrayList<repair_bean> info=new ArrayList<repair_bean>();
		String sql="select * from t_repair";
		try {
			pst=conn.prepareStatement(sql);
			rs=pst.executeQuery();
			
			while(rs.next())
			{
				String dno=rs.getString(1);
				Date rsubtime=rs.getDate(2);
				Date rsolvetime=rs.getDate(3);
				String rdetail=rs.getString(4);
				
				info.add(new repair_bean(dno, rsubtime, rsolvetime, rdetail));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return info;
	}
	
	/**
	 * 报修修复更新
	 * @param dno
	 * @param rsolvetime
	 * @param rsubtime
	 * @return
	 */
	public boolean repair_solvetime_update(String dno,Date rsolvetime,Date rsubtime)
	{
		String sql="update t_repair set rsolvetime=? where dno=? and rsubtime=?";
		int i=0;
		try {
			pst=conn.prepareStatement(sql);
			pst.setDate(1, rsolvetime);
			pst.setString(2, dno);
			pst.setDate(3, rsubtime);
			i=pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(i==0)
		{
			return false;
		}
		else
		{
			return true;
		}	
	}
	
	/**
	 * 宿舍基本信息(信息录入模块)
	 */
	public ArrayList<dormitory_bean> dormitory_base_info()
	{
		ResultSet rs;
		ArrayList<dormitory_bean> info=new ArrayList<dormitory_bean>();
		String sql="select * from t_dormitory";
		try {
			pst=conn.prepareStatement(sql);
			rs=pst.executeQuery();
			
			while(rs.next())
			{
				String dno=rs.getString(1);
				String daddress=rs.getString(2);
				int dbed=rs.getInt(3);
				
				info.add(new dormitory_bean(dno, daddress ,dbed));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return info;
	}
	
	
	
	
	
	
	/*	public Connection getConn() throws Exception
		{
//			 Connection conn;
			 Class.forName("com.mysql.jdbc.Driver");
			 
			 conn=DriverManager.getConnection
			 		  ("jdbc:mysql://localhost:3306/mix", "root", "123456");

			 
			 return conn;
		}*/
	public void db_close()
	{
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
