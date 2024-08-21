package com.servlets;
import java.util.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import com.entity.*;
@WebServlet("/remove-cart-servlet")
public class RemoveCartServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setContentType("text/html");
    try {
    	String id=request.getParameter("id");
    	if(id!=null) {
    		ArrayList<Cart>cart_List=(ArrayList<Cart>)request.getSession().getAttribute("cart-list");
    		if(cart_List!=null) {
    			for(Cart c:cart_List) {
    				if(c.getId()==Integer.parseInt(id)) {
    					cart_List.remove(cart_List.indexOf(c));
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
