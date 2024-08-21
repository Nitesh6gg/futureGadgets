package com.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import com.connection.DbConnect;
import com.dao.OrderDao;
import com.entity.*;

@WebServlet("/orderNowServlet")
public class OrderNowServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text,html");
		
		
		
		try (PrintWriter out=response.getWriter()){
			
			User auth=(User) request.getSession().getAttribute("user");
			System.out.println(auth);
			if(auth!=null) {
				System.out.println("if checking");
				String productId=request.getParameter("id");
				System.out.println("product id:"+productId);
				int productQuantity=Integer.parseInt(request.getParameter("quantity"));
				System.out.println("p quantity:"+productQuantity);
				String productN=request.getParameter("pName");
				System.out.println("p name:"+productN);
				String pCategory=request.getParameter("pCategory");
				System.out.println("order servlet pcategory:"+pCategory);
				String o_status=request.getParameter("o_status");
				System.out.println(" current status is"+o_status);
				
				//conveting double into int (10.00 to 10)
				String a=request.getParameter("pPrice");
				int b=new BigDecimal(a).intValue();
				int productP=(b);
				
				
				
				
				if(productQuantity<=0) {
					productQuantity=1;
				}
				
				Order o=new Order();
				
				//automatic increase
				//o.setOrderId();
				
				out.println("order now page");
				o.setProductId(Integer.parseInt(productId));
				o.setProductName(productN);
			    o.setProductPrice(productP);
				o.setOrderQuantity(productQuantity);
				o.setProductCategory(pCategory);
				o.setUserId(auth.getId());
				o.setUserName(auth.getName());
				o.setOrderStatus(o_status);
				
				
				OrderDao orderDao=new OrderDao(DbConnect.getConnection());
				boolean result=orderDao.insertOrder(o);
				if(result) {
					//after order remove from cart
					ArrayList<Cart>cart_List=(ArrayList<Cart>)request.getSession().getAttribute("cart-list");
		    		if(cart_List!=null) {
		    			for(Cart c:cart_List) {
		    				if(c.getId()==Integer.parseInt(productId)) {
		    					cart_List.remove(cart_List.indexOf(c));
		    					break;
		    				}
		    			}
		    			
		    		}
					
					response.sendRedirect("orderConfirm.jsp");
				}else{
				    out.println("order failed");
					}
				
				
				
				
			}else {
				response.sendRedirect("login.jsp");
			}
			
			}catch(Exception e) {
				e.printStackTrace();
		
		}
	}

}
