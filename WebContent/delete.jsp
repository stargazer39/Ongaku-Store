<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ page import="com.ongakustore.SqlConnect" %>
<%@ page import="java.sql.*,com.ongakustore.SqlConnect" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>delete</title>

</head>
<body>
<%
 int ticketID= Integer.parseInt(request.getParameter("ticketID"));
 /*int subject= Integer.parseInt(request.getParameter("subject"));
 int description= Integer.parseInt(request.getParameter("description"));
 */
 
 Connection conn= SqlConnect.connect();
 Statement stat=conn.createStatement();
 stat.executeUpdate("delete from supportticket where ticketID="+ticketID+"and ticketID="+ticketID);
 response.sendRedirect("mytickets.jsp?ticketID="+ticketID);
 %>
</body>
</html>