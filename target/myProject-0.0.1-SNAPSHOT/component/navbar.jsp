
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<a class="navbar-brand" href="#">
	<span style="color:#00FF40">Future</span>
	<span style="color:#">Gadgets</span>
	 </a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp">Home
					<span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item "></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> Product </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="phone.jsp">PHONE</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="comingSoon.jsp">TV</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="comingSoon.jsp">LAPTOP</a>
				</div></li>
			<li class="nav-item"><a class="nav-link " href="contact.jsp">Contact</a></li>
		</ul>
		<div class="d-flex align-items-center">


			<%
			if (us != null) {
			%>

			<a href="profile.jsp" class="btn btn-link px-3 me-2 text-white"><span
				class="fa fa-user-circle"></span> <%=us.getName()%></a>
				
			<a href="orders.jsp" class="btn btn-link px-3 me-2 text-white"><span
				class="fa fa-bars"></span> Order</a>		
				
			<a href="cart.jsp" class="btn btn-link px-3 me-2 text-white"><span
				class="fa fa-cart-arrow-down"></span> Cart<span class="badge badge-pill badge-danger">${cart_list.size()}</span></a>	
				
            <form action="LogoutServlet" method="post">
			<button type="submit" class="btn btn-primary me-3">
				<span class="fa fa-sign-out"></span> Log Out
			</button>
			</form>

			<%
			} else {
			%>
			<a href="login.jsp" class="btn btn-link px-3 me-2 text-white"><span
				class="fa fa-user-circle"></span> Login</a>
			
			<a href="register.jsp" class="btn btn-primary me-3"><span
				class="fa fa-edit"></span> Sign up </a>
			<%
			}
			%>

		</div>
	</div>
</nav>