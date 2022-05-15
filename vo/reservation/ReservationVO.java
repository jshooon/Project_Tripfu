package com.tripfu.vo.reservation;

import java.util.ArrayList;
import java.util.List;

public class ReservationVO {
	private int rnum;
	private String rpname;
	private String rtype;
	private String mname;
	private java.sql.Date sdate;
	private java.sql.Date edate;
	private java.sql.Date rdate;
	private int nump;
	private int rprice;
	private String rname;
	private String rphone;
	private String remail;
	private int aNump;
	

	@Override
	public String toString() {
		return String.format("%d %s %s %s %s %s %s %s %d %s %s %s %d", rnum, rpname, rtype, mname, sdate, edate, rdate, nump, rprice, rname, rphone, remail, aNump);
	}
	
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getRpname() {
		return rpname;
	}
	public void setRpname(String rpname) {
		this.rpname = rpname;
	}
	public String getRtype() {
		return rtype;
	}
	public void setRtype(String rtype) {
		this.rtype = rtype;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public java.sql.Date getSdate() {
		return sdate;
	}
	public void setSdate(java.sql.Date sdate) {
		this.sdate = sdate;
	}
	public java.sql.Date getEdate() {
		return edate;
	}
	public void setEdate(java.sql.Date edate) {
		this.edate = edate;
	}
	public java.sql.Date getRdate() {
		return rdate;
	}
	public void setRdate(java.sql.Date rdate) {
		this.rdate = rdate;
	}
	public int getNump() {
		return nump;
	}
	public void setNump(int nump) {
		this.nump = nump;
	}
	public int getRprice() {
		return rprice;
	}
	public void setRprice(int rprice) {
		this.rprice = rprice;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public String getRphone() {
		return rphone;
	}
	public void setRphone(String rphone) {
		this.rphone = rphone;
	}
	public String getRemail() {
		return remail;
	}
	public void setRemail(String remail) {
		this.remail = remail;
	}
	public int getaNump() {
		return aNump;
	}
	public void setaNump(int aNump) {
		this.aNump = aNump;
	}

}
