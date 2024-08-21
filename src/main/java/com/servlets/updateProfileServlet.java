package com.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.connection.DbConnect;

import com.dao.UserDao;
import com.entity.User;

@WebServlet("/updateProfileServlet")
public class updateProfileServlet extends HttpServlet {
	
   
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		try(PrintWriter out=response.getWriter()){
			HttpSession session=request.getSession();
			
	    //getting data from jsp page
		String phoneNo=request.getParameter("phoneNo");
		String address=request.getParameter("update-address");
		String password=request.getParameter("update-password");
		
		//getting current user from session
				User user=(User)session.getAttribute("user");
				int currentId=user.getId();
		//end
		
		//insert data in entity
		User up=new User();	
		up.setPhoneNo(phoneNo);
		up.setPassword(password);
		up.setAddress(address);
		up.setId(currentId);
		
		
		
		
		//insert in data base
		UserDao userDao=new UserDao(DbConnect.getConnection());
		if(userDao.updateProfile(up)) {
			System.out.println("update");
			session.setAttribute("updateMsg","update successfully..");
			response.sendRedirect("profile.jsp");
			//("update successfully");
		}else {
			session.setAttribute("profileErrorMsg","Failed to update");
			response.sendRedirect("index.jsp");
			//("error! something went wrong");
		}
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
