<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@page import="com.connection.DbConnect"%>    
<%@page import="java.util.*" %>     
<%@page import="com.entity.*" %> 
<%@page import="com.dao.*" %>

<% User us=(User)request.getSession().getAttribute("user"); 
if(us!=null){
request.setAttribute("us",us);
//response.sendRedirect("login.jsp");
}
//product database
ProductDao pd=new ProductDao(DbConnect.getConnection());
List<Product>products=pd.getAllProducts();
//orders database
OrderDao od=new OrderDao(DbConnect.getConnection());
List<orderList>lists=od.allOrderList();
//top selling obj
List<TopFourSelling>toplist=od.topSelling();

%>    
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>admin-panel</title>
<%@ include file="component/allcss.jsp"%>
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="responsive.css">

<style>
/* scrollable modal*/
.modal .modal1-body {
    max-height: 450px;
    overflow-y: auto;
}
/* scrollable modal*/


/* orderlist css*/
#customers {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}


#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #000000;
  color: white;
}
	
/* orderlist css end*/	

/* Googlefont Poppins CDN Link */
@import
	url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap')
	;

* 


{
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
}



.sidebar {
	position: fixed;
	height: 100%;
	width: 240px;
	background: #353935;
	transition: all 0.5s ease;
}

.sidebar.active {
	width: 60px;
}

.sidebar .logo-details {
	height: 80px;
	display: flex;
	align-items: center;
}

.sidebar .logo-details i {
	font-size: 28px;
	font-weight: 500;
	color: #fff;
	min-width: 60px;
	text-align: center;
}

.sidebar .logo-details .logo_name {
	color: #fff;
	font-size: 21px;
	font-weight: 500;
	
}

.sidebar .nav-links {
	margin-top: 10px;
}

.sidebar .nav-links li {
	position: relative;
	list-style: none;
	height: 50px;
}

.sidebar .nav-links li a {
	height: 100%;
	width: 100%;
	display: flex;
	align-items: center;
	text-decoration: none;
	transition: all 0.4s ease;
}

.sidebar .nav-links li a.active {
	background: #000000;
}

.sidebar .nav-links li a:hover {
	background: #000000;
}

.sidebar .nav-links li i {
	min-width: 50px;
	text-align: center;
	font-size: 18px;
	color: #fff;
}

.sidebar .nav-links li a .links_name {
	color: #fff;
	font-size: 15px;
	font-weight: 400;
	white-space: nowrap;
}

.sidebar .nav-links .log_out {
	position: absolute;
	bottom: 0;
	width: 100%;
}

.home-section {
	position: relative;
	background: #f5f5f5;
	min-height: 100vh;
	width: calc(100% - 240px);
	left: 240px;
	transition: all 0.5s ease;
}

.sidebar.active ~ .home-section {
	width: calc(100% - 60px);
	left: 60px;
}

.home-section nav {
	display: flex;
	justify-content: space-between;
	height: 80px;
	background: #fff;
	display: flex;
	align-items: center;
	position: fixed;
	width: calc(100% - 240px);
	left: 240px;
	z-index: 100;
	padding: 0 20px;
	box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
	transition: all 0.5s ease;
}

.sidebar.active ~ .home-section nav {
	left: 60px;
	width: calc(100% - 60px);
}

.home-section nav .sidebar-button {
	display: flex;
	align-items: center;
	font-size: 24px;
	font-weight: 500;
}

nav .sidebar-button i {
	font-size: 35px;
	margin-right: 10px;
}

.home-section nav .search-box {
	position: relative;
	height: 50px;
	max-width: 550px;
	width: 100%;
	margin: 0 20px;
}

nav .search-box input {
	height: 100%;
	width: 100%;
	outline: none;
	background: #F5F6FA;
	border: 2px solid #EFEEF1;
	border-radius: 6px;
	font-size: 18px;
	padding: 0 15px;
}

nav .search-box .bx-search {
	position: absolute;
	height: 40px;
	width: 40px;
	background: #2697FF;
	right: 5px;
	top: 50%;
	transform: translateY(-50%);
	border-radius: 4px;
	line-height: 40px;
	text-align: center;
	color: #fff;
	font-size: 22px;
	transition: all 0.4 ease;
}

