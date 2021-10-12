<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Redirect Page</title>
</head>
<body>
	<%  if((boolean) request.getAttribute("success")){
			String redirectURL = (String) request.getAttribute("redirto");
			response.sendRedirect(redirectURL);
		}else{
			out.append("<div>An error occured!</div>");
		}
		
	%>
	
</body>
</html>