package com.dao;
import java.io.PrintWriter;
import java.sql.*;
import java.text.SimpleDateFormat;  

import com.entity.*;

//import jakarta.security.auth.message.callback.PrivateKeyCallback.Request;

import java.util.*;
import java.util.Date;
import java.time.LocalDate;

public class OrderDao {
	private Connection con;
	private int id;

	public OrderDao(Connection con) {
		this.con = con;
	}

	public boolean insertOrder(Order o) {
		boolean result = false;
		try {
			String query = "insert into orders(o_id,p_id,p_name,p_category,p_price,o_quantity,u_id,U_name,o_date,o_status)values(?,?,?,?,?,?,?,?,?,?)";

			PreparedStatement pst = this.con.prepareStatement(query);
			SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");  
		    Date date = new Date();
		    String d = formatter.format(date);
		    String pending="pending";
			pst.setInt(1, o.getOrderId());
			System.out.println("putting data");
			System.out.println("product name:"+o.getProductName());
			System.out.println("product price:"+o.getProductPrice());
			pst.setInt(2, o.getProductId());
			pst.setString(3, o.getProductName());
			pst.setString(4, o.getProductCategory());
			pst.setInt(5, o.getProductPrice()*o.getOrderQuantity());
			pst.setInt(6, o.getOrderQuantity());
			pst.setInt(7, o.getUserId());
			pst.setString(8, o.getUserName());
			//for date set in database
			pst.setString(9, d);
			//pst.setString(9, o.getDate());
			pst.setString(10, pending);
			pst.executeUpdate();
			result = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	public List<Order> userOrders(int id){
		List<Order> list=new ArrayList<>();
		try {
			String query="select * from orders where u_id=? order by orders.o_id desc";
			PreparedStatement pst=this.con.prepareStatement(query);
			pst.setInt(1, id);
			ResultSet rs=pst.executeQuery();
			while(rs.next()) {
				Order order=new Order();
				ProductDao productDao=new ProductDao(this.con);
				int pId=rs.getInt("p_id");
				
				Product product = productDao.getSingleProduct(pId);
				order.setOrderId(rs.getInt("o_id"));
				order.setProductId(rs.getInt("p_id"));
				order.setProductName(rs.getString("p_name"));
				order.setProductCategory(rs.getString("p_category"));
				order.setProductPrice(rs.getInt("p_price"));
				order.setOrderQuantity(rs.getInt("o_quantity"));
				order.setDate(rs.getString("o_date"));
				order.setOrderStatus(rs.getString("o_status"));
				list.add(order);	
			}	
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
    public List<orderList> allOrderList() {
    	List<orderList> lists=new ArrayList<>();
    	
		try{
			String query="select * from orders";
			PreparedStatement pst=this.con.prepareStatement(query);
			ResultSet rs=pst.executeQuery();
			while(rs.next()) {
				orderList ol=new orderList();
				ol.setOrderId(rs.getInt("o_id"));
				ol.setDate(rs.getString("o_date"));
				ol.setProductName(rs.getString("p_name"));
				ol.setProductCategory(rs.getString("p_category"));
				ol.setProductPrice(rs.getInt("p_price"));
				ol.setOrderQuantity(rs.getInt("o_quantity"));
				ol.setUserId(rs.getInt("u_id"));
				ol.setUserName(rs.getString("u_name"));
				ol.setProductId(rs.getInt("p_id"));
				lists.add(ol);
	
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		return lists;
    	
    }
    
    public List<TopFourSelling> topSelling(){
    List<TopFourSelling>toplist=new ArrayList<TopFourSelling>();
    	
		try{
			String query="select p_name,SUM(o_quantity)AS total_sold from orders GROUP BY p_name ORDER BY total_sold DESC";
			PreparedStatement pst=this.con.prepareStatement(query);
			ResultSet rss=pst.executeQuery();
			while(rss.next()) {
				TopFourSelling tfs=new TopFourSelling();
				tfs.setTopSellingName(rss.getString(1));
				
				
				tfs.setTopSellingSold(rss.getString(2));
				
				toplist.add(tfs);	
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		return toplist;
    }
   
}
