<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.ongakustore.SqlConnect,com.ongakustore.OngakuUser"%>
<%@ page import="java.sql.*, java.util.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Edit Profile</title>
        <!-- Font Icon -->
        <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
        <!-- Main css -->
        <link rel="stylesheet" href="css/register.css">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css">
        <!-- Bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
        <style>
            h2{
            color:white !important;
            }
        </style>
    </head>
    <body>
        <%
            //Httpsession session = request.getSession();	
            //OngakuUser user = (OngakuUser) session.getAttribute("loggedUser"); When visal does the sessions , can remove the whole below part 
            
            String em = new String("nithularatnayaker@gmail.com");
            
            Connection conn = SqlConnect.connect();
            Statement stmt = conn.createStatement();
            String userid = request.getParameter("id");
            System.out.println(userid);
            
            String query = "SELECT * FROM OngakuUser WHERE email = ? ";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1,em);
            ResultSet rs = ps.executeQuery();
            rs.next();
            
            OngakuUser user = new OngakuUser(); 
            String userId = rs.getString(1);
            user.setfname(rs.getString(2));
            user.setlname(rs.getString(3));
            user.setEmail(rs.getString(4));
            user.setDob(rs.getString(8));
            user.setCountry(rs.getString(6));
            user.setGender(rs.getString(7));
            user.setUsername(rs.getString(10));		
            %>
        <!-- Topbar -->
        <div class="topbar d-flex flex-row align-items-center">
            <img class="img-contain p-3" src="images/logo_mini.png">
            <div class="spacer"></div>
            <div class="mx-3"><a href="homepage.jsp">Home</a></div>
			<div class="mx-3"><a href="Login.jsp">Sign in</a></div>
			<div class="mx-3"><a href="registration.jsp">Register</a></div>
        </div>
        <!-- End of TopBar -->
        <div class="main">
            <!-- Edit Profile form -->		
            <section class="signup">
                <div class="container" style="width: 1100px">
                    <div class="signup-content">
                        <div style="background-color: pink; background-size:cover; box-shadow: 0 0 20px rgba(0,0,0,0.15);" class="jumbotron">
                            <center>
                                <div class="header1">
                                    <h2 class="form-title" style="font-size: 3rem;">Edit Profile</h2>
                                </div>
                            </center>
                            <div class="signup-image">
                                <img src="GetImageServlet?userId=<%=userId%>" alt="sign up image">
                            </div>
                        </div>
                        <div class="signup-form">
                            <form action="EditProfileServlet" method="POST" class="register-form" id="register-form" enctype="multipart/form-data" onsubmit="return checkPassword()" >
                                <div class="form-group">
                                    <br><label for="country">First Name:</label><br>                               
                                    <input type="text" name="fname" id="fname" placeholder="First Name" value="<%= user.getfname()%>"/>
                                </div>
                                <div class="form-group">
                                    <br><label for="country">Last Name:</label><br>                               
                                    <input type="text" name="lname" id="lname" placeholder="Last Name" value="<%= user.getlname() %>"/>
                                </div>
                                <div class="form-group">
                                    <br><label for="country">Username:</label><br>                               
                                    <input type="text" name="username" id="username" placeholder="Username" value="<%= user.getUsername() %>" />
                                </div>
                                <div class="form-group">
                                    <br><label for="country">Email:</label><br>                                
                                    <input type="email" name="email" id="email" placeholder="Your Email" value="<%= user.getEmail() %>" disabled/>
                                </div>
                                <div class="form-group">
                                    <br><label for="country">Gender: Male/Female/Other</label><br>                              
                                    <input type="text" name="gender" id="gender" placeholder="Gender" value="<%= user.getGender() %>"/>
                                </div>
                                <div class="form-group">
                                    <br><label for="country">Country:</label><br>                             
                                    <input type="text" name="country" id="country" placeholder="Country" value="<%= user.getCountry() %>"/>
                                </div>
                                <div class="form-group">
                                    <br><label for="country">Date Of Birth:</label><br>                                
                                    <input type="text" name="dob" id="dob" placeholder="YYYY-MM-DD" value="<%= user.getDob() %>"/>
                                </div>
                                <div class=" form-group">
                                    <br><label for="country">Profile Picture:</label><br>
                                    <input type="file" name="picture" id="picture" >    
                                </div>
                                <div class="form-group">
                                    <br><label for="country">Password:</label><br>                               
                                    <input type="password" name="password" id="password" placeholder="Password" value="<%= user.getPassword() %>"/>
                                </div>
                                <div class="form-group">
                                    <br><label for="country">Re-enter Password:</label><br>                                
                                    <input type="password" name="re_pass" id="re_pass" placeholder="Repeat your password"/>
                                </div>
                                <div class="form-group form-button">
                                    <input type="submit" name="signup" id="signup" class="form-submit" value="Update"/>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <!-- JS -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="js/main.js"></script>
        <script>
            function checkPassword(){
            	let x = document.forms["register-form"]["password"].value;
            	let y = document.forms["register-form"]["re_pass"].value;
            if(x !== y){
            	alert("Password doesn't match");
            	return false;
            }
            }
        </script>
        <!-- Footer -->
        <footer class="footer">
            <div class="footer-container">
                <div class="footer-row">
                    <div class="footer-col">
                        <h4>company</h4>
                        <ul class="blablabla">
                            <li><a href="#">about us</a></li>
                            <li><a href="#">our services</a></li>
                            <li><a href="#">privacy policy</a></li>
                        </ul>
                    </div>
                    <div class="footer-col">
                        <h4>get help</h4>
                        <ul class="blablabla">
                            <li><a href="#">FAQ</a></li>
                        </ul>
                    </div>
                    <div class="footer-col">
                        <h4>purchases</h4>
                        <ul class="blablabla">
                            <li><a href="#">purchases info</a></li>
                            <li><a href="#">refunds</a></li>
                            <li><a href="#">order status</a></li>
                            <li><a href="#">payment options</a></li>
                        </ul>
                    </div>
                    <div class="footer-col">
                        <h4>follow us</h4>
                        <div class="social-links">
                            <a href="#"><i class="fab fa-facebook-f"></i></a>
                            <a href="#"><i class="fab fa-twitter"></i></a>
                            <a href="#"><i class="fab fa-instagram"></i></a>
                            <a href="#"><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- End of footer -->
    </body>
</html>
