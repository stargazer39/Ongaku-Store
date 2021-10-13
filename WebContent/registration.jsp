<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>
<%@ page import="com.ongakustore.SqlConnect"%>
<%@ page import="java.sql.*, java.util.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
      <title>Sign Up Form</title>
      <!-- Font Icon -->
      <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
      <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css">
      <!-- Main css -->
      <link rel="stylesheet" href="css/register.css">
      <link href="css/petals.css" rel="stylesheet">
      <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css">
      <!-- Javascript-->
      <script src="js/bootstrap.min.js"></script>
      <style>
         input[type=text],input[type=password],input[type=email] {
         /*background-color: #ffffff00 !important;*/
         text-align:center;
         }
         .p-3 {
         padding: 1rem!important;
         }
         .mx-3 {
         margin-right: 1rem!important;
         margin-left: 1rem!important;
         }
      </style>
   </head>
   <body>
      <div id="blossom_container"></div>
      <script src="js/petals.js"></script>
      <!-- Topbar -->
      <div class="topbar">
         <img class="img-contain p-3" style="height: 60px" src="images/logo_mini.png">
         <div class="spacer"></div>
         <div class="mx-3"><a href="homepage.jsp">Home</a></div>
		<div class="mx-3"><a href="Login.jsp">Sign in</a></div>
		<div class="mx-3"><a href="registration.jsp">Register</a></div>
      </div>
      <!-- End of TopBar -->
      <div class="main" style="padding-top: 50px">
         <!-- Sign up form -->
         <section class="signup">
            <div class="container">
               <center>
                  <div class="header1">
                     <h2 class="form-title">Sign up</h2>
                  </div>
               </center>
               <div class="signup-content" style="padding-left: 150px">
                  <div class="signup-form">
                     <form action="RegisterServlet" method="POST" class="register-form" id="register-form" name="register-form" onsubmit="return validateForm() ">
                        <div class="form-group">
                           <input type="text" name="fname" id="fname" placeholder="First Name"/>
                        </div>
                        <div class="form-group">
                           <input type="text" name="lname" id="lname" placeholder="Last Name"/>
                        </div>
                        <div class="form-group">
                           <input type="text" name="username" id="username" placeholder="Username"/>
                        </div>
                        <div class="form-group">
                           <input type="email" name="email" id="email" placeholder="Your Email"/>
                        </div>
                        <div class="form-group">
                           <input type="password" name="password" id="password" placeholder="Password"/>
                        </div>
                        <div class="form-group">
                           <input type="password" name="re_pass" id="re_pass" placeholder="Repeat your password"/>
                        </div>
                        <div class="form-group">
                           <input type="checkbox" name="agree-term" id="agree-term" class="agree-term" />
                           <label for="agree-term" class="label-agree-term"><span><span></span></span>I agree all statements in  <a href="#" class="term-service" style="font-size: 23px !important;">Terms of service</a></label>
                        </div>
                        <div class="form-group form-button">
                           <center> <input type="submit" name="signup" id="signup" class="form-submit" value="Register"/></center>
                        </div>
                     </form>
                  </div>
               </div>
               <br>
            </div>
         </section>
      </div>
      <!-- JS -->
      <script src="vendor/jquery/jquery.min.js"></script>
      <script src="js/main.js"></script>
      <script>
         function validateForm() {
         			let x = document.forms["register-form"]["fname"].value;
         			let y = document.forms["register-form"]["lname"].value;
         			let z = document.forms["register-form"]["username"].value;
         			let a = document.forms["register-form"]["email"].value;
         			let b = document.forms["register-form"]["password"].value;
         			let c = document.forms["register-form"]["re_pass"].value;
         			if (x == "") {
           			alert("First Name must be filled out");
           			return false;
         			}
         			if (y == "") {
           			alert("Last Name must be filled out");
           			return false;
         			}
         			if (z == "") {
           			alert("Username must be filled out");
           			return false;
         			}
         			if (a == "") {
           			alert("Email must be filled out");
           			return false;
         			}
         			if (b == "") {
           			alert("Password must be filled out");
           			return false;
         			}
         			if (c == "") {
           			alert("Re-enter Password");
           			return false;
         			}
         			if(b !== c){
         				alert("Password doesn't match");
         				return false;
         			}
         			
         }
      </script>
      <!-- Footer -->
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
      <!-- End of footer -->
   </body>
</html>
