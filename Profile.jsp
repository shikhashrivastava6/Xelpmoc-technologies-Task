<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.xelpcom.helper.ConnectionProvider"%>
<%@page import="com.tech.xelpcom.entities.User" %>

 <%@page import="com.tech.xelpcom.entities.Message" %>
<%

   User user =(User)session.getAttribute("currentUser");
if(user==null){
	response.sendRedirect("Signin.jsp");
}
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<!--bootstrap css -->
     <script src="js/Myjs.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<link href="css/Style.css" rel="stylesheet" type="text/css">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
   .form-background{
clip-path: polygon(0 0, 100% 0, 96% 75%, 71% 100%, 18% 86%, 0 100%);
   }
   .inputField{
    width: 4rem;
    height: 3rem;
}
.mainDiv{
    width: 25rem;
    margin: 5rem 20rem 5rem 23rem;
}
.btncheck{
    margin: 5.4rem;
}
</style>
</head>
<body>
   <!-- Navbar -->

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Xelpcom Technology</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarScroll">     
      
    <ul class="navbar-nav me-right">
    <li class="nav-item">
          <a class="nav-link text-light" href="UserPage.html">Check Prime Number</a>
        </li>
     <li class="nav-item">
          <a class="nav-link" href="#!" data-bs-toggle="modal" data-bs-target="#exampleModal"><%= user.getFname() %>  <%= user.getLname() %></a>
        </li>
       <li class="nav-item">
          <a class="nav-link text-light" href="LogoutServlet">Logout</a>
        </li>
    </ul>
    </div>
  </div>
</nav>

<!-- End Navbar -->  

  <%
    Message m = (Message)session.getAttribute("msg");
if(m!=null){
	%>
<div class="alert-<%= m.getCssClass() %>" role="alert">
  <%= m.getContent() %>
</div>
<% 
session.removeAttribute("msg");
}
%>

<!-- profile modal -->
<!-- main div  -->
<div class="container">
            <div class="mainDiv">
            <div class="row">
              <div class="col">
               <input type="text" id="numberOne" class="inputField" required>
              </div>
              <div class="col">
                <input type="text" id="numberTwo"  class="inputField" required>
              </div>
              <div class="col">
                <input type="text" id="numberThree" class="inputField" required>
              </div>
            </div>
            <div class="row">
                <div class="col">
                    <h4 id="val1"></h4>
                    <h4 id="val2"></h4>
                    <h4 id="val3"></h4>
                </div>
            </div>
            <div class="row">
               <div class="col "><button class="btncheck btn btn-primary my-5" onclick="checkPrimeNumber()">Check Prime Number</button></div>
            </div>
           
            </div>
          </div>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header primary-background text-light">
        <h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
               <h5 style="color: green"><%= user.getFname() %>  <%= user.getLname() %></h5>
               <!-- Details -->
                <div id="profile-details">
                <table class="table text-success">
  <thead>
   
  </thead>
  <tbody>
    <tr>
      <th scope="row">Id :</th>
      <td><%= user.getId() %></td>
    </tr>
    <tr>
      <th scope="row">Email : </th>
      <td><%= user.getEmail() %></td>
    </tr>
    <tr>
      <th scope="row">Gender :</th>
      <td><%= user.getGender() %></td>
    </tr>
    <tr>
      <th scope="row">Registered On  :</th>
      <td><%= user.getDateTime().toString()%></td>
    </tr>
  </tbody>
</table>
</div>
                
               <!-- end Details -->
              
         </div>
         </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
    </div>
  </div>
</div>
<!-- End of profile model --> 


     <!-- Button trigger modal -->

<!-- Modal -->
<div  class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-fullscreen-xxl-down">
    <div class="modal-content">

      <div class="modal-header primary-background">
        <h5 class="modal-title text-light" id="staticBackdropLabel">Post Blog</h5>
      </div>
      <div class="modal-body">
        
        <form action="AddPostServlet" method="POST">
        <br>
        <!-- for Title -->
        <div class="form-group">
                 <input type="text" class="form-control" name="Post_Title" placeholder="Post Title">
        </div>
        <br>
        <!-- for Content -->
         <div class="form-group">
                 <textarea rows="4" class="form-control" placeholder="Enter Your Content :"></textarea>
        </div>
        <br>
        <!-- for code -->
         <div class="form-group">
                 <textarea rows="4" class="form-control" placeholder="Enter Your Code (if any) :"></textarea>
        </div>
        <br>
        
        </form>
        
      </div>
     
    </div>
  </div>
