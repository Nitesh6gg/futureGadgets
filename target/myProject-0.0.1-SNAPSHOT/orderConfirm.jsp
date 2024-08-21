<%@page import="com.connection.DbConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.connection.DbConnect.*" %> 
<%@page import="com.entity.*" %>
<%@page import="com.dao.*" %>
<%@page import="java.util.*" %>

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

%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>order-confirm</title>
<%@ include file="component/allcss.jsp" %>
<style type="text/css">
#balloon {
  width: 400px;
  display:block;
  height: 250px;
  margin-top: 20rem;
  margin:0 auto;
}

.balloon {
  width: 150px;
  height: 150px;
  background: linear-gradient(to top, #fe4a2b, #ff416d);
  border-radius: 50%;
  border: 4px solid #fe4b2b;
  position: absolute;
  left: 50%;
  top: 50px;
  transform: translate(-50%);
  animation: moving-balloon 3s ease infinite;
  
  &::after {
    content: "";
    position: absolute;
    top: 100px;
    left: 50%;
    transform: translate(-50%);
    border-top: 60px solid #fe4b2b;
	  border-left: 30px solid transparent;
	  border-right: 30px solid transparent;
	  height: 0;
	  width: 70px;
  }
  
  &::before {
    content: "";
    position: absolute;
    left: 50%;
    top: 150px;
    transform: translate(-50%);
    width: 70px;
    height: 25px;
    background-color: #E86B5A;
    border-radius: 5px;
  }
}

.basket {
  width: 42px;
  height: 28px;
  background: #D1C1A6;
  border-radius: 0 0 3px 3px;
  position: absolute;
  left: 50%;
  transform: translate(-50%);
  top: 270px;
  animation: moving-basket 3s ease infinite;
  
  &:before {
    content: "";
    position: absolute;
    width: 50px;
    height: 10px;
    background: #B2A082;
    border-radius: 3px;
    top: -10px;
    left: 50%;
    transform: translate(-50%);
  }

  &:after {
    content: "";
    width: 25px;
    height: 35px;
    position: absolute;
    top: -40px;
    left: 50%;
    transform: translate(-50%) perspective(50px) rotateX(-40deg);
    border-left: 2px solid #B2A082;
    border-right: 2px solid #B2A082;
  }
}

.cloud {
  position: absolute;
  top: 100px;
  right: 40px;
  width: 140px;
  height: 30px;
  background: #f4f8fc;
  border-radius:50px;
  animation: moving-cloud 3s ease infinite;
  
  &::before{
    content:"";
    position: absolute;
    top: -40px;
    left: 20px;
    width: 60px;
    height: 60px;
    background: #f4f8fc;
    border-radius: 50%;
  }
  
  &::after{
    content: "";
    position: absolute;
    top: -30px;
    right: 25px;
    width: 50px;
    height: 50px;
    background: #f4f8fc;
    border-radius: 50%;
  }
}


@keyframes moving-balloon {
	0% 	 {transform:  translate(-50%)}
	50% {transform: translate(-50%, -10%)}
}

@keyframes moving-basket {
	0% 	 {transform:  translate(-50%)}
	50% {transform: translate(-50%, -40%)}
}

@keyframes moving-cloud {
	0% 	 {transform:  translateX(0)}
	50% {transform: translateX(-7%)}
}


.rentalinfo{
  background:#f4f8fc;
  padding:2rem 4rem;;
  border-radius:12px; 
  max-width:800px;
  margin:0 auto;
}


#orderconfirmation{
    text-align:center;
}

.rentsection{
  margin:1rem 1rem 0;
}

.rentsection h3{
  margin-bottom:1rem;
}

.rentalgrid{
  display:grid;
  grid-template-columns: 1fr 1fr 1fr;
  max-width:800px;
  grid-row-gap:1.5rem;
  margin:0 auto;
}


.rentalgrid li{
  display:flex;
  flex-direction:column;
}

</style>

</head>
<body>
<%@ include file="component/navbar.jsp" %>
<div id="orderconfirmation">

<!--  <div id="balloon">
  <div class="balloon"></div>
  <div class="basket"></div>  
  <div class="cloud"></div>
</div>
-->
  
  <div class="rentalinfo">
  <img src="img/order-confirm.png" alt="Girl in a jacket" width="60" height="60">
  <h1>
  
  Your order is Confirmed!</h1>
  <p>We've sent you a mail with all the details.</p>
  
  
<section class="rentsection">
   <%
   if(orders!=null){   
   for(Order o:orders)

   {%>
   
   <h3>Transaction details</h3>
   <hr >
    <ul class="rentalgrid">
    
				
      <li>
    
        <h5>Date</h5>
        <p><%=o.getDate() %></p>
      </li>
      <li>
        <h5>Total</h5>
        <p><%=o.getProductPrice()%></p>
        <%System.out.println("order confirm "+o.getProductPrice()); %>
      </li>
      <li>
        <h5>Payment method</h5>
        <p>Credit Card</p>
      </li>
    </ul>
  
  </section>
  
  
  
    <section class="rentsection">
     <h3>product details</h3>
     <hr >
  <ul class="rentalgrid">
    <li>
        <h5>Invoice no:</h5>
        <p>#FG<%=o.getOrderId() %></p>
      </li>
   
      <li>
        <h5>Product Name</h5>
        <p> <%=o.getProductName() %></p>
      </li>
      <li>
        <h5>Quantity</h5>
        <p><%=o.getOrderQuantity() %></p>
      </li>
    
      <li>
        <h5>Delivery</h5>
        <p>4-5 days</p>
      </li>
     <li>
        <h5>Category</h5>
        <p><%=o.getProductCategory() %></p>
      </li>
     <li>
        <h5>Product-Price</h5>
        <p><%=o.getProductPrice()/o.getOrderQuantity() %></p>
      
      </li>
      
     
    </ul>
    <a href="index.jsp" class="btn btn-primary" >Continue Shopping</a>
     <%
			break;	}
  
				}
				%>
				 
  </section>
   
  </div>
  
  
  </div>
</body>
</html>