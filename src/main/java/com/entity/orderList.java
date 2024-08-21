package com.entity;

public class orderList {
	private String date;
	private String productName;
	private String productCategory;
	private int productPrice;
	private int orderQuantity;
	private int orderId;
	private int productId;
	private int userId;
	private String userName;
	private int total;
	
	public orderList() {}
	
	
	public orderList(String date, String productName, String productCategory, int productPrice, int orderQuantity,
			int orderId, int productId, int userId, String userName,int total) {
		super();
		this.date = date;
		this.productName = productName;
		this.productCategory = productCategory;
		this.productPrice = productPrice;
		this.orderQuantity = orderQuantity;
		this.orderId = orderId;
		this.productId = productId;
		this.userId = userId;
		this.userName = userName;
		this.total=total;
		
	}


	public String getDate() {
		return date;
	}


	public void setDate(String date) {
		this.date = date;
	}


	public String getProductName() {
		return productName;
	}


	public void setProductName(String productName) {
		this.productName = productName;
	}


	public String getProductCategory() {
		return productCategory;
	}


	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}


	public int getProductPrice() {
		return productPrice;
	}


	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}


	public int getOrderQuantity() {
		return orderQuantity;
	}


	public void setOrderQuantity(int orderQuantity) {
		this.orderQuantity = orderQuantity;
	}


	public int getOrderId() {
		return orderId;
	}


	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}


	public int getProductId() {
		return productId;
	}


	public void setProductId(int productId) {
		this.productId = productId;
	}


	public int getUserId() {
		return userId;
	}


	public void setUserId(int userId) {
		this.userId = userId;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public int getTotal() {
		return total;
	}


	public void setTotal(int total) {
		this.total = total;
	}


	@Override
	public String toString() {
		return "orderList [date=" + date + ", productName=" + productName + ", productCategory=" + productCategory
				+ ", productPrice=" + productPrice + ", orderQuantity=" + orderQuantity + ", orderId=" + orderId
				+ ", productId=" + productId + ", userId=" + userId + ", userName=" + userName + "]";
	}
	
	
	
}
