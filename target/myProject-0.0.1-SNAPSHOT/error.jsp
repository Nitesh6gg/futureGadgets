<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isErrorPage="true" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>oops!</title>
<%@ include file="component/allcss.jsp" %>
<style type="">
.div{
  height: 150px;
  position: relative;
  
 }
.btn{
  display: flex;
  height: 50px;
  justify-content: center;
  align-items: center;
 }
</style>
</head>
<body>

<div class="div">
<div class="container text-center ">
<img src="img/error-404.png" class="img-fluid"
 width="400" 
     height="400"
>
<h3 class="display-3">Sorry! something went wrong..</h3>
</div>

 
<div class="btn">
      <a href="index.jsp" class="btn btn-primary" style="position: absolute; left: 40%; right: 40%; top: 350%;"> <span class="fa fa-home "></span> <strong>&nbsp;Home</strong> </a>
    </div>
</div>


</body>