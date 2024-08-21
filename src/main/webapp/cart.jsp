<%@page import="com.connection.DbConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@page import="com.entity.*"%>
<%@page import="com.dao.*"%>

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
<meta charset="ISO-8859-1">
<title>cart page</title>
<%@ include file="component/allcss.jsp"%>
<style>
.d-button{
border-radius: 12px;
}
</style>
</head>
<body>
	<%@ include file="component/navbar.jsp"%>

	<div class="container">
		<div class="d-flex py-3">
			<h3>Total Price: ${(total>0)?total:0}</h3>
			<a class="mx-3 btn btn-primary" href="checkout.jsp">Checkout</a>
		</div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">price</th>
					<th scope="col">Quantity</th>
					<th scope="col">Cancel</th>
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
					<td><%=c.getpCategory()%></td>
				
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
								<!--	<button type="submit" class="btn btn-primary">Buy</button>-->
							</div>
						

					</td>
					<td><a class="mx-3 btn btn-dark" href="remove-cart-servlet?id=<%=c.getId()%>">Remove <span class="fa-solid fa-delete-left"></span></a></td>
				</tr>
				
				
  
				<%
				}
				}
				%>
				
			
			</tbody>
		</table>
	</div>

	<!-- footer -->





</body>
</html>