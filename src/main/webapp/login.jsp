<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.entity.*" %>

<%@page import="com.entity.*" %>
<%@page import="com.dao.*" %>
<%@page import="java.util.*" %>

<% User us=(User)request.getSession().getAttribute("us"); 
if(us!=null){
request.setAttribute("us",us);
response.sendRedirect("index.jsp");
}

//this is for cart no.
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);

}
%>    
      
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>login</title>
<%@ include file="component/allcss.jsp" %>
<style>

.divider:after,
.divider:before {
content: "";
flex: 1;
height: 1px;
background: #eee;
}
.h-custom {
height: calc(100% - 73px);
}
@media (max-width: 450px) {
.h-custom {
height: 100%;
}
}

</style>
</head>
<body>
<%@ include file="component/navbar.jsp" %>
<section class="vh-100">
  <div class="container-fluid h-custom">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-md-9 col-lg-6 col-xl-5">
        <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp"
          class="img-fluid" alt="Sample image">
      </div>
      <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
        
          
          <div class="divider d-flex align-items-center my-4">
            <p class="text-center fw-bold mx-3 mb-0">Sing-in</p>
          </div>
          
          <form action="loginServlet" method="post">
          
            <%
            String invalidMsg=(String)session.getAttribute("invalidMsg");
           
            if(invalidMsg!=null){
            %>
            <p class="text-danger text-center"> <%=invalidMsg %></p>
            <%
            session.removeAttribute("invalidMsg");
            }
            %>
            
            
            <%
           
            String logoutMsg=(String)session.getAttribute("logoutMsg");
            if(logoutMsg!=null){
            %>
            <p class="text-success text-center"> <%=logoutMsg %></p>
            <%
            session.removeAttribute("logoutMsg");
            }
            %>
          

          <!-- Email input -->
          <div class="form-outline mb-4">
            <input type="email" required name="email" id="form3Example3" class="form-control form-control-lg"
              placeholder="Enter email address" />
            <label class="form-label" for="form3Example3"></label>
          </div>

          <!-- Password input -->
          <div class="form-outline mb-3">
            <input type="password" required name="password" id="form3Example4" class="form-control form-control-lg"
              placeholder="Enter password" />
            <label class="form-label" for="form3Example4"></label>
          </div>

          <div class="d-flex justify-content-between align-items-center">
            <!-- Checkbox -->
            <div class="form-check mb-0">
              <input class="form-check-input me-2" type="checkbox" value="" id="form2Example3" />
              <label class="form-check-label" for="form2Example3">
                Remember me
              </label>
            </div>
            <a href="#!" class="text-body">Forgot password?</a>
          </div>

          <div class="text-center text-lg-start mt-4 pt-2">
            <button type="submit" class="btn btn-primary btn-lg"
              style="padding-left: 2.5rem; padding-right: 2.5rem;">Login</button>
            <p class="small fw-bold mt-2 pt-1 mb-0">Don't have an account? <a href="register.jsp"
                class="link-danger">Register</a></p>
          </div>

        </form>
      </div>
    </div>
  </div>
</section>

</body>
</html>