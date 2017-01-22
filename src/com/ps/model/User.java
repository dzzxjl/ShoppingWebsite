package com.ps.model;

public class User {
	private int uid;//1id标识主键
	private String uemail;//2个人邮箱
	private String uname;//3账号昵称
	private String upassword;//4账号密码
	private String uintroduction;//5个人介绍
public String getUintroduction() {
		return uintroduction;
	}
	public void setUintroduction(String uintroduction) {
		this.uintroduction = uintroduction;
	}
	//	private int ustatus;
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getUemail() {
		return uemail;
	}
	public void setUemail(String uemail) {
		this.uemail = uemail;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUpassword() {
		return upassword;
	}
	public void setUpassword(String upassword) {
		this.upassword = upassword;
	}
}
