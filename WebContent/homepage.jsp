<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="com.ongakustore.admin.SqlConnect,com.ongakustore.admin.Artist"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<!-- Bootstrap -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
		<!-- Jquery -->
		<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
		<title>Home</title>
		<link rel="stylesheet" href="css/common.css">
		<link rel="stylesheet" href="css/home.css">
		<!-- Footer stuff -->
		<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css">
		<link rel="stylesheet" href="css/footer.css">
	</head>
<body>
	<!-- Topbar -->
	<div class="topbar d-flex flex-row align-items-center">
		<img class="img-contain p-3" src="img/logo_mini.png">
		<div class="spacer"></div>
		<div class="mx-3">Home</div>
		<div class="mx-3">Sign in</div>
		<div class="mx-3">Register</div>
	</div>
	<% 
	// TODO - Error handling
		Connection conn = SqlConnect.connect();
		Statement stmt = conn.createStatement();
		String query = "SELECT artistId, artistName, artistDescription FROM Artist";
		ResultSet rs = stmt.executeQuery(query);
		
		List<Artist> topArtist = new ArrayList<Artist>();
		while(rs.next()){
			Artist ars = new Artist();
			ars.setArtistId(rs.getInt(1));
			ars.setArtistName(rs.getString(2));
			ars.setArtistDescription(rs.getString(3));
			
			topArtist.add(ars);
		}
		request.setAttribute("topArtists", topArtist); 
	%>
	<!-- Content -->
	<div class="p-2 d-flex flex-column align-items-center">
		<img class="img-contain logo-big" src="img/logo_wt.png">
	</div>
	<div class="mx-4">
		<h2 class="text-center py-2 white-text">Your look for music stops here.</h2>
		<h3 class="text-center white-text">Choose from 70M+ music from various artists</h3>
		<div class="song-wrapper container" id="song-wrapper-0">
			<div class="d-flex flex-row mt-4 justify-content-center">
				<c:forEach items="${topArtists}" var="artist">
					<div class="artist-elem">
						<img src="/OngakuStore/getImage?type=artist&id=${artist.getArtistId()}">
						<div>${artist.getArtistName()}</div>
					</div>
				</c:forEach>
			</div>
			<c:forEach items="${topArtists}" var="artist">
				<div class="feature-card my-4">
					<div class="card-image">
						<img src="/OngakuStore/getImage?type=artist&id=${artist.getArtistId()}" class="img-fill">
					</div>
					<div class="card-content">${artist.getArtistName()}</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<div id="bgplayer"></div>
	<!-- Bottom bar -->
	<!-- <div class="bottom-bar mb-4 container white-text">
		<div>
			<h1>Ongaku</h1>
		</div>
		<div class="bottom-links">
			<table>
				<tr>
					<th>Company</th>
					<th>Support</th>
					<th>Get Social</th>
				</tr>
				<tr>
					<td>About</td>
					<td>Jobs</td>
					<td>Copyright</td>
				</tr>
				<tr>
					<td>About</td>
					<td>Jobs</td>
					<td>Copyright</td>
				</tr>
				<tr>
					<td>About</td>
					<td>Jobs</td>
					<td>Copyright</td>
				</tr>
			</table>
		</div>
	</div> -->
	<style></style>
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
	<script>
		$(main);
		function main() {
			let songWrapper = $("#song-wrapper-0");
			let mouseDown = false;
			let mousePOS = 0;
			let scrollPOS = songWrapper.scrollLeft()
			
			$(window).on("mousemove", (e) => {
				if(mouseDown){
					e.preventDefault();
					songWrapper.scrollLeft(scrollPOS + mousePOS - e.clientX);
				}
			});
			songWrapper.on("mousedown", (e) => {
				e.preventDefault();
				mousePOS = e.clientX;
				mouseDown = true;
				scrollPOS = songWrapper.scrollLeft()
			});
			songWrapper.on("mouseup", (e) => {
				mouseDown = false;
			});
		}
	</script>
	<script src="js/youtube_home.js"></script>
</body>
</html>