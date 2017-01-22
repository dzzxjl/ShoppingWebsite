package com.ps.model;

import java.util.Date;

public class Order {
	private int id; //订单ID编号
	private String time;//订单交易时间
	private int uid;
	private int pid;//订单商品ID号
	private int num;//订单商品数量
	private int price;//订单总价
	private int isCancel;//订单是否确定
	private int isDispatch;//订单是否配送/交易完毕
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getIsCancel() {
		return isCancel;
	}
	public void setIsCancel(int isCancel) {
		this.isCancel = isCancel;
	}
	public int getIsDispatch() {
		return isDispatch;
	}
	public void setIsDispatch(int isDispatch) {
		this.isDispatch = isDispatch;
	}

}
