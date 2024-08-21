<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="com.entity.*"%>
<%@page import="com.dao.*"%>
<%@page import="java.util.*"%>

<%
User us = (User) request.getSession().getAttribute("user");
if (us != null) {
	request.setAttribute("us", us);
	//response.sendRedirect("login.jsp");
}
%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>coming soon</title>
<style type="text/css">
@import url("https://fonts.googleapis.com/css?family=Open+Sans:400,400i,700");
*{
	font-family: 'Open Sans', sans-serif;
	font-weight: 400;
}
body{
	margin: 0;
	padding: 0;
	font-size: 16px;
}
img{
	max-width: 100%;
}
.container{
	height: 100vh;
	width: 100%;
	background-image:url("http://html.medhati.com/trendy/assets/img/slider2.jpg");
//	background-image:url("");
	background-size: cover;
	background-position: 50% 0%;
	/*overflow: hidden;*/
}
.wrapper{
	width: 100%;
    height: 100%;
	opacity: 0.7;
	background: linear-gradient(-55deg, transparent 25%, #16181E 25%, #16181E 75%, transparent 75%, transparent 100%);
	/*background: linear-gradient(-210deg, transparent 0%, #16181E 0%, #16181E 70%, transparent 50%, transparent 100%);*/
	transition: all 0.5s cubic-bezier(0.67, 0, 0.3, 1) 1s;
	display: flex;
	justify-content:center;
	align-items:center;
	text-align: center;
}
.content{
	/*transform:rotate(50deg);*/
	padding: 1rem;
	color:rgba(255,255,255,1);
}
.content h1{
	font-size: 3rem;
	color:rgba(255,255,255,1);
}
.content p{
	font-size: 1.1rem;
	color:rgba(255,255,255,1);
}
.content a{
	color:rgba(255,255,255,1);
	display: inline-block;
	padding: 2.1% 4%;
    overflow: hidden;
    border-radius: 0;
    text-decoration: none;
    
}
.btn1{
	border: 1px solid rgba(255,255,255,1);;
	transition: .2s ease-in-out;
}
.btn1:hover{
	border: 1px solid rgba(255,255,255,1);;
	background-color:rgba(255,255,255,1);;
	color: black;
	transition: .2s ease-in-out;
}
.btn2{
	margin-left: 3%;
    background: linear-gradient(to right, #252AFF 0%, #25FFED 100%);
    border-image: linear-gradient(to bottom right, #252AFF 0%, #25FFED 100%);
	border-image-slice: 1;
	border-width: 1px;
    border-style: solid;
    transition: .2s ease-in-out
}
.btn2:hover{
	background: none;
	border-image: linear-gradient(to bottom right, #252AFF 0%, #25FFED 100%);
	border-image-slice: 1;
	border-width: 1px;
    border-style: solid;
    transition: .2s ease-in-out
}

@media screen and (max-width: 355px){
	.content{
		/*transform:rotate(50deg);*/
		padding: 1rem 1.4rem;
	}
	.content h1{
		font-size: 2.5rem;
		/*margin: 5px 0px;*/
		/*line-height: 1.2;*/
	}
	.wrapper{
		background: linear-gradient(-210deg, transparent 0%, #16181E 0%, #16181E 70%, transparent 50%, transparent 100%);
		transition: all 0.5s cubic-bezier(0.67, 0, 0.3, 1) 1s;
		display: flex;
		justify-content:center;
		align-items:flex-start;
		text-align: left;
	}
}

@media screen and (min-width: 356px) and (max-width: 650px){
	.content{
		/*transform:rotate(50deg);*/
		padding: 1rem 1.4rem;
	}
	.wrapper{
		background: linear-gradient(-210deg, transparent 0%, #16181E 0%, #16181E 70%, transparent 50%, transparent 100%);
		transition: all 0.5s cubic-bezier(0.67, 0, 0.3, 1) 1s;
		display: flex;
		justify-content:center;
		align-items:flex-start;
		text-align: left;
	}
}

</style>
<%@ include file="component/allcss.jsp"%>
</head>
<body>
<%@ include file="component/navbar.jsp"%>
<div class="container">
			<div class="wrapper">
				<div class="content">
					<h1>We're Coming Soon</h1>
					<p>Perfect and awesome to present your future product or service.<br>This page is under Maintenance we will be back soon.</p>
					<!-- <a href="#" class="btn1">Subscribe</a> -->
					<a href="index.jsp" class="btn2">Back to Home</a>
				</div> <!-- content ends -->
			</div> <!-- wrapper ends -->
		</div> <!-- container ends -->
</body>
</html>