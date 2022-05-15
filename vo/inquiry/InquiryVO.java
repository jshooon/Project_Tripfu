package com.tripfu.vo.inquiry;

import java.util.ArrayList;
import java.util.List;


public class InquiryVO {
	private int num;
	private String iqauthor;
	private String iqtitle;
	private String iqcontents;
	private String iqtype;
	private java.sql.Date iqdate;
	public List<IqFileInfoVO> iqfileinfo = new ArrayList<>();
	
	public InquiryVO() {}
	
	public InquiryVO(int inum) {
		this.setNum(inum);
	}


//	@Override
//	public String toString() {
//		
//		return String.format("%d %s %s %s %s %o %o",num, iqauthor, iqtitle, iqcontents, iqtype, iqdate, iqfileinfo);
//	}
	@Override
	public String toString() {

		return num + " " + iqauthor + " " + iqtitle + " " + iqcontents + " " + iqtype + " " + iqdate;
	}
	
	@Override
	public boolean equals(Object obj) {
		InquiryVO other = (InquiryVO) obj;
		return this.num==other.num;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getIqauthor() {
		return iqauthor;
	}

	public void setIqauthor(String iqauthor) {
		this.iqauthor = iqauthor;
	}

	public String getIqtitle() {
		return iqtitle;
	}

	public void setIqtitle(String iqtitle) {
		this.iqtitle = iqtitle;
	}

	public String getIqcontents() {
		return iqcontents;
	}

	public void setIqcontents(String iqcontents) {
		this.iqcontents = iqcontents;
	}

	public String getIqtype() {
		return iqtype;
	}

	public void setIqtype(String iqtype) {
		this.iqtype = iqtype;
	}

	public java.sql.Date getIqdate() {
		return iqdate;
	}

	public void setIqdate(java.sql.Date iqdate) {
		this.iqdate = iqdate;
	}

	public List<IqFileInfoVO> getIqfileinfo() {
		return iqfileinfo;
	}

	public void setIqfileinfo(List<IqFileInfoVO> iqfileinfo) {
		this.iqfileinfo = iqfileinfo;
	}

	
	
}
