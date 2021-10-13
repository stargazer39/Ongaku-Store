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
 int commentID= Integer.parseInt(request.getParameter("commentid"));
 int artistID= Integer.parseInt(request.getParameter("artistID"));
 
 Connection conn= SqlConnect.connect();
 Statement stat=conn.createStatement();
 stat.executeUpdate("delete from artist_comments where commentId="+ commentID);
 response.sendRedirect("artistpage.jsp?artistid="+artistID);
 %>

</body>
</html>