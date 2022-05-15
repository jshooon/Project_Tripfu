package com.tripfu.vo.product;

import java.util.Objects;

public class FProductVO {
	private int pnum;
	private String pname;
	private String area;
	private String type;
	private int price;
	private String fname;
	private String ifname;
	private String ptitle;
	private String pcontents;
	private String latitude;
	private String longitude;
	
	@Override
	public String toString() {
		return String.format("%d %s %s %s %d %s %s %s %s %s %s", 
								pnum, pname, area, type, price, fname, ifname, ptitle, pcontents, latitude, longitude);
	}
	@Override
	public int hashCode() {
		
		return Objects.hash(this.pname);
	}
	@Override
	public boolean equals(Object obj) {
		FProductVO p = (FProductVO)obj;
		 return (this.pname == p.pname ? true : false);
	}
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getIfname() {
		return ifname;
	}
	public void setIfname(String ifname) {
		this.ifname = ifname;
	}
	public String getPtitle() {
		return ptitle;
	}
	public void setPtitle(String ptitle) {
		this.ptitle = ptitle;
	}
	public String getPcontents() {
		return pcontents;
	}
	public void setPcontents(String pcontents) {
		this.pcontents = pcontents;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
}
