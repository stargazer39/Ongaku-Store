<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,com.ongakustore.SqlConnect,com.ongakustore.admin.Artist" %>
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
		<title>Add Song</title>
		<!-- Bootstrap -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
		<!-- Jquery -->
		<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
		
		<link rel="stylesheet" href="css/common.css">
	</head>
<body>
	<div class="container">
		<h1>Add Song [<%= artist.getArtistName() %>]</h1>
		<form action="addSong" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="artistId" value=<%= artist.getArtistId() %>>
			<div class="form-group">
				<lable for="title">Title</lable><br>
				<input type="text" name="title" id="title" placeholder="Title"><br>
			</div><br>
			<div class="form-group">
				<lable for="album">Album</lable><br>
				<input type="text" name="album" id="album" placeholder="Album"><br>
			</div><br>
			<div class="form-group">
				<lable for="releseDate">Relese Date</lable><br>
				<input type="date" name="releseDate" id="releseDate"><br>
			</div><br>
			<div class="form-group">
				<lable for="genre">Genre</lable><br>
				<select id="genre" name="genre">
					<option value="" selected disabled hidden>Choose here</option>
					<option value="pop">Pop</option>
				    <option value="jpop">J-Pop</option>
				    <option value="hiphop">Hip Hop</option>
				    <option value="rock">Rock</option>
				</select>
			</div><br>
			<div class="form-group">
				<lable for="musicFile">Select Music File</lable><br>
				<input type="file" name="musicFile" id="musicFile"><br>
			</div><br>
			<div class="form-group">
				<lable for="albumArt">Select Album Art</lable><br>
				<input type="file" name="albumArt" id="musicFile"><br>
			</div><br>
			<input type="submit" name="submit" value="Save">
		</form>
	</div>
</body>
</html>