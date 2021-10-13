<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,com.ongakustore.SqlConnect" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style-artistpage.css" type="text/css">
</head>
<body>
	<%
	int artistID= Integer.parseInt(request.getParameter("artistID"));
	int commentID= Integer.parseInt(request.getParameter("cmtid"));
	String cmnt= request.getParameter("cmnt");
	String sname= request.getParameter("sname");
	
	Statement stat=null;
	PreparedStatement stmt=null;
	Connection conn= SqlConnect.connect();
	%>


 			<div class="comment-box">
				<h2>Leave a comment:</h2>
				<form action="" method="post">
					<input type="text" name="name" value="<%=sname%>">
					<textarea name="comment" ><%=cmnt%></textarea>
					<button type="submit">Make changes</button>
				</form>
				<a href="deletecomment.jsp?commentid=<%=commentID%>&artistID=<%=artistID%>">delete</a>
			</div> 
</body>
</html>
<% 
String a= request.getParameter("name");
String b= request.getParameter("comment");
if(a!=null && b!=null){
	String query = "update artist_comments set screenName=?, comment=? where commentId=";
	stmt=conn.prepareStatement(query+commentID);
	stmt.setString(1, a);
	stmt.setString(2, b);
	stmt.executeUpdate();
	response.sendRedirect("artistpage.jsp?artistid="+artistID);
}
%>