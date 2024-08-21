package com.dao;
import java.sql.*;

import com.entity.*;
public class UserDao {
	private Connection con;
	public UserDao(Connection con) {
		this.con=con;
	}
	//method to insert user to data base
	public boolean SaveUser(User u) {
		boolean f=false;
		try {
			//user database
			String query="insert into user(name,email,password)values(?,?,?)";
			PreparedStatement ps=this.con.prepareStatement(query);
			ps.setString(2, u.getName());
			ps.setString(3, u.getEmail());
			ps.setString(4, u.getPassword());
			ps.executeUpdate();
			f=true;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;	
	}


public User LoginUser(String email,String pass){
	User user=null;
	try {
		String sql="select * from user where email=? and password=?";
	PreparedStatement ps=con.prepareStatement(sql);
	ps.setString(1,email);
	ps.setString(2,pass);
	
	ResultSet rs=ps.executeQuery();
	if(rs.next()) {
		user=new User( 0, sql, sql,sql, sql, sql, sql);
		user.setId(rs.getInt(1));
		user.setName(rs.getString(2));
		user.setEmail(rs.getString(3));
		user.setPassword(rs.getString(4));
		user.setPhoneNo(rs.getString(5));
		user.setAddress(rs.getString(6));
		user.setUserType(rs.getString(8));
		
	}
	}catch(Exception ex) {
		ex.printStackTrace();
	}
	return user;
}

public boolean updateProfile(User u) {
	boolean f=false;
	try {
		//user database
		String query="update user set phone=?,address=?,password=? where id=?";
		PreparedStatement ps=this.con.prepareStatement(query);
		
		ps.setString(1, u.getPhoneNo());
		ps.setString(2, u.getAddress());
		ps.setString(3, u.getPassword());
		ps.setInt(4, u.getId());
		ps.executeUpdate();
		f=true;
		System.out.println("database profile:"+u.getPhoneNo()+"\n"+u.getAddress()+"\n"+u.getPassword()+"id;"+u.getId());
	}catch(Exception e) {
		e.printStackTrace();
	}
	return f;	
}
 
}