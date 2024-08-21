<%@page import="com.connection.DbConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.connection.DbConnect.*" %> 
<%@page import="com.entity.*" %>
<%@page import="com.dao.*" %>
<%@page import="java.util.*" %>

<% User us=(User)request.getSession().getAttribute("user"); 
if(us!=null){
request.setAttribute("us",us);
//response.sendRedirect("login.jsp");
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
<title>FutureGadgets</title>
<%@ include file="component/allcss.jsp" %>
<style>


* {box-sizing: border-box;}
body {font-family: Verdana, sans-serif;}
.mySlides {display: none;}
img {vertical-align: middle;}


body {
  background-color: white;
}

/* Slideshow container */
.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
}

/* Caption text */


/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}



/* Fading animation */
.fade {
  animation-name: fade;
  animation-duration: 1.5s;
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .text {font-size: 11px}
}


</style>
</head>
<body>
<%@ include file="component/navbar.jsp" %>
<!--  <% Connection con=DbConnect.getConnection();
out.print(con);
%>
-->
    
<div class="slideshow-container">

<div class="mySlides fade">
  <div class="numbertext">1 / 3</div>
  <img src="img_slide/macbook.jpg" style="width:100%">
  <div class="text"></div>
</div>

<div class="mySlides fade">
  <div class="numbertext">2 / 3</div>
  <img src="img_slide/tecnox2.jpg" style="width:100%">
  <div class="text"></div>
</div>

<div class="mySlides fade">
  <div class="numbertext">3 / 3</div>
  <img src="img_slide/iphone-14-home.jpg" style="width:100%">
  <div class="text"></div>
</div>

</div>
<br>

<div style="text-align:center">
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
</div>

 <!-- Background image -->

<img src="img/2.png" style="width:100%">
<img src="img/3.png" style="width:100%">
<img src="img/4.png" style="width:100%">
<img src="img/5.png" style="width:100%">



  <!-- Background image -->
 

<!-- footer -->
<footer class="bg-light text-center text-lg-start">
  <div class="text-center p-3" style="background-color: #E6E6E6;">
    © 2023 Copyright:
  <a class="text-dark" href="#">FutureGadgets.com</a>
  <img height="40" style="float:right" src="https://shoplineimg.com/assets/footer/card_master.png"/>
  <img height="40" style="float:right" src="https://shoplineimg.com/assets/footer/card_visa.png"/>  
  </div>
</footer>
<!-- footer end -->

<script>
let slideIndex = 0;
showSlides();

function showSlides() {
  let i;
  let slides = document.getElementsByClassName("mySlides");
  let dots = document.getElementsByClassName("dot");
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";  
  }
  slideIndex++;
  if (slideIndex > slides.length) {slideIndex = 1}    
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
  setTimeout(showSlides, 2000); // Change image every 2 seconds
}
</script>

</body>
</html>