.home-section nav .profile-details {
	display: flex;
	align-items: center;
	background: #;
	border: 2px solid #EFEEF1;
	border-radius: 6px;
	height: 50px;
	min-width: 190px;
	padding: 0 15px 0 2px;
}

nav .profile-details img {
	height: 40px;
	width: 40px;
	border-radius: 6px;
	object-fit: cover;
}

nav .profile-details .admin_name {
	font-size: 15px;
	font-weight: 500;
	color: #333;
	margin: 0 10px;
	white-space: nowrap;
}

nav .profile-details i {
	font-size: 25px;
	color: #333;
}

.home-section .home-content {
	position: relative;
	padding-top: 104px;
}

.home-content .overview-boxes {
	display: flex;
	align-items: center;
	justify-content: space-between;
	flex-wrap: wrap;
	padding: 0 20px;
	margin-bottom: 26px;
}

.overview-boxes .box {
	display: flex;
	align-items: center;
	justify-content: center;
	width: calc(100%/ 4 - 15px);
	background: #fff;
	padding: 15px 14px;
	border-radius: 12px;
	box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
}

.overview-boxes .box-topic {
	font-size: 20px;
	font-weight: 500;
}

.home-content .box .number {
	display: inline-block;
	font-size: 35px;
	margin-top: -6px;
	font-weight: 500;
}

.home-content .box .indicator {
	display: flex;
	align-items: center;
}

.home-content .box .indicator i {
	height: 20px;
	width: 20px;
	background: #8FDACB;
	line-height: 20px;
	text-align: center;
	border-radius: 50%;
	color: #fff;
	font-size: 20px;
	margin-right: 5px;
}

.box .indicator i.down {
	background: #e87d88;
}

.home-content .box .indicator .text {
	font-size: 12px;
}

.home-content .box .cart {
	display: inline-block;
	font-size: 32px;
	height: 50px;
	width: 50px;
	background: #cce5ff;
	line-height: 50px;
	text-align: center;
	color: #66b0ff;
	border-radius: 12px;
	margin: -15px 0 0 6px;
}

.home-content .box .cart.two {
	color: #2BD47D;
	background: #C0F2D8;
}

.home-content .box .cart.three {
	color: #ffc233;
	background: #ffe8b3;
}

.home-content .box .cart.four {
	color: #e05260;
	background: #f7d4d7;
}

.home-content .total-order {
	font-size: 20px;
	font-weight: 500;
}

.home-content .sales-boxes {
	display: flex;
	justify-content: space-between;
	/* padding: 0 20px; */
}

/* left box */
.home-content .sales-boxes .recent-sales {
	width: 65%;
	background: #fff;
	padding: 20px 30px;
	margin: 0 20px;
	border-radius: 12px;
	box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
}

