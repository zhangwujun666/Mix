package bean;

public class dormitory_bean {
	private String dno;
	private String daddress;
	private int dbed;
	private int dscore;
	private double dwater;
	private double delector;
	
	public dormitory_bean() {
		// TODO Auto-generated constructor stub
	}
	
	public dormitory_bean(String dno,String daddress,int dbed,int dscore,double dwater,double delector)
	{
		this.dno=dno;
		this.daddress=daddress;
		this.dbed=dbed;
		this.dscore=dscore;
		this.dwater=dwater;
		this.delector=delector;
	}
	//for manager
	public dormitory_bean(String dno,int dscore) 
	{
		this.dno=dno;
		this.dscore=dscore;
	}
	public dormitory_bean(String dno,double dwater,double delector) 
	{
		this.dno=dno;
		this.dwater=dwater;
		this.delector=delector;
	}
	public dormitory_bean(String dno,String daddress,int dbed)
	{
		this.dno=dno;
		this.daddress=daddress;
		this.dbed=dbed;
	}
	
	public String getDno() {
		return dno;
	}
	public void setDno(String dno) {
		this.dno = dno;
	}
	public String getDaddress() {
		return daddress;
	}
	public void setDaddress(String daddress) {
		this.daddress = daddress;
	}
	public int getDbed() {
		return dbed;
	}
	public void setDbed(int dbed) {
		this.dbed = dbed;
	}
	public int getDscore() {
		return dscore;
	}
	public void setDscore(int dscore) {
		this.dscore = dscore;
	}
	public double getDwater() {
		return dwater;
	}
	public void setDwater(double dwater) {
		this.dwater = dwater;
	}
	public double getDelector() {
		return delector;
	}
	public void setDelector(double delector) {
		this.delector = delector;
	}
	
	
	
}
