package com.dao;
import java.sql.*;
import java.util.*;

import com.entity.*;
public class ProductDao {
	private Connection con;
	private List<Cart> products;
	public ProductDao(Connection con) {
		this.con=con;
	}
//show all  product data in phone.jsp
public List<Product>getAllProducts(){
	List<Product>products=new ArrayList<Product>();
	try {
	    String query = "select * from Product";
	    PreparedStatement pst=this.con.prepareStatement(query);
	    ResultSet rs=pst.executeQuery();
	    while(rs.next()) {
	    	Product p=new Product();
	    	p.setId(rs.getInt("id"));
	    	p.setpName(rs.getString("pName"));
	    	p.setpCategory(rs.getString("pCategory"));
	    	p.setpPrice(rs.getDouble("pPrice"));
	    	p.setpImage(rs.getString("pImage"));
	    	products.add(p); 	
	    }	
	}catch(Exception e) {
		e.printStackTrace();
	}
	
	return products;
}
//show data in cart page.jsp
public List<Cart>getCartProduct(ArrayList<Cart>cartList){
	List<Cart>products=new ArrayList<Cart>();
	try {
		if(cartList.size()>0) {
			for(Cart item:cartList) {
				String query="select * from product where Id=?";
				PreparedStatement pst=con.prepareStatement(query);
				pst.setInt(1,item.getId());
				ResultSet rs=pst.executeQuery();
				while(rs.next()) {
					Cart row=new Cart();
					row.setId(rs.getInt("id"));
					row.setpName(rs.getString("pName"));
					row.setpCategory(rs.getString("pCategory"));
					row.setpPrice(rs.getDouble("pPrice"));
					row.setQuantity(item.getQuantity());
					products.add(row);
					
				}
				
			}
		}
	}catch(Exception e) {
		e.printStackTrace();
	}
	return products;	
}
public double getTotalCartPrice(ArrayList<Cart>cartList){
	List<Product>products=new ArrayList<Product>();
	double sum=0;
	try {
		if(cartList.size()>0) {
			for(Cart item:cartList) {
				String query="select pPrice from product where Id=?";
				PreparedStatement pst=con.prepareStatement(query);
				pst.setInt(1, item.getId());
				ResultSet rs=pst.executeQuery();
				
				while(rs.next()) {
					sum+=rs.getDouble("pPrice")*item.getQuantity();
					System.out.println(rs.getDouble("pPrice"));
					System.out.println(item.getQuantity());
				}
			}
		}
		
	}catch(Exception e) {
		e.printStackTrace();
	}
	return sum;
	
}

public Product getSingleProduct(int id) {
	Product row=null;
	try {
		String query="select * from product where id=?";
		PreparedStatement pst=this.con.prepareStatement(query);
		pst.setInt(1, id);
		ResultSet rs=pst.executeQuery();
		
		while(rs.next()) {
			row=new Product();
			row.setId(rs.getInt("id"));
		
			row.setpName(rs.getString("pName"));
	    	row.setpCategory(rs.getString("pCategory"));
			row.setpPrice(rs.getDouble("pPrice"));
			row.setpImage(rs.getString("pimage"));	
		}	
	}catch(Exception e) {
		e.printStackTrace();
		
	}
	return row;	
}

public boolean insertProducts(Product pp) {
	boolean f=false;
	try {
	    String query = "insert into Product(pName,pCategory,pPrice,pImage) values(?,?,?,?)";
	    PreparedStatement pst=this.con.prepareStatement(query);
	  
	  
	    	Product p=new Product();
	   
	    	pst.setString(1,pp.getpName());
	    	System.out.println(pp.getpName());
	    	pst.setString(2,pp.getpCategory());
	    	pst.setDouble(3,pp.getpPrice());
	    	System.out.println(pp.getpPrice());
	    	pst.setString(4,pp.getpImage());
	    	pst.executeUpdate();
	    	f=true;
	    	System.out.println("insert in productDao successfully");
	}catch(Exception e) {
		e.printStackTrace();
		
	}
	
	return f;
}


}