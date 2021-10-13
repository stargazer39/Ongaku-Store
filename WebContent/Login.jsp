<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.ongakustore.OngakuUser" %>
<%
	OngakuUser user = (OngakuUser) session.getAttribute("currentUser");
	System.out.println(user);
	if(user == null){
		System.out.println("User not signed in");
	}else{
		response.sendRedirect("ticket.jsp");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>

        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
        <link rel="stylesheet" href="blah/style.css">
        <link rel="stylesheet" href="blah/petals.css">
        <link rel="stylesheet" href="blah/footer.css">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css">
  		<!-- Bootstrap -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
  		
</head>
<body>

     <div id="blossom_container"></div>
      <script src="js/petals.js"></script>
      	
      	<div class="topbar d-flex flex-row align-items-center">
		<img class="img-contain p-3" src="img/logo_mini.png">
		<div class="spacer"></div>
		<div class="mx-3"><a href="homepage.jsp">Home</a></div>
		<div class="mx-3"><a href="Login.jsp">Sign in</a></div>
		<div class="mx-3"><a href="registration.jsp">Register</a></div>
	</div>
  
            <div class="form-wrap">
                <div  class="header">
                    <!--title-->
                    <div>
                       <img class="img-contain1 p-3" src="img/logo.png">
                    </div>
                    <!--end title-->
                </div>
                <!--form-->
	                <form action="LoginServlet" method="POST">
	                <center>
	                <div class="login-form-container">
	                    <div class="">
	                        <i class= "fa fa-envelope"></i>
	                        <input class="input-text" type="email" name="userMail" placeholder="Email address" required onchange="validatemail()">
	                    </div>
	                    <div class="	">
	                        <i class="fa fa-key"></i>
	                        <input class="input-text" type="password" name="userPass" id="userPass" placeholder="Password" required onchange="validatePass()">
	                    
	<!--        	        	<button type="button" class="eyeBtn" onclick="showPass()">
	                            <i class="fa fa-eye"></i> 
			                     </button>
	  -->                
	                    </div>
	                    <div >
	                        <div>
	                          </div>
	                        <div>
	                            <button class="btn1 btn-loggin" type = "submit">Login</button>
	                        </div>
	                       </div>
                </div> 
                </center>
                </form>
                	<div class="forgot">
                		<a href="Forgot1.jsp">Forgot password</a>
                	</div>
                   <div class="sign-up"> 
                   	<center>
                        <p class="bold-text">Dont have an account?</p>
                        <p>Sign up and create your account.</p>
                    
                   
                        <a  class="btn1 btn-register form-a"  href="register.html">Sign up for free</a>
                   </center>
                    </div>
                    
                </div>
<footer class="footer">
		<div class="footer-container">
			<div class="footer-row">
				<div class="footer-col">
					<h4>company</h4>
					<ul class="blablabla">
						<li><a href="#">about us</a></li>
						<li><a href="#">our services</a></li>
						<li><a href="#">privacy policy</a></li>
					</ul>
				</div>
				<div class="footer-col">
					<h4>get help</h4>
					<ul class="blablabla">
						<li><a href="#">FAQ</a></li>
						
					</ul>
				</div>
				<div class="footer-col">
					<h4>purchases</h4>
					<ul class="blablabla">
						<li><a href="#">purchases info</a></li>
						<li><a href="#">refunds</a></li>
						<li><a href="#">order status</a></li>
						<li><a href="#">payment options</a></li>
					</ul>
				</div>  
				<div class="footer-col">
					<h4>follow us</h4>
					<div class="social-links">
						<a href="#"><i class="fab fa-facebook-f"></i></a>
						<a href="#"><i class="fab fa-twitter"></i></a>
						<a href="#"><i class="fab fa-instagram"></i></a>
						<a href="#"><i class="fab fa-linkedin-in"></i></a>
					</div>
				</div>
			</div>
		</div>
	</footer>
        

</body>
</html>