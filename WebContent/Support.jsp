<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Support</title>
		<link rel="stylesheet" href="blah/style.css">
			<!-- Bootstrap -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
		 <style>

table {
  border-collapse: collapse;
  width: 100%;
  font-size: 20px;
}

td {
  text-align: center;
  color:black;
}
th{

}

</style>
</head>
<body class="background" >
 	<div class="topbar d-flex flex-row align-items-center">
		<img class="img-contain p-3" src="img/logo_mini.png">
		<div class="spacer"></div>
		<div class="mx-3">Home</div>
		<div class="mx-3">Sign in</div>
		<div class="mx-3">Register</div>
	</div>

<!-- <div class="background" style="background-image: url(img/1412.png);"> -->
<p class="header-support">How can we help?</p>
<div class="searchbar"> 
		<input type="text" placeholder="Search..">
		
</div>
<hr class="line">

<table width="100%">
		<col style="margin-left: 20px">
	<tr>
		<th>account</th>
		<th>payment</th>
		<th>privacy</th>
		<th><a href="aboutus.jsp" >about us</a></th>
	</tr>
	<tr>
		<td><a href="https://support.spotify.com/us/account_help/logging_in/" >loggin in </a></td>
		<td><a href="https://support.spotify.com/us/payment_help/manage_payments/" >manage payments </a></td>
		<td><a href="https://support.spotify.com/us/data_privacy/listening_privacy/" >listening privacy </a></td>
	</tr>
	<tr>
		<td><a href="https://support.spotify.com/us/account_help/profile_help/" >profile help</a></td>
		<td><a href="https://support.spotify.com/us/payment_help/payment_methods/" >payment methods</a></td>
		<td><a href="https://support.spotify.com/us/data_privacy/data_and_privacy_info/" >data & privacy info</a></td>
	</tr>
	<tr>
		<td><a href="https://support.spotify.com/us/account_help/account_settings/" > account settings</a></td>
		<td><a href="https://support.spotify.com/us/payment_help/charge_help/" >charge help</a></td>
	</tr>
	<tr>
		<td><a href="https://support.spotify.com/us/account_help/security/" >security</a></td>
	</tr>
		
		

</table>
<p class="p-support">Didn't find what u are looking for ?
create a ticker <a href="ticket.jsp">Support ticket</a></p>
</div>
</body>
</html>