package com.entity;

public class Product {
	
	
	private int id;
	private String pName;
	private String pCategory;
	private double pPrice;
	private String pImage;
	
	
	public Product(){
		
	}

	public Product(int id, String pName, String pCategory, double pPrice, String pImage) {
		super();
		this.id = id;
		this.pName = pName;
		this.pCategory = pCategory;
		this.pPrice = pPrice;
		this.pImage = pImage;
	}

	public int getId() {
		return id;
	}
	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getpCategory() {
		return pCategory;
	}

	public void setpCategory(String pCategory) {
		this.pCategory = pCategory;
	}

	public double getpPrice() {
		return pPrice;
	}

	public void setpPrice(double pPrice) {
		this.pPrice = pPrice;
	}

	public String getpImage() {
		return pImage;
	}

	public void setpImage(String pImage) {
		this.pImage =pImage;
	
	}

	public void setId(int id) {
		// TODO Auto-generated method stub
		this.id=id;
	}
	
}
