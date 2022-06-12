<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<!--bootstrap css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<link href="css/Style.css" rel="stylesheet" type="text/css">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
   .form-background{
    clip-path: polygon(50% 0%, 100% 0, 93% 60%, 70% 100%, 17% 93%, 4% 100%, 0 0);
   }
</style>
</head>
<body>
<!-- Navbar -->


<!-- form -->
<div class=" bg-dark form-background">
 <table>
        <tr>
            <td class="container" style="width: 350px;"></td>
            <td>
                <div class="container my-7 m-lg-3">
                    <div class="card shadow-lg p-2 mb-4 bg-body rounded " style="width: 30rem;">
                        <div class="card-body" style=" height:450px">
                            <h4 class="card-title text-dark lighten-1 my-2" style="text-align: center;">Register</h4>
                            <main class="form-signin my-6">
                                <form action="RegisterServlet" method="POST" id="reg-form">
                                <div class="input-group">
                                
                                <input type="text" name="user_Fname" autocomplete="current-name" aria-label="First name" class="form-control" placeholder="First Name" >
                                
                                <input type="text" name="user_Lname" autocomplete="current-name" aria-label="Last name" class="form-control" placeholder="Last Name">
                            </div><br>

                                    <div class="form-floating">
                                        <input type="email" class="form-control" autocomplete="current-email" id="floatingInput" placeholder="name@example.com" name="user_Email" autocomplete="off">
                                        <label for="floatingInput">Email address</label>
                                    </div><br>
                                    
                                     <div>                                    
                                        <label >Select Gender : </label>&nbsp;&nbsp;&nbsp;
                                       <div class="form-check form-check-inline">
                               <input class="form-check-input" type="radio" name="user_Gender" autocomplete="current-gender" id="inlineRadio1" value="Female">
                              <label class="form-check-label" for="inlineRadio1">Female</label>
                                   </div>
                               <div class="form-check form-check-inline">
                          <input class="form-check-input" type="radio" name="user_Gender" id="inlineRadio2" value="Male" autocomplete="current-gender">
                             <label class="form-check-label" for="inlineRadio2">Male</label>
                               </div>
                                       
                                    </div><br>
                                   
                                  
                                    <div class="form-floating">
                                        <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="user_Password" autocomplete="current-password">
                                        <label for="floatingPassword">Password</label>
                                    </div><br>
                                    <div class="form-check">
                                <input class="form-check-input" name="check" type="checkbox" value="on" id="flexCheckDefault">
                                     <label class="form-check-label" for="flexCheckDefault">
                                       Remember me
                                         </label>
                                           </div><br>
                                        <button class="w-100 btn btn-lg primary-background text-light" id="loader" style="display:none" disabled>
                                          <div class="spinner-border text-light" role="status">
                                        <span class="sr-only">Loading...</span>
                                        </div> &nbsp; &nbsp;Please wait...</button>
                                    <button id="submit-btn" class="w-100 btn btn-lg primary-background text-light" type="submit">Signup</button><br>
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

<script src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" ></script>
<script type="text/javascript" src="js/Myjs.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script>
     $(document).ready(function(){
    	  console.log("Done...");
    	  
      $('#reg-form').on('submit', function (event) {
    	  event.preventDefault();
    	  
    	  let form = new FormData(this);
    	  
    	  $('#submit-btn').hide();
    	  $('#loader').show();
    	  //send data on servlet
    	  $.ajax({
    		 url : "RegisterServlet",
    		 type: 'POST',
    		 data : form,
    		 success: function(data, textStatus, jqXHR) {
				console.log(data)
				  $('#submit-btn').show();
		    	  $('#loader').hide();
		    	  swal("Successfully Registered","Welcome to KlausTech","success")
		    	  response.sendRedirect("SignInPage.jsp");
			},
    	     error: function(jqXHR , textStatus, errorThrown) {
				console.log(jqXHR)
				swal("Invalid details","Welcome to KlausTech","warning");
			},
			processData:false,
			contentType:false
    	  });
      });
      
      })
</script>
</body>
</html>