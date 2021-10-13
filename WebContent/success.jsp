<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,com.ongakustore.SqlConnect" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Successful Purchase!!!</title>
<link rel="stylesheet" href="CSS/style-artistpage.css" type="text/css">
</head>
<body>




 <%
 int userID= Integer.parseInt(request.getParameter("userid"));
 int songID= Integer.parseInt(request.getParameter("songid"));
 int artistID= Integer.parseInt(request.getParameter("artistID"));
 
 Connection conn= SqlConnect.connect();
 PreparedStatement stat=null;
 String data="insert into PurchasedTracks(songId,userID) values(?,?)";
 stat=conn.prepareStatement(data);
 stat.setInt(1, songID);
 stat.setInt(2, userID);
 stat.executeUpdate();
 %>
 
 
 
 <div class=notif>
 <h1>Successful Purchase!!!</h1>
	 <div class="buttons">
	 <a href="artistpage.jsp?artistid=<%=artistID%>" class= "button">return</a>
	 <a href="undo.jsp?artistID=<%=artistID%>&songid=<%=songID%>&userid=<%=userID%>" class= "button">undo</a>
	 </div>
 </div>
</body>
</html>