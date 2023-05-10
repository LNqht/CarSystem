package com.qiuhongtao.pojo;

import org.apache.ibatis.type.Alias;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;


@Alias("order")
public class Order implements java.io.Serializable {

	private int orderId;
	private int customerId;
	private int paymentId;
	private Timestamp orderDate;
	private String name;

	private String address;
	private String city;
	private String state;
	private String postalCode;
	private String country;
	private String phone;
	private Double orderTotal;
	private Set<Item> orderDetails = new HashSet<Item>(0);


	public Order() {
	}

	public Order(int customerId, int paymentId,
			Timestamp orderDate, String Name,
			String address) {
		this.customerId = customerId;
		this.paymentId = paymentId;
		this.orderDate = orderDate;
		this.name = Name;
		this.address = address;
	}

	public Order(int customerId, int paymentId,
			Timestamp orderDate, String Name, String address, String city, String state,
			String postalCode, String country, String phone,
			Double orderTotal) {
		this.customerId = customerId;
		this.paymentId = paymentId;
		this.orderDate = orderDate;
		this.name = Name;
		this.address = address;
		this.city = city;
		this.state = state;
		this.postalCode = postalCode;
		this.country = country;
		this.phone = phone;
		this.orderTotal = orderTotal;
	}


	public int getOrderId() {
		return this.orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getCustomerId() {
		return this.customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	public int getPaymentId() {
		return this.paymentId;
	}

	public void setPaymentId(int paymentId) {
		this.paymentId = paymentId;
	}

	public Timestamp getOrderDate() {
		return this.orderDate;
	}

	public void setOrderDate(Timestamp orderDate) {
		this.orderDate = orderDate;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String Name) {
		this.name = Name;
	}



	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}



	public String getCity() {
		return this.city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return this.state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getPostalCode() {
		return this.postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	public String getCountry() {
		return this.country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}


	public Double getOrderTotal() {
		return this.orderTotal;
	}

	public void setOrderTotal(Double orderTotal) {
		this.orderTotal = orderTotal;
	}

	public Set<Item> getOrderDetails() {
		return this.orderDetails;
	}

	public void setOrderDetails(Set<Item> orderDetails) {
		this.orderDetails = orderDetails;
	}

	@Override
	public String toString() {
		return "Order{" +
				"orderId=" + orderId +
				", customerId=" + customerId +
				", paymentId=" + paymentId +
				", orderDate=" + orderDate +
				", name='" + name + '\'' +
				", address='" + address + '\'' +
				", city='" + city + '\'' +
				", state='" + state + '\'' +
				", postalCode='" + postalCode + '\'' +
				", country='" + country + '\'' +
				", phone='" + phone + '\'' +
				", orderTotal=" + orderTotal +
				", orderDetails=" + orderDetails +
				'}';
	}
}
