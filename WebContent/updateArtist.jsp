<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,com.ongakustore.admin.SqlConnect,com.ongakustore.admin.Artist" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	Artist artist = new Artist();

	try{
		String artistId = request.getParameter("artistId");
		if(artistId == null) {
			throw new Exception("Artist not found");
		}
		
		artist.setArtistId(Integer.parseInt(artistId));
		
		Connection conn = SqlConnect.connect();
		String query = "SELECT artistId, artistName, artistDescription FROM Artist WHERE artistId = ?";
		PreparedStatement ps = conn.prepareStatement(query);
		ps.setString(1,artistId);
		
		ResultSet rs = ps.executeQuery();
		if(!rs.next()){
			throw new Exception("Artist not found");
		}
		
		artist.setArtistName(rs.getString(2));
		artist.setArtistDescription(rs.getString(3));
	}catch (Exception e){
		e.printStackTrace();
		// TODO - Redirect to error page
		out.append(e.getMessage()).close();
	}
	
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Update</title>
		<!-- Bootstrap -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
		<!-- Jquery -->
		<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
		
		<link rel="stylesheet" href="css/common.css">
	</head>
<body>
	<div class="container">
		<div style="width: 100px; height: 100px;">
			<img src="/OngakuStore/getImage?type=artist&id=<%= artist.getArtistId() %>" class="img-fill">
		</div>
		<h1>Update <%= artist.getArtistName() %></h1>
		<form action="updateArtist" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="artistId" value="<%= artist.getArtistId() %>">
			<input type="text" name="artistName" placeholder="Artist" value="<%= artist.getArtistName() %>"><br>
			<textarea name="description" placeholder="Description"><%= artist.getArtistDescription() %></textarea><br>
			<input type="file" name="artistImage"><br><br>
			<input type="submit" name="submit" value="Submit">
		</form>
	</div>
</body>
</html>