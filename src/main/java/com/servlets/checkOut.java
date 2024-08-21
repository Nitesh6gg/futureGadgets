package com.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import com.connection.DbConnect;
import com.dao.OrderDao;
import com.entity.Cart;
import com.entity.Order;
import com.entity.User;

@WebServlet("/checkOutServlet")
public class checkOut extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out=response.getWriter()){
		HttpSession session=request.getSession();	
		ArrayList<Cart>cart_List=(ArrayList<Cart>)session.getAttribute("cart-list");	
			
		//user authentication
		User us=(User)request.getSession().getAttribute("user");
		//check auth and cartlist
		if(cart_List!=null && us!=null) {
			for(Cart c:cart_List){
				Order o=new Order();
				o.setId(c.getId());
				o.setUserId(us.getId());
				o.setOrderQuantity(c.getQuantity());
				o.setProductCategory(c.getpCategory());
				o.setProductName(c.getpName());
				o.setProductPrice((int) c.getpPrice());
				o.setProductId(c.getId());
				
				System.out.println("o:"+o);
				
				OrderDao oDao=new OrderDao(DbConnect.getConnection());
				boolean result=oDao.insertOrder(o);
				if(!result)break;	
			}
			cart_List.clear();
			response.sendRedirect("orderConfirm.jsp");	
		}else {
			if(us==null)response.sendRedirect("login.jsp");
			response.sendRedirect("cart.jsp");
			
		}	
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
