<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Support ticket</title>
<link rel="stylesheet" href="blah/style.css">
        <link rel="stylesheet" href="blah/footer.css">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css">
<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>

</head>
<body class="background" >
 	<div class="topbar d-flex flex-row align-items-center">
		<img class="img-contain p-3" src="img/logo_mini.png">
		<div class="spacer"></div>
		<div class="mx-3">Home</div>
		<div class="mx-3">Sign in</div>
		<div class="mx-3">Register</div>
	</div>
  
	<div class="container-ticket">
	<form action="supportTicketServlet" method="POST">
  <label for="fname">First name:</label><br>
  <input class="input-text2" type="text" id="fname" name="fname"><br>
  <label for="lname">Last name:</label><br>
  <input class="input-text2" type="text" id="lname" name="lname"><br>
   <label for="email">E-mail:</label><br>
  <input class="input-text2" type="text" id="email" name="email"><br>
    <label for="subject">Subject:</label><br>
  <input class="input-text2" type="text" id="subject" name="subject"><br>
   <label for="description">Description:</label><br>
  <textarea class="input-text3" type="text" id="Desc" name="description"></textarea><br>
    <input class="btn1 btn-loggin" type="submit" value="Submit">
	</form>
	
</div>
<center>
<P class= "bold-text">Alreaady made a ticket ?  <a href="mytickets.jsp">My tickets</a></P>
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
						<a href="#"><i cl ass="fab fa-instagram"></i></a>
						<a href="#"><i class="fab fa-linkedin-in"></i></a>
					</div>
				</div>
			</div>
		</div>
	</footer>
        

</center>
</body>
</html>