package model;

public class Cart {
	private int dnum;
	private String dname;
	private int dprice;
	private int dqty;
	private int dtotal;
	private String dpicture;
	private String did;
	public int getDnum() {
		return dnum;
	}
	public void setDnum(int dnum) {
		this.dnum = dnum;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public int getDprice() {
		return dprice;
	}
	public void setDprice(int dprice) {
		this.dprice = dprice;
	}
	public int getDqty() {
		return dqty;
	}
	public void setDqty(int dqty) {
		this.dqty = dqty;
	}
	public int getDtotal() {
		return dtotal;
	}
	public void setDtotal(int dtotal) {
		this.dtotal = dtotal;
	}
	public String getDpicture() {
		return dpicture;
	}
	public void setDpicture(String dpicture) {
		this.dpicture = dpicture;
	}
	public String getDid() {
		return did;
	}
	public void setDid(String did) {
		this.did = did;
	}
	@Override
	public String toString() {
		return "Cart [dnum=" + dnum + ", dname=" + dname + ", dprice=" + dprice + ", dqty=" + dqty + ", dtotal="
				+ dtotal + ", dpicture=" + dpicture + ", did=" + did + "]";
	}
	
	
}