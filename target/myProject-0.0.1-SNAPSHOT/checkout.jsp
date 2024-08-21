<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.connection.DbConnect"%>	
<%@page import="com.entity.*" %>
<%@page import="com.dao.*" %>	
<%@page import="java.util.*"%>
<%@page errorPage="error.jsp" %>  

<%
User us = (User) request.getSession().getAttribute("user");
if (us != null) {
	request.setAttribute("us", us);
	//response.sendRedirect("login.jsp");
}
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;
if (cart_list != null) {
	ProductDao pDao = new ProductDao(DbConnect.getConnection());
	cartProduct = pDao.getCartProduct(cart_list);
	double total = pDao.getTotalCartPrice(cart_list);
	request.setAttribute("cart_list", cart_list);
	request.setAttribute("total", total);
	//session.removeAttribute("cart_list");

}
%>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
td1 {
  text-align: center;
}

</style>
<meta charset="ISO-8859-1">
<title>Checkout</title>
<%@ include file="component/allcss.jsp" %>
</head>
<body>

	<%@ include file="component/navbar.jsp" %>
	
	<div class="container">
	
		<div class="row mt-4">
			<div class="col-md-6">
				<!-- card -->

				<div class="card">
					<div class="card-body">
						<h3 class="text-center mb-5">Your selected items</h3>
						<div class="cart-body"></div>
						
						<table class="table table-light">
						<form action="orderNowServlet" method="post" class="form-inline">
			<thead>
			
				<tr>
					<th scope="col">Name</th>
					<th scope="col">price</th>
					<th scope="col">Quantity</th>
					<th scope="col">Remove</th>
				</tr>
			</thead>
			<tbody>
			
			
				<%
				if (cart_list != null) {
					for (Cart c : cartProduct) {
				%>
				
				<tr>
					<td><%=c.getpName()%></td>
					<input type="hidden" name="pName" value="<%=c.getpName()%>"class="form-input">
					<input type="hidden" name="pCategory" value="<%=c.getpCategory()%>"class="form-input">
					<td><%=c.getpPrice()%>
					<input type="hidden" name="pPrice" value="<%=c.getpPrice()%>"class="form-input">
					
					<td>
						
							<input type="hidden" name="id" value="<%=c.getId()%>"
								class="form-input">
							<div class="form-group d-flex justify-content-between">
								<a class="btn btn-sm btn-decre"
									href="quantity-inc-dec?action=dec&id=<%=c.getId()%>"><i
									class="fa fa-minus-circle"></i></a> <input type="text"
									<%System.out.println("inc-dec-servlet");%> name="quantity"
									class="form-control" value="<%=c.getQuantity()%>" readonly>
								<a class="btn btn-sm incre "
									href="quantity-inc-dec?action=inc&id=<%=c.getId()%>"><i
									class="fa fa-plus-circle"></i> </a>
								
							</div>
						<td><a style= text-align:center; href="remove-cart-servlet?id=<%=c.getId()%>"> <span class="fa fa-times"></span></a>	</td>

					
					
				</tr>
					
					
				
				
				
				<%
				}
				}
				%>	
				
				
		</tbody>
			
		</table>
		<hr style="height:2px;border-width:0;color:gray;background-color:gray">
		<td1><h4>Total Price: &#x20b9;${(total>0)?total:0}</h4></td1>
		<hr style="height:2px;border-width:0;color:gray;background-color:gray">
				
				
						
					</div>
				</div>


			</div>

			<div class="col-md-6">
				<!-- form details -->
				<div class="card">
					<div class="card-body">
						<h3 class="text-center mb-5">Shipping details</h3>
						
							
							<div class="form-group">
								<label for="exampleInputEmail1">Your Name:</label> <input value="<%=us.getName() %>"
									type="text" class="form-control" id="name"
									aria-describedby="emailHelp" placeholder="Enter your name">

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email Address:</label> <input value="<%=us.getEmail() %>"
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email">
								<small id="emailHelp" class="form-text text-muted">
									</small>
							</div>
							
							<div class="form-group">
								<label for="exampleFormControlTextarea1">Shipping Address:</label>
								<textarea  class="form-control" id="exampleFormControlTextarea1"
									rows="3" placeholder="Enter your address" >Address:<%=us.getAddress() %></textarea>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Your Contact Number</label> <input value="<%=us.getPhoneNo() %>"
									type="text" class="form-control" id="name"
									aria-describedby="emailHelp" placeholder="Enter your number">

							</div>
							<div class="container text-center">
							<button type="submit" class="btn btn-primary">Proceed to payment</button>
							<a href="index.jsp" class="btn btn-dark">Continue shopping</a>
							</div>
							</form>
						
					
					</div>
				</div>

			</div>

		</div>
		
	</div>
	</form>

</body>
</html>