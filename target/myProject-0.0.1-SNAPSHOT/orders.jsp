

<%@page import="com.connection.DbConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@page import="com.entity.*"%>
<%@page import="com.dao.*"%>
<%@page import="java.util.*"%>

<%
User us = (User) request.getSession().getAttribute("user");
if (us != null) {
	request.setAttribute("us", us);
}
User auth = (User) request.getSession().getAttribute("user");
List<Order> orders = null;
if (auth != null) {
	request.setAttribute("auth", auth);
	orders = new OrderDao(DbConnect.getConnection()).userOrders(auth.getId());
} else {
	response.sendRedirect("login.jsp");
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
<title>Your orders</title>
<%@ include file="component/allcss.jsp"%>
<style>


</style>
</head>
<body>
<%@ include file="component/navbar.jsp"%>

<section class="h-100 ">
  <div class="container py-4 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-lg-10 col-xl-100">
        <div class="card" style="border-radius: 10px;">
          <div class="card-header px-10 py-6">
            <h5 class="text mb-0">your Orders<span></span></h5>
          </div>
          
          <div class="card-body p-4">
            <div class="d-flex justify-content-between align-items-center mb-4">
              <p class="lead fw-normal mb-0">Receipt</p>
              <p class="small text-muted mb-0">Order History</p>
            </div>

             <%
               if(orders!=null){
               for(Order o:orders){
             %>
           
            <div class="card shadow-0 border mb-4 border border-dark border-bottom-0 ">
              <div class="card-body">
                <div class="row">
                  <div class="col-md-2">
                    <img src="img_product/iphone-14-pro.jpeg"
                      class="img-fluid" alt="Phone">
                  </div>
                  <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                    <p class="text-muted mb-0"><%=o.getProductName() %></p>
                  </div>
                  <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                    <p class="text-muted mb-0 small">White</p>
                  </div>
                  <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                    <p class="text-muted mb-0 small">Capacity: 128GB</p>
                  </div>
                  <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                    <p class="text-muted mb-0 small">Qty: <%=o.getOrderQuantity() %></p>
                  </div>
                  <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                    <p class="text-muted mb-0 small"> &#8377;<%=o.getProductPrice()/o.getOrderQuantity() %></p>
                  </div>
                </div>
                
                <!-- track order-->
                <hr class="mb-4" style="background-color: #272343; opacity: 1;">
                <div class="row d-flex align-items-center">
                  <div class="col-md-2">
                    <p class="text-muted mb-0 small">Track Order</p>
                  </div>
                  
                  <!-- track order progess bar-->
                 
                  <div class="col-md-10">
                    <div class="progress" style="height: 6px; border-radius: 16px;">
                    
                     <!-- track order progess bar apply loop to get order status-->
                    
                    <%
                    	if(o.getOrderStatus().contains("delivered")){
                    %>
                    	
                    		  <div class="progress-bar" role="progressbar"
                              style="width: 100%; border-radius: 16px; background-color: #4ef037;" aria-valuenow="5"
                              aria-valuemin="0" aria-valuemax="100">
                              </div>
                        <%}else if(o.getOrderStatus().contains("shipped")){%>
                    		<div class="progress-bar" role="progressbar"
                              style="width: 16%; border-radius: 16px; background-color: ##32CD32;" aria-valuenow="5"
                              aria-valuemin="0" aria-valuemax="100">
                            </div>
                    	<%}else if(o.getOrderStatus().contains("ofd")){%>
                    		<div class="progress-bar" role="progressbar"
                              style="width: 50%; border-radius: 16px; background-color: #4ef037;" aria-valuenow="5"
                              aria-valuemin="0" aria-valuemax="100">
                            </div>
                    	<%}else if(o.getOrderStatus().contains("cancel")){%>
                    		<div class="progress-bar" role="progressbar"
                              style="width: 5%; border-radius: 16px; background-color: #FF0000;" aria-valuenow="5"
                              aria-valuemin="0" aria-valuemax="100">
                            </div>
                    	<%}else if(o.getOrderStatus().contains("pending")){%>
                    		<div class="progress-bar" role="progressbar"
                                    style="width: 0%; border-radius: 16px; background-color: #4ef037;" aria-valuenow="5"
                                    aria-valuemin="0" aria-valuemax="100">
                             </div>
                    	<%}
                        %>
                    
                      
                       
                       
                    </div>
                    
                     
                    <!-- track order progess bar end-->
                    
                    
                    
                    <div class="d-flex justify-content-around mb-1">
                    <p class="text-muted mt-1 mb-0 small ms-xl-5">Shipped</p>
                      <p class="text-muted mt-1 mb-0 small ms-xl-5">Out for delivery</p>
                      <p class="text-muted mt-1 mb-0 small ms-xl-5">Delivered</p>
                    </div>
                  </div>
                </div>
                
                
                <hr class="mb-4" style="background-color: #272343; opacity: 1;">
                <!-- price -->
                    <div class="d-flex justify-content-between pt-1">
              <p class="fw-bold mb-0">Order Details</p>
              <p class="text-muted mb-0"><span class="fw-bold me-4">Delivery Charges :</span> &#8377;0</p>
            </div>

            <div class="d-flex justify-content-between pt-2">
              <p class="text-muted mb-0">Invoice Number : #FG<%=o.getOrderId() %></p>
              <p class="text-muted mb-0"><span class="fw-bold me-4">Discount :</span> &#8377;0</p>
            </div>

            <div class="d-flex justify-content-between">
              <p class="text-muted mb-0">Invoice Date : <%=o.getDate()%></p>
              <p class="text-muted mb-0"><span class="fw-bold me-4">GST 18% :</span> &#8377;<%=o.getProductPrice()/100*18 %></p>
            </div>

            <div class="d-flex justify-content-between mb-5">
              <p class="text-muted mb-0">Category : <%=o.getProductCategory() %></p>
              <p class="text-muted mb-0"><span class="fw-bold me-4">Total :</span> &#8377;<%=o.getProductPrice() %></p>
            </div>
          </div>
          
           <div class="card-footer border-0 px-6 py-1"
            style="background-color: #0275d8; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">
            <h5 class="d-flex align-items-center justify-content-end text-white text-uppercase mb-0">Total
              paid: <span class="h2 mb-0 ms-2">&#8377;<%=o.getProductPrice() %></span></h5>
          </div>
          </div>
          <%}	
		  }%>	
                
 </div>
 </div>
 </div>
 </div>
 </div>
            
        
</section>
	
</body>
</html>