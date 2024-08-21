package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import com.entity.*;

public class CategoryDao {

	private Connection con;
	public CategoryDao(Connection con) {
		this.con = con;
	}
	
	
	public int SaveCategory(Category cat) {
		
		try {
			String query = "insert into category (categoryTitle,categoryDescription) values(?,?)";

			PreparedStatement pst = this.con.prepareStatement(query);
		
			pst.setString(1, cat.getTitle());
			System.out.println("title:"+cat.getTitle());
			pst.setString(2, cat.getDescription());
			System.out.println("des:"+cat.getDescription());
			pst.executeUpdate();
		System.out.println("insert in category successfully");
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0 ;
	}
	
}