.home-content .sales-boxes .sales-details {
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.sales-boxes .box .title {
	font-size: 24px;
	font-weight: 500;
	/* margin-bottom: 10px; */
}

.sales-boxes .sales-details li.topic {
	font-size: 20px;
	font-weight: 500;
}

.sales-boxes .sales-details li {
	list-style: none;
	margin: 8px 0;
}

.sales-boxes .sales-details li a {
	font-size: 18px;
	color: #333;
	font-size: 400;
	text-decoration: none;
}

.sales-boxes .box .button {
	width: 100%;
	display: flex;
	justify-content: flex-end;
}

.sales-boxes .box .button a {
	color: #fff;
	background: #0A2558;
	padding: 4px 12px;
	font-size: 15px;
	font-weight: 400;
	border-radius: 4px;
	text-decoration: none;
	transition: all 0.3s ease;
}

.sales-boxes .box .button a:hover {
	background: #0d3073;
}

/* Right box */
.home-content .sales-boxes .top-sales {
	width: 35%;
	background: #fff;
	padding: 20px 30px;
	margin: 0 20px 0 0;
	border-radius: 12px;
	box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
}

.sales-boxes .top-sales li {
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin: 10px 0;
}

.sales-boxes .top-sales li a img {
	height: 40px;
	width: 40px;
	object-fit: cover;
	border-radius: 12px;
	margin-right: 10px;
	background: #333;
}

.sales-boxes .top-sales li a {
	display: flex;
	align-items: center;
	text-decoration: none;
}

.sales-boxes .top-sales li .product, .price {
	font-size: 17px;
	font-weight: 400;
	color: #333;
}
/* Responsive Media Query */
@media ( max-width : 1240px) {
	.sidebar {
		width: 60px;
	}
	.sidebar.active {
		width: 220px;
	}
	.home-section {
		width: calc(100% - 60px);
		left: 60px;
	}
	.sidebar.active ~ .home-section {
		/* width: calc(100% - 220px); */
		overflow: hidden;
		left: 220px;
	}
	.home-section nav {
		width: calc(100% - 60px);
		left: 60px;
	}
	.sidebar.active ~ .home-section nav {
		width: calc(100% - 220px);
		left: 220px;
	}
}

@media ( max-width : 1150px) {
	.home-content .sales-boxes {
		flex-direction: column;
	}
	.home-content .sales-boxes .box {
		width: 100%;
		overflow-x: scroll;
		margin-bottom: 30px;
	}
	.home-content .sales-boxes .top-sales {
		margin: 0;
	}
}

@media ( max-width : 1000px) {
	.overview-boxes .box {
		width: calc(100%/ 2 - 15px);
		margin-bottom: 15px;
	}
}

@media ( max-width : 700px) {
	nav .sidebar-button .dashboard, nav .profile-details .admin_name, nav .profile-details i
		{
		display: none;
	}
	.home-section nav .profile-details {
		height: 50px;
		min-width: 40px;
	}
	.home-content .sales-boxes .sales-details {
		width: 560px;
	}
}

@media ( max-width : 550px) {
	.overview-boxes .box {
		width: 100%;
		margin-bottom: 15px;
	}
	.sidebar.active ~ .home-section nav .profile-details {
		display: none;
	}
}

@media ( max-width : 400px) {
	.sidebar {
		width: 0;
	}
	.sidebar.active {
		width: 60px;
	}
	.home-section {
		width: 100%;
		left: 0;
	}
	.sidebar.active ~ .home-section {
		left: 60px;
		width: calc(100% - 60px);
	}
	.home-section nav {
		width: 100%;
		left: 0;
	}
	.sidebar.active ~ .home-section nav {
		left: 60px;
		width: calc(100% - 60px);
	}


	

}
</style>
<body>

	<div class="sidebar">
		<div class="logo-details">
			<i class='bx bxl-c-plus-plus'></i> <span class="logo_name"><span style="color:#00FF40">Future</span>
	<span style="color:#">Gadgets</span></span>
		</div>
		<ul class="nav-links">
			<li><a href="#" class="active"> <i class='bx bx-grid-alt'></i>
					<span class="links_name">Dashboard</span>
			</a></li>
			
			<div class="box" data-toggle="modal"
			data-target="#product-modal">
			
			<li><a href="#"> <i class='bx bx-box'></i> <span
					class="links_name">Product</span>
			</a></li>
			</div>
			
			<div class="box" data-toggle="modal"
			data-target="#orderlist-modal">
			<li><a href="#"> <i class='bx bx-list-ul'></i> <span
					class="links_name">Order list</span>
			</a></li>
			</div>
			
			
			
			<div class="box" data-toggle="modal"
			data-target="#profile-modal">

			<li>
			<a href="#"> <i class='bx bx-cog'></i> <span
					class="links_name">Profile</span>
			</a>
			</li>
		</div>
		</ul>
	

	</div>
	<section class="home-section">
		<nav>
			<div class="sidebar-button">
				<i class='bx bx-menu sidebarBtn'></i> <span class="dashboard">Dashboard</span>
			</div>
			<div class="search-box">
				<input type="text" placeholder="Search..."> <i
					class='bx bx-search'></i>
			</div>
			<div class="profile-details">
				<img alt="" src="img/admin-pic.png">
				<span class="admin_name">${us.getName()}</span> 
				
				<div>
			 <form action="LogoutServlet" method="post">
			<button type="submit" class="btn bg-white me-3 float-right">
				<span class="fa fa-sign-out" data-toggle="tooltip" data-placement="left" title="Logout"></span> 
			</button>
			</form>
			</div>
				
			</div>
			
		</nav>

		<div class="home-content">
		<div class="container">
		<%String operationMsg=(String)session.getAttribute("operationMsg");
					 
					if(operationMsg!=null){
					%>
					
					<div class="alert alert-primary alert-dismissible fade show" role="alert">
					  <strong><%=operationMsg %></strong> 
					  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
					    <span aria-hidden="true">&times;</span>
					  </button>
					</div>
					
					<%session.removeAttribute("operationMsg");
					}
					%>
		
		</div>	
		
			<div class="overview-boxes">
			
				<div class="box">
					<div class="right-side">
						<div class="box-topic">Total Order</div>
						<div class="number">
					<!-- loop for count total order -->	
						<%
			    int mycount = 0;
                if(!lists.isEmpty()){
	            for(orderList ol:lists){ 
	            mycount++;
	            }
            }   
            %>
				<!-- loop for count total order end-->	
						<p><%=mycount %></p></div>
						<div class="indicator">
							<i class='bx bx-up-arrow-alt'></i> <span class="text">Up
								from yesterday</span>
						</div>
					</div>
					<i class='bx bx-cart-alt cart'></i>
				</div>
				<div class="box">
					<div class="right-side">
						<div class="box-topic">Total Sales</div>
						<div class="number">
				<!-- loop for count total amount of order-->			
				<%
			    int amount = 0;
                if(!lists.isEmpty()){
	            for(orderList ol:lists){
	             amount=amount+ol.getProductPrice();
	            	}
	            }
                %>
                <!-- loop for count total amount of order end-->	
						<%=amount %></div>
						<div class="indicator">
							<i class='bx bx-up-arrow-alt'></i> <span class="text">Up
								from yesterday</span>
						</div>
					</div>
					<i class='bx bxs-cart-add cart two'></i>
				</div>
				<div class="box" data-toggle="modal"
			data-target="#add-category-modal" >
					<div class="right-side">
					
					
										<div class="box-topic">Add Category</div>
						<div class="number">3</div>
						<div class="indicator">

							<span class="text">Click here to add category</span>
						</div>
					</div>

					<img style="max-width: 60px;" alt="" src="img/c-admin.png">
				</div>
				<div class="box" data-toggle="modal"
			data-target="#add-product-modal">
					<div class="right-side">
					
						<div class="box-topic">Add Products</div>
						<div class="number">8</div>

						<div class="indicator">


							<span class="text">Click here to add Products</span>
						</div>
					</div>
					<img style="max-width: 60px;" alt="" src="img/p-admin.png">
				</div>
			</div>

			<div class="sales-boxes">
				<div class="recent-sales box">
					<div class="title"><span><i class="fa fa-line-chart" aria-hidden="true"></i></span>  Recent Sales</div>
					<div class="sales-details">
						<table class="table table-light  w3-table-all w3-margin-top" >
		<thead>
			<tr>
			   
			    <th scope="col">Date</th>
				<th scope="col">Customer</th>
				<th scope="col">Sales</th>
				<th scope="col">Total</th>
			
			</tr>
		</thead>
		<tbody id="title">
		
		<!--to show only 4 recent order in admin home page-->
		 <%
		 int countt = 0;
            if(!lists.isEmpty()){
                 while (countt < 4) {
            for(orderList ot:lists){
            	%>
		
		    <tr>
				<td><%=ot.getDate()%></td>
				<td><%=ot.getUserName()%></td>
				<td>pending</td>
				<td><%=ot.getProductPrice() %></td>	
		    </tr>
		
		<%
		  countt++;
        if (countt >= 4) {
            break;
        }
            }
            }
            }
        %>
		<!--to show only 4 recent order in admin home page end-->
		</tbody>
		</table>
					</div>
					<div class="button">
						<a href="#">See All</a>
					</div>
				</div>
				<div class="top-sales box">
					<div class="title"><spam><i class="fa fa-shopping-bag"></i></spam>    Top Selling Product</div>
					<ul class="top-sales-details">
					
					
					<!--top selling-->
					<%
		            int counttt = 0;
                    if(!toplist.isEmpty()){
                      while (counttt < 5) {
                      for(TopFourSelling tfs:toplist){
            	    %>
					

					<li><a href="#"> <!--<img src="images/sunglasses.jpg" alt="">-->
								<span class="product"><span><i class="fa fa-star-o" aria-hidden="true"></i></span>   <%=tfs.getTopSellingName() %></span>
					</a> <span class="price"></span></li>	
					
		       <%
		         counttt++;
                 if (counttt >= 5) {
                 break;
                }
                }
                }
                }
               %>	
			
            <!--top selling end-->


					</ul>
				</div>

			</div>
		</div>
		<!-- add category modal -->
		
		<!--1 Modal -->
		
		
		<form action="ProductOperationServlet" method="post">
		<div class="modal fade " id="add-category-modal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
				
					<div class="modal-header">
					
						<h5 class="modal-title" id="exampleModalLongTitle">Add Category details:
							</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
					
					<div class="form-group">
					<input type="hidden" name="operation" value="addCategory">
					
					<input type="text" class="form-control" name="catTitle" placeholder="Enter category title" required>
					</div>
			
			
					<div class="form-group">
					<textarea rows="5" cols="55" placeholder="Enter category description" name="catDescription" required></textarea>
					</div>
					
					
					
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<button type="submit"  class="btn btn-primary">Save
							changes</button>
						
					</div>
					
				</div>
			</div>
		</div>

</form>


<!-- add product modal -->
		
		<!-- Modal -->
		<form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
		<div class="modal fade" id="add-product-modal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLongTitle">Add Products details:
					</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
				
					<input type="hidden" name="operation" value="addProduct">
					
					<input type="text" class="form-control" name="product-title" placeholder="Enter Product title" required><br>
					<select name="product-category" class="form-control" id="">
					<option value="phone">Phone</option>
					<option value="tv">Tv</option>
					<option value="laptop">Laptop</option>
					
					</select>
					<br>
					<input type="number" class="form-control" name="product-price" placeholder="Enter Product Price" required><br><hr>
				    <label for="img">Select img:</label>
                    <input type="file" id="img" name="product-image" accept="image/*">
                    
					
					</div>
					
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-primary">Save
							changes</button>
					</div>
				</div>
			</div>
		</div>
</form>


<!--profile Modal -->	
	

	<div class="modal fade " id="profile-modal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalCenterTitle"
			aria-hidden="true">
			
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
				
					<div class="modal-header">
					
						<h6 class="modal-title" id="exampleModalLongTitle"><strong>Profile details:</strong>
							</h6>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
					
					<section style="background-color: #eee ms;">
  <div class="container py-3">
    <div class="row">
    
   
    
      <div class="col">
        
      </div>
    </div>

    <div class="row">
      <div class="col-lg-4">
        <div class="card mb-4">
          <div class="card-body text-center">
          <h4>Welcome</h4>
            <img src="img/profile_pic.png" alt="avatar"
              class="rounded-circle img-fluid" style="width: 200px;">
            <h5 class="my-3"><%=us.getName() %></h5>
            <p class="text-muted mb-1">Register on:</p>
            <p class="text-muted mb-4"><strong>01-01-2022</strong></p>
            <div class="d-flex justify-content-center mb-2">
              
            </div>
          </div>
        </div>
        <div >
          <!-- space  -->
        </div>
      </div>
      <div class="col-lg-8">
        <div class="card mb-4">
          <div class="card-body">
          
           <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">U-ID</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%=us.getId() %></p>
              </div>
            </div>
            <hr>
          
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Full Name</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%=us.getName() %></p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Email</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%=us.getEmail() %></p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Password</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%=us.getPassword() %></p>
              </div>
            </div>
            <hr>
            
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Phone</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%=us.getPhoneNo() %></p>
              </div>
            </div>
            <hr>
            
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Address</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%=us.getAddress() %></p>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-2">
          <div class="box" data-toggle="modal"
			data-target="#editprofile-modal">
           <button type="button" class="btn btn-primary"> <span class="fa fa-pencil-square-o"></span>&nbsp;Edit</button>
          
           </div>
          </div>
         
      </div>
    </div>
  </div>
  </div>
</section>
					
					</div>
				</div>
			</div>
			</div>

	<!--profile Modal end -->
	
	
	<!-- product Modal -->

  <div class="modal fade" id="product-modal">
    <div class="modal-dialog modal-xl">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header" style=" background-color:#E5E4E2; color:black;">
        <h6><strong>Listed Products:</strong></h6>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal1-body">
        <div class="container">
<div class="card-header my-3">SmartPhone</div>
<div class="row">
<%
if(!products.isEmpty()){
	for(Product p:products){ %>
		<div class="col-md-3 my-3">
		<div class="card" style="width: 14rem;">
		
		  <img class="card-img-top" src="img_product/iphone-14-pro.jpeg" style="max-height:100px; max-width:100%;"  alt="Card image cap">
		  
		  <div class="card-body">
		    <h6 class="card-title"><%=p.getpName() %></h6>
		    <h6 class="category">Category: <%=p.getpCategory() %></h6>
		     <h6 class="price">MRP: <%=p.getpPrice()/100*120 %></h6>
		    <h6 class="price">Offer Price: <%=p.getpPrice() %></h6>
		   
		    <div class="mt-2 d-flex justify-content-between">
		    <a href="#" class="btn btn-dark">Remove</a>
		    <a href="#" class="btn btn-primary">edit</a>
		    
		    </div>
		  </div>
		</div>
		</div>
		
	<%}
}
%>
</div>
</div>
        
</div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
</div>
		

<!--product Modal end -->	
	
<!--orderlist modal -->
		
<div class="container" id="customers" >
  <div class="modal fade" id="orderlist-modal">
    <div class="modal-dialog modal-xl">
      <div class="modal-content">
      
      
        <div class="modal-header">
        <!-- filter-->
          <input class="w3-input w3-border w3-padding" type="text" style="border: none;
border-color: transparent;border-bottom: 2px solid black;" placeholder="Search.." id="myInput" onkeyup="myFunction()">

          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal1-body">
        
         <!-- filter-->
          <table class="table table-light  w3-table-all w3-margin-top" >
			<thead>
				<tr>
				    <th scope="col">O-ID</th>
				    <th scope="col">Date</th>
					<th scope="col">Name</th>
					<th scope="col">P-ID</th>
					<th scope="col">Category</th>
					<th scope="col">Price</th>
					<th scope="col">Quantity</th>
					<th scope="col">Total</th>
					<th scope="col">U-ID </th>
					<th scope="col">U-Name</th>
					<th scope="col">Status</th>
					<th scope="col">Confirm</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody id="myTable">
			
			 <%
			 int count = 0;
                if(!lists.isEmpty()){
	            for(orderList ol:lists){ %>
			
			<tr>
			        <td id="orderID"><%=ol.getOrderId() %></td>
					<td id="date"><%=ol.getDate()%></td>
					<td id="Name"><%=ol.getProductName() %></td>
					<td id="productId"><%=ol.getProductId() %></td>
					<td id="category"><%=ol.getProductCategory() %></td>
					<td id="price"><%=ol.getProductPrice()/ol.getOrderQuantity() %></td>
					<td id="quantity" style= text-align:center;><%=ol.getOrderQuantity() %></td>
					<td id="total"><%=ol.getProductPrice() %></td>
					<td id="userID" style= text-align:center;><%=ol.getUserId() %></td>
					<td id="userName"><%=ol.getUserName() %></td>
					
					<td id="status">
					<select class="w3-select" name="o_status" id="cars">
                    <option value="" disabled selected>Select</option>					
                    <option value="confirm">confirm</option>
                    <option value="Shipped">Shipped</option>
                    <option value="Delivered">Delivered</option>
                    </select>		
					</td>
					
					<td id="confirm" style= text-align:center;><a href="#"><i style="color: green;"class="fa fa-check"></i></a></td>
					
					
					
					<td id="cancel" style= text-align:center;><a href="#"><i style="color: red;"class="fa fa-remove"></i></a></td>
			</tr>
			
			
			<%
			count++;
			
	            }
            }
                int total=count;
                HttpSession s = request.getSession(true);
	            String ordertotal = Integer.toString(total);
	            System.out.println("total order:"+ordertotal);
	            application.setAttribute("mytotal",ordertotal);
                
            %>
			
			</tbody>
			</table>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
        <h5 style=text:centre>Total orders:<%=total %></h5>
        
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
</div>
		

<!--order list modal end-->	

	</section>



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