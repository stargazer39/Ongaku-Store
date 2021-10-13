<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,com.ongakustore.SqlConnect" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
  <link rel="stylesheet" href="blah/style.css">
</head>
<body> 
<%
	int ticketID = Integer.parseInt(request.getParameter("ticketID"));
	
	Connection conn= SqlConnect.connect();
	String query = "SELECT firstName, lastName, email, description, date, subject FROM supportTicket WHERE ticketID = ?";
	PreparedStatement pStmt = conn.prepareStatement(query);
	pStmt.setInt(1,ticketID);
	
	ResultSet rs = pStmt.executeQuery();
	
	if(!rs.next()) {
		out.append("Wrong Support ticket Id");
		out.close();
	}
	
	String description = rs.getString(4);
	String subject = rs.getString(6);
	%>

   <form action="LoginServlet" method="POST">
	                <center>
	                <div class="edit-container">
							<input type="hidden" name="ticketId" value="<%=ticketID%>">
	                        <input class="input-text4" type="text" name="subject" placeholder="enter subject" value="<%=subject%>" >
	                    </div>

	                        <input  class="input-text3" type="text" name="description"  placeholder="enter description" value="<%=description%>">
	                    
	<!--        	        	<button type="button" class="eyeBtn" onclick="showPass()">
	                            <i class="fa fa-eye"></i> 
			                     </button>
	  -->                
	              
	                    <div >
	                        <div>
	                          </div>
	                        <div>
	                            <input class="btn1 " type="submit" value="Save">
	                        </div>
	                       </div>
			      </center>
                </form>


</body>
</html>
<%--<%
String a= request.getParameter("subject");
String b= request.getParameter("description");
if(a!=null && b!=null){
	int ticketID= Integer.parseInt(request.getParameter("ticketID"));
	String query = "update supportTicket set subject=?, description=? where ticketID";
	stmt=conn.prepareStatement(query+ticketID);
	stmt.setString(1, a);
	stmt.setString(2, b);
	stmt.executeUpdate();
	response.sendRedirect("edit-sucess.jsp?ticketID="+ticketID);
}
%> --%>
