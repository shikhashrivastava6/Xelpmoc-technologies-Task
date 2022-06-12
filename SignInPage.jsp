<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.tech.xelpcom.entities.Message" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<!--bootstrap css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" >
<link href="css/Style.css" rel="stylesheet" type="text/css">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
   .form-background{
clip-path: polygon(0 0, 100% 0, 96% 75%, 71% 100%, 18% 86%, 0 100%);
   }
   
</style>
</head>
<body>
<!--navbar  -->
<nav class="navbar bg-dark">
  <div class="container-fluid">
    <span class="navbar-brand mb-0 h1 text-light">Xelpcom Technology</span>
  </div>
</nav>
<!-- form -->
 
<div class="bg-dark form-background"><br>
 
  <table>
        <tr>
        
            <td class="container" style="width: 350px;">  </td>
            <td>
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
                <div class="container my-5 m-lg-5">
                    <div class="card shadow-lg p-3 mb-5 bg-body rounded " style="width: 350px; height:430px">
                 
                        <div class="card-body">
                            <h4 class="card-title text-dark my-1" style="text-align: center;">Login</h4><br>
                             
                            <main class="form-signin my-2">
                                <form action="LoginServlet" method="POST">

                                    <div class="form-floating">
                                        <input type="email" name="user_Email" required="required" class="form-control" id="floatingInput" placeholder=" username@gmail.com"  autocomplete="off">
                                        <label for="floatingInput">Email address</label>
                                    </div>
                                    <div class="form-floating">
                                        <input type="password"  name="user_Password" required="required" class="form-control" id="floatingPassword" placeholder="Password">
                                        <label for="floatingPassword">Password</label>
                                    </div><br>
                                    <br>

                                    <button class="w-100 btn btn-lg bg-dark text-light" type="submit">Login</button><br>
                                    <a href="#" class="text-dark">Forgotten Password</a>
                              <br><br><br>
                                </form>
                            </main>
                        </div>
                    </div>
                </div>
            </td>
        </tr>
    </table>
</div>
<br><br>
</body>
</html>