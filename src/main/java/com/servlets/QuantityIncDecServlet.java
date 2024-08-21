package com.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.*;

import com.entity.Cart;


@WebServlet("/quantity-inc-dec")
public class QuantityIncDecServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		try{
			String action=request.getParameter("action");
			int id=Integer.parseInt(request.getParameter("id"));
			
		ArrayList<Cart>cart_list=(ArrayList<Cart>)request.getSession().getAttribute("cart-list");
		
			if(action!=null && id>=1) {
				if(action.equals("inc")) {
					for(Cart cc:cart_list) {
						if(cc.getId()==id) {
							int quantity=cc.getQuantity();
							quantity++;
							cc.setQuantity(quantity);
							response.sendRedirect("cart.jsp");
						}
					}
					
				}if(action.equals("dec")) {
					for(Cart cc:cart_list) {
						if(cc.getId()==id && cc.getQuantity()>1) {
							int quantity=cc.getQuantity();
							quantity--;
							cc.setQuantity(quantity);
							break;
						}
					}
					response.sendRedirect("cart.jsp");	
				}
				
			}else {
				response.sendRedirect("cart.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	

}
