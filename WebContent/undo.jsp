<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*,com.ongakustore.SqlConnect" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%
 int userID= Integer.parseInt(request.getParameter("userid"));
 int songID= Integer.parseInt(request.getParameter("songid"));
 int artistID= Integer.parseInt(request.getParameter("artistID"));
 
 
 Connection conn= SqlConnect.connect();
 Statement stat=conn.createStatement();
 stat.executeUpdate("delete from PurchasedTracks where songid="+songID+"and userID="+userID);
 response.sendRedirect("artistpage.jsp?artistid="+artistID);
 %>

</body>
</html>