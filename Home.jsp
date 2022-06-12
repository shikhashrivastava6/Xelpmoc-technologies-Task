<%@page import="com.tech.xelpcom.helper.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Techblog Home Page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="css/Style.css">
<style>
   .banner-background{
      clip-path: polygon(0 0, 100% 0, 94% 76%, 65% 100%, 32% 91%, 0 100%);
   }
</style>
</head>
<body>
<%
      Connection con = ConnectionProvider.getConnection();
%>


<!-- Banner -->
<div class="container-fluid p-0 m-0">
   <div class="jumbotron bg-dark banner-background text-light">
   <div class="container"><br><br>
  <!-- buttons -->
  
   <a href="SignupPage.jsp" class="btn btn-primary btn-lg">Sign Up</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href="SignInPage.jsp" class="btn btn-outline-primary btn-lg">Sign In</a>
   <br><br><br>
   </div>
   </div>
</div>
<!-- Javascripts -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
  <script type="text/javascript" src="js/Myjs.js"></script>
  <script> 
            
  </script>
</body>
</html>