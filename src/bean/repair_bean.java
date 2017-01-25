package bean;

import java.sql.Date;

public class repair_bean {
	
	private String dno;
	private Date rsubtime;
	private Date rsolvetime;
	private String rdetail;
	
	public repair_bean() {
		// TODO Auto-generated constructor stub
	}
	
	public repair_bean(String dno,Date rsubtime,Date rsolvetime,String rdetail) 
	{
		this.dno=dno;
		this.rsubtime=rsubtime;
		this.rsolvetime=rsolvetime;
		this.rdetail=rdetail;
	}
	
	public String getDno() {
		return dno;
	}

	public void setDno(String dno) {
		this.dno = dno;
	}

	public Date getRsubtime() {
		return rsubtime;
	}

	public void setRsubtime(Date rsubtime) {
		this.rsubtime = rsubtime;
	}

	public Date getRsolvetime() {
		return rsolvetime;
	}

	public void setRsolvetime(Date rsolvetime) {
		this.rsolvetime = rsolvetime;
	}

	public String getRdetail() {
		return rdetail;
	}

	public void setRdetail(String rdetail) {
		this.rdetail = rdetail;
	}


}
