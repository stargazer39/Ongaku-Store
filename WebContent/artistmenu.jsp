<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,com.ongakustore.SqlConnect" %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>artists</title>
	<link rel="stylesheet" href="css/footer.css">
	<link rel="stylesheet" href="css/style-artistmenu.css" type="text/css">
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css">
	<link rel="stylesheet" href="css/common.css" type="text/css">
<!-- Bootstrap -->
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
-->
</head>
<style>
	.align-items-center {
    	align-items: center!important;
	}
	.flex-row {
	    flex-direction: row!important;
	}
	.d-flex {
	    display: flex!important;
	}
	.mx-3 {
	    margin-right: 1rem!important;
	    margin-left: 1rem!important;
	}
	.p-3 {
	    padding: 1rem!important;
	}
	.img-contain {
	    height: 70% !important;
	    object-fit: contain;
	}
</style>
<body>
<!-- Topbar -->
    <div class="topbar d-flex flex-row align-items-center">
        <img class="img-contain p-3" src="img/logo_mini.png">
        <div class="spacer"></div>
        <div class="mx-3"><a href="homepage.jsp">Home</a></div>
		<div class="mx-3"><a href="Login.jsp">Sign in</a></div>
		<div class="mx-3"><a href="registration.jsp">Register</a></div>
    </div>
	<section class="xop-section">
		<div	class="xop-container">
			<a class="project" href="artistpage.jsp?artistid=2004">
				<figure>
					<img src="images/ariana.jpeg" alt="idk"
					title="title">
					<figcaption>
						<div>
							<h3>Ariana Grande</h3>
							<p class="cta"> She can sing.. kinda. no auto tune?</p>
						</div>
					</figcaption>
				</figure>
			</a>
			<a class="project" href="artistpage.jsp?artistid=2005">
				<figure>
					<img src="images/suburban.jpg" alt="idk"
					title="title">
					<figcaption>
						<div>
							<h3>Sub Urban</h3>
							<p class="cta">dopeeeeee</p>
						</div>
					</figcaption>
				</figure>
			</a>
			<a class="project" href="artistpage.jsp?artistid=2006">
				<figure>
					<img src="images/eminem.jpeg" alt="idk"
					title="title">
					<figcaption>
						<div>
							<h3>Eminem</h3>
							<p class="cta">The goat himselffff</p>
						</div>
					</figcaption>
				</figure>
			</a>
			<a class="project" href="artistpage.jsp?artistid=2007">
				<figure>
					<img src="images/blackpink.webp" alt="idk"
					title="title">
					<figcaption>
						<div>
							<h3>BLACKPINK</h3>
							<p class="cta">saucy</p>
						</div>
					</figcaption>
				</figure>
			</a>
			<a class="project" href="artistpage.jsp?artistid=2009">
				<figure>
					<img src="images/blackbear.jpg" alt="idk"
					title="title">
					<figcaption>
						<div>
							<h3>blackbear</h3>
							<p class="cta">depresso espresso</p>
						</div>
					</figcaption>
				</figure>
			</a>
			<a class="project" href="artistpage.jsp?artistid=2008">
				<figure>
					<img src="images/selena.jpg" alt="idk"
					title="title">
					<figcaption>
						<div>
							<h3>Selena Gomez</h3>
							<p class="cta">HAHAHAHAHAHA JUSTIN</p>
						</div>
					</figcaption>
				</figure>
			</a>
			<a class="project" href="#">
				<figure>
					<img src="images/chainsmokers.jpeg" alt="idk"
					title="title">
					<figcaption>
						<div>
							<h3>The Chainsmokers</h3>
							<p class="cta">Stopped smoking (?) CANCER (?)</p>
						</div>
					</figcaption>
				</figure>
			</a>
			<a class="project" href="#">
				<figure>
					<img src="images/taylorswift.jpg" alt="idk"
					title="title">
					<figcaption>
						<div>
							<h3>Taylor Swift</h3>
							<p class="cta">snek</p>
						</div>
					</figcaption>
				</figure>
			</a>
			<a class="project" href="#">
				<figure>
					<img src="images/bts.jpg" alt="idk"
					title="title">
					<figcaption>
						<div>
							<h3>BTS</h3>
							<p class="cta">I.... eh..... *cricket noises*</p>
						</div>
					</figcaption>
				</figure>
			</a>
		</div>
	</section>
		<%
		try{
			
		String sql= "select artistName, artistID from Artist";
			
			
			
			
		Connection con= SqlConnect.connect();
		PreparedStatement stmt= con.prepareStatement(sql);
		
		ResultSet rs= stmt.executeQuery();
		
		if(rs.next()==false){
			out.println("no records in the table!!");
		}
		else
			{%>
			<table class="content-table">
			<thead>
				<tr>
					<th>Artist</th>
					<th>Artist id </th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<%
				do{%>
					<tr>
					<td> <%=rs.getString(1)%></td>
					<td> <%=rs.getString(2)%></td>
					<td> <a href="artistpage.jsp?artistid=<%=rs.getString(2)%>">visit</a></td>
					</tr>
					<%
				}while(rs.next()); %>
			</tbody>
			</table> <% 
			}
		}catch (Exception e){
			e.printStackTrace();
		}
		%>
	
	<div>
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
	
	</div>
	
	
</body>

</html>