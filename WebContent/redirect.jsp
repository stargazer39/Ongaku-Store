<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Redirecting</title>
</head>
<body>
	<%
		// boolean sucess = (request.getParameter("sucess") == "true") ? true : false;
	       boolean success = (boolean) request.getAttribute("success");
	       System.out.println(success);
	%>
	<c:if test="${success}">
		<h1>Operation was sucessful! Redirecting...</h1>
	</c:if>
	
	<c:if test="${!success}">
		<h1>Operation faild. Redirecting...</h1>
	</c:if>
</body>
</html>