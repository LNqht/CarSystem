package com.qiuhongtao.pojo;

import org.apache.ibatis.type.Alias;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Alias("payment")
public  class Payment implements java.io.Serializable {

	private int paymentId;
	private String paymentType;

	public Payment() {
	}

	public Payment(String paymentType) {
		this.paymentType = paymentType;
	}

	public Payment(String paymentType, Set orders) {
		this.paymentType = paymentType;
	}


	public int getPaymentId() {
		return this.paymentId;
	}

	public void setPaymentId(int paymentId) {
		this.paymentId = paymentId;
	}

	public String getPaymentType() {
		return this.paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}
}