</div>

<!-- End Post Model -->
   <!-- Javascripts -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" ></script>
  <script type="text/javascript" src="js/Myjs.js"></script>
  <script> 
            $(document).ready(function(){
            	  let editStatus = false;
            	$('#edit-profile-button').click(function(){
            	//	alert("clicked button")
            	
            	if(editStatus==false){
            		$('#profile-details').hide();
            		
            		$('#profile-edit').show();
            		
            		editStatus=true;
            		$(this).text('Save')
            	}else{
                    $('#profile-details').show();
            		
            		$('#profile-edit').hide();
            		
            		editStatus = false;
            		$(this).text('Edit')
            	}
            	})
            });
            
            const checkPrimeNumber = () => {
                var num1 = parseInt(document.getElementById("numberOne").value);
                var num2 = parseInt(document.getElementById("numberTwo").value);
                var num3 = parseInt(document.getElementById("numberThree").value);
                var isPrimeNumber = true;      
              
                    for(let i = 2; i < num1; i++){
                    if(num1 % i == 0){
                       isPrimeNumber = false;
                    }
                }
                if (isPrimeNumber == true) {
                    let n1 = `${num1} is a Prime Number`;
                    document.getElementById("val1").innerHTML = n1;

                }else{
                    let n1 = `${num1} is not a Prime Number`;
                    document.getElementById("val1").innerHTML = n1;

                }

                for(let i = 2; i < num2; i++){
                    if(num2 % i == 0){
                       isPrimeNumber = false;
                    }
                }
                if (isPrimeNumber == true) {
                    let n2 = `${num2} is a Prime Number`;
                    document.getElementById("val2").innerHTML = n2;

                }else{
                    let n2 = `${num2} is not a Prime Number`;
                    document.getElementById("val2").innerHTML = n2;

                }

                for(let i = 2; i < num3; i++){
                    if(num3 % i == 0){
                       isPrimeNumber = false;
                    }
                }
                if (isPrimeNumber == true) {
                    let n3 = `${num3} is a Prime Number`;
                    document.getElementById("val3").innerHTML = n3;
                }else{
                    let n3 = `${num3} is not a Prime Number`;
                    document.getElementById("val3").innerHTML = n3;
                }
                }
            const checkPrimeNumber = () => {
                var num1 = parseInt(document.getElementById("numberOne").value);
                var num2 = parseInt(document.getElementById("numberTwo").value);
                var num3 = parseInt(document.getElementById("numberThree").value);
                var isPrimeNumber = true;      
              
                    for(let i = 2; i < num1; i++){
                    if(num1 % i == 0){
                       isPrimeNumber = false;
                    }
                }
                if (isPrimeNumber == true) {
                    let n1 = `${num1} is a Prime Number`;
                    document.getElementById("val1").innerHTML = n1;

                }else{
                    let n1 = `${num1} is not a Prime Number`;
                    document.getElementById("val1").innerHTML = n1;

                }

                for(let i = 2; i < num2; i++){
                    if(num2 % i == 0){
                       isPrimeNumber = false;
                    }
                }
                if (isPrimeNumber == true) {
                    let n2 = `${num2} is a Prime Number`;
                    document.getElementById("val2").innerHTML = n2;

                }else{
                    let n2 = `${num2} is not a Prime Number`;
                    document.getElementById("val2").innerHTML = n2;

                }

                for(let i = 2; i < num3; i++){
                    if(num3 % i == 0){
                       isPrimeNumber = false;
                    }
                }
                if (isPrimeNumber == true) {
                    let n3 = `${num3} is a Prime Number`;
                    document.getElementById("val3").innerHTML = n3;
                }else{
                    let n3 = `${num3} is not a Prime Number`;
                    document.getElementById("val3").innerHTML = n3;
                }
                }
            
  </script>
</body>
</html>