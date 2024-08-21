package com.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.*;

import java.util.*;

import com.entity.Cart;

@WebServlet("/addToCartServlet")
public class AddToCartServlet extends HttpServlet {
	
 
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		try(PrintWriter out=response.getWriter()){
			ArrayList<Cart>cartList=new ArrayList<>();
			int id=Integer.parseInt(request.getParameter("id"));
			Cart cm=new Cart();
			cm.setId(id);
			cm.setQuantity(1);
			
			HttpSession session=request.getSession();
			ArrayList<Cart>cart_List=(ArrayList<Cart>)session.getAttribute("cart-list");
			
			if(cart_List==null) {
				cartList.add(cm);
				session.setAttribute("cart-list", cartList);
				response.sendRedirect("phone.jsp");	
			}else {
				cartList=cart_List;
				boolean exist=false;
				for(Cart c:cart_List) {
					if(c.getId()==id) {
						exist=true;
						System.out.println("item already exist");
						response.sendRedirect("phone.jsp");
						
					}	
				}
				if(!exist) {
					cartList.add(cm);
					response.sendRedirect("phone.jsp");
				}
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
