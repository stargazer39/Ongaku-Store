<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.ongakustore.OngakuUser,com.ongakustore.JSPHelper" %>
<%
	boolean authorized = JSPHelper.isAuthorized(session);
	if(!authorized){
		 response.sendRedirect("notAuthorized.jsp");
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<!-- Bootstrap -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
		<!-- Jquery -->
		<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
		<title>Add Music</title>
		<link rel="stylesheet" href="css/common.css">
	</head>
<body>
	<div class="container">
		<h1>Add artist</h1>
		<form action="saveArtist" method="POST" enctype="multipart/form-data">
			<input type="text" name="artistName" placeholder="Artist"><br>
			<textarea name="description" placeholder="Description"></textarea><br>
			<input type="file" name="artistImage"><br><br>
			<input type="submit" name="submit" value="Submit">
		</form>
	</div>
</body>
</html>