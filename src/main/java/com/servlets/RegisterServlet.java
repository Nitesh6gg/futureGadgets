package com.servlets;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.connection.DbConnect;
import com.dao.*;
import com.entity.*;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response, String usertype) throws ServletException, IOException {
		response.setContentType("text/html");
		
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		
		String check=request.getParameter("check");
		if(check==null) {
			session.setAttribute("checkMsg","Term and condtion not checked");
			response.sendRedirect("register.jsp");
		//("terms and condition not checked");
		}else {
			String name=request.getParameter("user_name");
			String email=request.getParameter("user_email");
			String password=request.getParameter("user_password");		
		
		//create user object and set all data to that object
		User u=new User(0, name,email,password, password, password, usertype);
		//
		
		//creating user userDao object
		UserDao dao=new UserDao(DbConnect.getConnection());
		if(dao.SaveUser(u)) {
			session.setAttribute("successMsg","Register successfully");
			response.sendRedirect("register.jsp");
			//("Register successfully");
		}else {
			session.setAttribute("errorMsg","something went wrong!");
			response.sendRedirect("register.jsp");
			//("error! something went wrong");
		}
	
		}
		}
	}
	
	


