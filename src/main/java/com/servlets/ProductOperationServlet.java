package com.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.*;


import com.connection.DbConnect;
import com.dao.CategoryDao;
import com.dao.ProductDao;
import com.entity.Category;
import com.entity.Product;



@MultipartConfig
@WebServlet("/ProductOperationServlet")
public class ProductOperationServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//two servlet opertion
		//1:add category
		//2:add products
		HttpSession session=request.getSession();
		session.setAttribute("operationMsg","Added Successfully..");
		session.setAttribute("opMsg","Added Successfully..");
		response.sendRedirect("admin.jsp");
		
		String op=request.getParameter("operation");
		if(op.trim().equals("addCategory")) {
			//fetching category data
			String title=request.getParameter("catTitle");
			String description=request.getParameter("catDescription");
			
			Category c=new Category();
			c.setTitle(title);
			c.setDescription(description);
		//category database save;
			CategoryDao categoryDao=new CategoryDao(DbConnect.getConnection()); 
				int catId=categoryDao.SaveCategory(c);
			
			
			
		}else {
			if(op.trim().equals("addProduct")) {
				//fetching product data
				String product_title=request.getParameter("product-title");
				String product_category=request.getParameter("product-category");
				String product_price=request.getParameter("product-price");
				Part part=request.getPart("product-image");
				
			
				
				Product pp=new Product();
				pp.setpName(product_title);
				pp.setpCategory(product_category);
				pp.setpPrice(Integer.parseInt(product_price));
				pp.setpImage(part.getSubmittedFileName());
				//product database save;
				ProductDao productDao=new ProductDao(DbConnect.getConnection());
				productDao.insertProducts(pp);
				
				//pic upload
				//findout the path to upload img
				
			/*	String path=request.getRealPath("img")+File.separator+"img_product"+File.separator+part.getSubmittedFileName();
				
				//uploading code
				FileOutputStream fos=new FileOutputStream(path);
				InputStream is=part.getInputStream();
				
				//reading data
				byte[]data=new byte[is.available()];
				is.read(data);
				//writing the data
				fos.write(data);
				fos.close(); */
			}
		}
		
		
		
	}

}
