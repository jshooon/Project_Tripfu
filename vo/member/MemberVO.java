package com.tripfu.vo.member;

import org.springframework.stereotype.Component;

@Component
public class MemberVO {
	private int mnum;
	private String email;
	private String pwd;
	private String name;
	private String birth;
	private String gender;
	private String phone;

	
	
	@Override
	public String toString() {
		return String.format("%d %s %s %s %s %s %s", mnum, email, pwd, name, birth, gender, phone);
	}
	public int getMnum() {
		return mnum;
	}
	public void setMnum(int mnum) {
		this.mnum = mnum;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	
}
