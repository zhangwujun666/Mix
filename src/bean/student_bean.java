package bean;

import java.sql.Date;

public class student_bean {

	private String sname;
	private String sex;
	private String spec;
	private Date intime;
	private String tel;
	private String spass;
	private String dno;
	
	public student_bean() {
		// TODO Auto-generated constructor stub
	}
	
	public student_bean(String sname,String sex,String spec,Date intime,String tel,String spass,String dno) 
	{
		this.sname=sname;
		this.sex=sex;
		this.spec=spec;
		this.intime=intime;
		this.tel=tel;
		this.spass=spass;
		this.dno=dno;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getSpec() {
		return spec;
	}

	public void setSpec(String spec) {
		this.spec = spec;
	}

	public Date getIntime() {
		return intime;
	}

	public void setIntime(Date intime) {
		this.intime = intime;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getSpass() {
		return spass;
	}

	public void setSpass(String spass) {
		this.spass = spass;
	}

	public String getDno() {
		return dno;
	}

	public void setDno(String dno) {
		this.dno = dno;
	}
	
	
	
}
