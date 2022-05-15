package com.tripfu.vo.admin;

public class CommentVO {
	private int num;
	private int iqnum;
	private String name;
	private String type;
	private String title;
	private String contents;
	private String comments;
	private java.sql.Date date;
	
	@Override
	public String toString() {
		return String.format("%d %d %s %s %s %s %s %s", num, iqnum, name, type, title, contents, comments, date);
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getIqnum() {
		return iqnum;
	}

	public void setIqnum(int iqnum) {
		this.iqnum = iqnum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public java.sql.Date getDate() {
		return date;
	}
	public void setDate(java.sql.Date date) {
		this.date = date;
	}
	
	
}
