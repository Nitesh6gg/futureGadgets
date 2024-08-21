<%@page import="com.connection.DbConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>  
<%@page import="java.util.*" %>     
<%@page import="com.entity.*" %> 
<%@page import="com.dao.*" %>

<% User us=(User)request.getSession().getAttribute("user"); 
if(us!=null){
request.setAttribute("us",us);
//response.sendRedirect("login.jsp");
}

ProductDao pd=new ProductDao(DbConnect.getConnection());
List<Product>products=pd.getAllProducts();


// this is for cart numbering
ArrayList<Cart> cart_list = (ArrayList<Cart>)session.getAttribute("cart-list");
if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);

}
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SmartPhone</title>
<%@ include file="component/allcss.jsp" %>
<style type="text/css">

/* The snackbar - position it at the bottom and in the middle of the screen */
#snackbar {
  visibility: hidden; /* Hidden by default. Visible on click */
  min-width: 250px; /* Set a default minimum width */
  margin-left: -125px; /* Divide value of min-width by 2 */
  background-color: #28282B; /* Black background color */
  color: #ffffff; /* White text color */
  text-align: center; /* Centered text */
  border-radius: 25px; /* Rounded borders */
  padding: 16px; /* Padding */
  position: fixed; /* Sit on top of the screen */
  z-index: 1; /* Add a z-index if needed */
  left: 50%; /* Center the snackbar */
  bottom: 30px; /* 30px from the bottom */
}

/* Show the snackbar when clicking on a button (class added with JavaScript) */
#snackbar.show {
  visibility: visible; /* Show the snackbar */
  /* Add animation: Take 0.5 seconds to fade in and out the snackbar.
  However, delay the fade out process for 2.5 seconds */
  -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
  animation: fadein 0.5s, fadeout 0.5s 2.5s;
}

/* Animations to fade the snackbar in and out */
@-webkit-keyframes fadein {
  from {bottom: 0; opacity: 0;}
  to {bottom: 30px; opacity: 1;}
}

@keyframes fadein {
  from {bottom: 0; opacity: 0;}
  to {bottom: 30px; opacity: 1;}
}

@-webkit-keyframes fadeout {
  from {bottom: 30px; opacity: 1;}
  to {bottom: 0; opacity: 0;}
}

@keyframes fadeout {
  from {bottom: 30px; opacity: 1;}
  to {bottom: 0; opacity: 0;}
}
</style>
</head>
<body>
<%@ include file="component/navbar.jsp" %>
<div class="container">
<div class="card-header my-3">SmartPhone</div>
<div class="row">

<%
if(!products.isEmpty()){
	for(Product p:products){ %>
		<div class="col-md-4 my-3">
		<div class="card" style="width: 18rem;">
		  <img class="card-img-top" src="img_product/iphone-14-pro.jpeg" alt="Card image cap">
		  <div class="card-body">
		    <h5 class="card-title"><%=p.getpName() %></h5>
		    <h6 class="category">Category: <%=p.getpCategory() %></h6>
		     <h6 class="price">MRP: <%=p.getpPrice()/100*120 %></h6>
		    <h5 class="price">Offer Price: <%=p.getpPrice() %></h5>
		   
		    <div class="mt-3 d-flex justify-content-between">
		    <p><strong>
		   
		   20% off
		    
		    </strong></p>
		    <a href="addToCartServlet?id=<%=p.getId() %>" class="btn btn-primary" >Add to cart</a>
		    
		   
		   
		    </div>
		  </div>
		</div>
		</div>
		
	<%}
}
%>


 

<!-- The actual snackbar -->


</div>
</div>

<script>
	
	<!--table search-->	
	$(document).ready(function(){
		  $("#myInput").on("keyup", function() {
		    var value = $(this).val().toLowerCase();
		    $("#myTable tr").filter(function() {
		      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		    });
		  });
		});
	<!--table search end-->	
	<!--tool tip-->	

	$(document).ready(function(){
		  $('[data-toggle="tooltip"]').tooltip();   
		});
	<!--tool tip end-->	
	
		let sidebar = document.querySelector(".sidebar");
		let sidebarBtn = document.querySelector(".sidebarBtn");
		sidebarBtn.onclick = function() {
			sidebar.classList.toggle("active");
			if (sidebar.classList.contains("active")) {
				sidebarBtn.classList.replace("bx-menu", "bx-menu-alt-right");
			} else
				sidebarBtn.classList.replace("bx-menu-alt-right", "bx-menu");
		}
		
		
		
	</script>

</body>
</html>