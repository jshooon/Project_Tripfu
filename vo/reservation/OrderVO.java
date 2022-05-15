package com.tripfu.vo.reservation;

public class OrderVO {
	private int onum;
	private String pdname;
	private int rvnum;
	
	
	
	@Override
	public String toString() {
		return String.format("%d %s %d", onum, pdname, rvnum);
	}
	public int getOnum() {
		return onum;
	}
	public void setOnum(int onum) {
		this.onum = onum;
	}
	public String getPdname() {
		return pdname;
	}
	public void setPdname(String pdname) {
		this.pdname = pdname;
	}
	public int getRvnum() {
		return rvnum;
	}
	public void setRvnum(int rvnum) {
		this.rvnum = rvnum;
	}
	
	
}
