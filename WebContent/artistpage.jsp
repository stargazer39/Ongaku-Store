<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,com.ongakustore.SqlConnect" %>
<%@ page import="com.ongakustore.ArtistServlet" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Artist</title>
<link rel="stylesheet" href="css/style-artistpage.css" type="text/css">
<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css">
<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
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
		int artistID= Integer.parseInt(request.getParameter("artistid"));
		int userID= 2029;
		String sql= "select * from Artist where artistID=" + artistID;
		String sql2= "select * from Music where artistID=" + artistID;
		String sql3= "select * from artist_comments where artistID=" + artistID;
		
		Connection con= SqlConnect.connect();
		
		
		Statement st= con.createStatement();
		ResultSet rs= st.executeQuery(sql);
		rs.next();
	%>
	<div class="artist-header">
	
	
		<h2><%= rs.getString(2) %></h2>
		<h3><%= rs.getString(3) %></h3>


	</div>
	
	
	<%
		try{
		PreparedStatement stmt= con.prepareStatement(sql2);
		
		ResultSet rs2= stmt.executeQuery();
		
		if(rs2.next()==false){
			out.println("This artist hasnt uploaded any tracks.... yet(?)");
		}
		else
			{%>
			<table class="content-table">
			<thead>
				<tr>
					<th>Track</th>
					<th>Album</th>
					<th>Release Year </th>
					<th>Genre </th>
					<th> </th>
				</tr>
			</thead>
			<tbody>
				<%
				do{%>
					<tr>
					<td> <%=rs2.getString(3)%></td>
					<td> <%=rs2.getString(9)%></td>
					<td> <%=rs2.getString(5)%></td>
					<td> <%=rs2.getString(4)%></td>
					<td> 
					<a href="success.jsp?songid=<%=rs2.getString(1)%>&userid=<%=userID%>&artistID=<%=artistID%>">buy</a> 
					</td>
					
					
					</tr>
					<%
				}while(rs2.next()); %>
			</tbody>
			</table> <% 
			}
		}catch (Exception e){
			e.getStackTrace();
		}
		%>
	
	
		<div class="comment-section">
			<div class="comment-box">
				<h2>Leave a comment:</h2>
				<form action="commentsec.jsp?artistid=<%=artistID%>">
					<input type="text" name="screen_name" placeholder="Screen name...">
					<textarea name="comment" placeholder="Type Your Comment..."></textarea>
					<button type="submit">Submit comment</button>
				</form>
			</div> 
			<% 
			//String screen_name= request.getParameter("screen_name");
			//String comment= request.getParameter("comment");
			%>
			
		
			<div class="previous-comments">
			
			
					<%
				try{
				PreparedStatement stmt= con.prepareStatement(sql3);
				
				ResultSet rs3= stmt.executeQuery();
				
				if(rs3.next()==false){
					out.println("This artist doesnt have any comments yet!!");
				}
				else
					{%>
					<table class="comments-table">
					<thead>
						<tr>
							<th>screen-name</th>
							<th>comment</th>
						</tr>
					</thead>
					<tbody>
						<%
						do{%>
							<tr>
							<td> <%=rs3.getString(2)%></td>
							<td> <%=rs3.getString(3)%></td>
							<td> <a href="commentedit.jsp?artistID=<%=artistID%>&sname=<%=rs3.getString(2)%>&cmnt=<%=rs3.getString(3)%>&cmtid=<%=rs3.getString(1)%>">edit</a> </td>
							</tr>
							<%
						}while(rs3.next()); %>
					</tbody>
					</table> <% 
					}
				}catch (Exception e){
					e.getStackTrace();
				}
				%>
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

