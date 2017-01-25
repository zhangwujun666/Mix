package bean;

import java.sql.Timestamp;

public class words_bean {

	private Timestamp wtime;
	private String wid;
	private String wtitle;
	private String wcontext;
	
	public words_bean() {
		// TODO Auto-generated constructor stub
	}

	public words_bean(Timestamp wtime,String wid,String wtitle,String wcontext) 
	{
		this.wtime=wtime;
		this.wid=wid;
		this.wtitle=wtitle;
		this.wcontext=wcontext;
	}

	public Timestamp getWtime() {
		return wtime;
	}

	public void setWtime(Timestamp wtime) {
		this.wtime = wtime;
	}

	public String getWid() {
		return wid;
	}

	public void setWid(String wid) {
		this.wid = wid;
	}

	public String getWtitle() {
		return wtitle;
	}

	public void setWtitle(String wtitle) {
		this.wtitle = wtitle;
	}

	public String getWcontext() {
		return wcontext;
	}

	public void setWcontext(String wcontext) {
		this.wcontext = wcontext;
	}
	
	
}
