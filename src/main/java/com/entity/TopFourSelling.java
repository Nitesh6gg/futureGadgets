package com.entity;

public class TopFourSelling {
private String topSellingName;
private String topSellingSold;
private String topSellingPrice;

public TopFourSelling(){}

public TopFourSelling(String topSellingName, String topSellingSold,String topSellingPrice) {
	super();
	this.topSellingName = topSellingName;
	this.topSellingSold = topSellingSold;
	this.setTopSellingPrice(topSellingPrice);
}
public String getTopSellingName() {
	return topSellingName;
}


public void setTopSellingName(String topSellingName) {
	this.topSellingName = topSellingName;
}


public String getTopSellingSold() {
	return topSellingSold;
}


public void setTopSellingSold(String topSellingSold) {
	this.topSellingSold = topSellingSold;
}


public String getTopSellingPrice() {
	return topSellingPrice;
}

public void setTopSellingPrice(String topSellingPrice) {
	this.topSellingPrice = topSellingPrice;
}

@Override
public String toString() {
	return "TopFourSelling [topSellingName=" + topSellingName + ", topSellingSold=" + topSellingSold
			+ ", topSellingPrice=" + topSellingPrice + "]";
}


}
