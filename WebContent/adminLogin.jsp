<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<!-- Bootstrap -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
		<!-- Jquery -->
		<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
		
		<link rel="stylesheet" href="css/adminLogin.css">
		<link rel="stylesheet" href="css/common.css">
		<title>Login</title>
	</head>
<body>
 	<div class="h-100 d-flex justify-content-center align-items-center">
 		<div class="d-flex flex-column align-items-center mx-4">
 			<img src="img/logo_mini.png" class="p-3">
 			<h4>Ongaku Management</h4>
 		</div>
 		
	 	<div class="login-form p-4 white-text">
	 		<form id="loginForm"> 
				<div class="form-group">
					<lable for="uname">Username</lable><br>
					<input type="text" name="username" id="uname" placeholder="User Name"><br>
				</div><br>
				<div class="form-group">
					<lable for="pass">Password</lable><br>
					<input type="password" name="password" id="passs" placeholder="User Name"><br>
				</div><br>
				<input type="submit" id="loginSubmit" name="submit" value="Login">
			</form>
	 	</div>
 	</div>
 	<script>
 		let submit = $("#loginSubmit");
 		let loginForm = $("#loginForm");
 		let status = "";
 		
 		class Status {
 			constructor() {
 				this.elem = $("<div class='status-elem'>");
 			}
 			
 			setState(status){
 				switch(status) {
 				case "success":
 					this.elem
 						.css({ backgroundColor: "green" })
 						.html("Login Success");
 						break;
 				case "wup":
 					this.elem
 						.css({ backgroundColor: "red" })
 						.html("Wrong Password or Username combo");
 					break;
 				case "wp":
 					this.elem
 					.css({ backgroundColor: "red" })
					.html("Wrong Password. Try again.");
 					break;
 				}
 			}
 		}
 		
 		status = new Status();
 		loginForm.after(status.elem);
 		submit.click((e) => {
 			// Prevent the default submit action
 			e.preventDefault();
 			// Do the POST with ajax
 			$.ajax({
 				method: "POST",
 				url: "auth",
 				data: loginForm.serializeArray()
 			}).done((res) => {
 				console.log(res);
 				status.setState(res.status);
 				if(res.status === "success"){
 					window.open("adminPanel.jsp","_SELF");
 				}
 			});
 		});
 	</script>
</body>
</html>