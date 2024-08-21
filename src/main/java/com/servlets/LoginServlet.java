package com.servlets;
import java.io.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.connection.DbConnect;
import com.dao.*;
import com.entity.*;


@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String pass=request.getParameter("password");
		
		UserDao dao=new UserDao(DbConnect.getConnection());
		User user=dao.LoginUser(email, pass);
		HttpSession session=request.getSession();
		if(user==null) {
			PrintWriter out=response.getWriter();
			out.println("invalid");
			session.setAttribute("invalidMsg","Invalid Email & Password");
			response.sendRedirect("login.jsp");
			
		}
		
		else {
			PrintWriter out=response.getWriter();
			session.setAttribute("user", user);
			if(user.getUserType().equals("normal")) {
				response.sendRedirect("index.jsp");	
			}else if(user.getUserType().equals("admin")) {
				response.sendRedirect("admin.jsp");
			}else {
				out.println("we have not identify you");
				response.sendRedirect("index.jsp");
			}

		}
		
	}

}
