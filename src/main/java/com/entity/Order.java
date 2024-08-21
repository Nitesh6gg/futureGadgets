package com.entity;

public class Order extends Product{
	private int orderId;
	private int productId;
	private String productName;
	private int productPrice;
	private int orderQuantity;
	private String productCategory;
	private int userId;
	private String userName;
	private String date;
	private String orderStatus;
	
	public Order() {}

	

	public Order(int orderId, int productId, String productName, int productPrice, int orderQuantity,
			String productCategory, int userId, String userName, String date,String orderStatus) {
		super();
		this.orderId = orderId;
		this.productId = productId;
		this.productName = productName;
		this.productPrice = productPrice;
		this.orderQuantity = orderQuantity;
		this.productCategory = productCategory;
		this.userId = userId;
		this.userName = userName;
		this.date = date;
		this.orderStatus=orderStatus;
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

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
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

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
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

	public String getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}



	@Override
	public String toString() {
		return "Order [orderId=" + orderId + ", productId=" + productId + ", productName=" + productName
				+ ", productPrice=" + productPrice + ", orderQuantity=" + orderQuantity + ", productCategory="
				+ productCategory + ", userId=" + userId + ", userName=" + userName + ", date=" + date
				+ ", orderStatus=" + orderStatus + "]";
	}
	
	

}
