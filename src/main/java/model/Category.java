package model;

public class Category {
	private int cnum;
	private String cname;
	private String cpicture;
	private String ctext;
	private int cprice;
	private int cqty;
	private int cmenu;
	private String boardid;
	public int getCnum() {
		return cnum;
	}
	public void setCnum(int cnum) {
		this.cnum = cnum;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getCpicture() {
		return cpicture;
	}
	public void setCpicture(String cpicture) {
		this.cpicture = cpicture;
	}
	public String getCtext() {
		return ctext;
	}
	public void setCtext(String ctext) {
		this.ctext = ctext;
	}
	public int getCprice() {
		return cprice;
	}
	public void setCprice(int cprice) {
		this.cprice = cprice;
	}
	public int getCqty() {
		return cqty;
	}
	public void setCqty(int cqty) {
		this.cqty = cqty;
	}
	public int getCmenu() {
		return cmenu;
	}
	public void setCmenu(int cmenu) {
		this.cmenu = cmenu;
	}
	public String getBoardid() {
		return boardid;
	}
	public void setBoardid(String boardid) {
		this.boardid = boardid;
	}
	@Override
	public String toString() {
		return "Category [cnum=" + cnum + ", cname=" + cname + ", cpicture=" + cpicture + ", ctext=" + ctext
				+ ", cprice=" + cprice + ", cqty=" + cqty + ", cmenu=" + cmenu + ", boardid=" + boardid + "]";
	}
	
}
