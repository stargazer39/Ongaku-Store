<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.ongakustore.admin.OngakuUser,com.ongakustore.admin.JSPHelper" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	boolean authorized = JSPHelper.isAuthorized(session);
	if(!authorized){
		 response.sendRedirect("notAuthorized.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Management</title>
	<!-- Bootstrap -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
	<!-- Jquery -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	
	<link rel="stylesheet" href="css/common.css">
	<link rel="stylesheet" href="css/adminPanel.css">
</head>
<body>
	<!-- Topbar -->
	<div class="topbar d-flex flex-row align-items-center">
		<img class="img-contain p-3" src="img/logo_mini.png">
		<div class="spacer"></div>
		<div class="mx-4"><a href="adminLogout.jsp" >Logout</a></div>
	</div>
	<div class="content-wrapper d-flex flex-row">
		<!-- Side Bar -->
		<div class="sidebar">
			<div class="py-2 px-4" data-goto='addArtist.jsp'>Add Artist</div>
			<div class="py-2 px-4" data-goto='searchArtist.jsp'>Manage Artists</div>
			<div class="py-2 px-4" data-goto='searchSongs.jsp'>Manage Songs</div>
			<div class="py-2 px-4">Manage Administrators</div>
		</div>
		
		<!-- Main Iframe -->
		<div class="iframe-wrapper py-3">
			<iframe src="addArtist.jsp" id="frame-1"></iframe>
		</div>
	</div>
	<script>
		// Get the frame element
		let frame = $("#frame-1");
		// Get sidebar elemnts
		let links = $(".sidebar > div");
		
		for(let lElem of links){
			// EventListener to navigate within the iframe
			lElem = $(lElem);
			lElem.on("click", (e) => {
				let href = lElem.data('goto');
				if(href) {
					links.removeClass('sidebar-clicked');
					frame.attr("src", href);
					lElem.addClass('sidebar-clicked');
				}
				
			});
		}
	</script>
</body>
</html>