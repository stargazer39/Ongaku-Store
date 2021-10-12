<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>
<%@ page import="com.ongakustore.SqlConnect,com.ongakustore.OngakuUser"%>
<%@ page import="java.sql.*, java.util.*" %>
<%
   //OngakuUser user = (OngakuUser) session.getAttribute("currentUser");
   //System.out.println(user);
   //if(user == null){
   //System.out.println("User not signed in");
   //}else{
   //response.sendRedirect("http://www.google.com");
   //}
   //%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
      <title>User Profile</title>
      <!-- Bootstrap CSS -->
      <link href="css/bootstrap.min.css" rel="stylesheet">
      <link href="css/style.css" rel="stylesheet">
      <link href="css/petals.css" rel="stylesheet">
      <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css">
      <!-- Javascript-->
      <script src="js/bootstrap.min.js"></script>
      <script src="js/slider.js"></script>
      <style>
         /* .submit1 {
         background-color: #FFB6C1;
         color: white;
         border: none;
         cursor: pointer;
         transition: all 0.4s ease-out;
         }
         .submit1:hover {
         background-color: pink;
         color: black;
         } */
         /* Set a style for all buttons */
         .bttn {
         background-color: #ff0f0f;
         color: white;
         padding: 14px 20px;
         margin: 8px 0;
         border: none;
         cursor: pointer;
         width: 100%;
         opacity: 0.9;
         }
         bttn:hover {
         opacity:1;
         }
         /* Float cancel and delete buttons and add an equal width */
         .cancelbtn, .deletebtn {
         float: left;
         width: 50%;
         }
         /* Add a color to the cancel button */
         .cancelbtn {
         background-color: #ccc;
         color: black;
         }
         /* Add a color to the delete button */
         .deletebtn {
         background-color: #f44336;
         }
         /* Add padding and center-align text to the container */
         .cntnr1 {
         padding: 16px;
         text-align: center;
         }
         /* The Modal (background) */
         .modal {
         display: none; /* Hidden by default */
         position: fixed; /* Stay in place */
         z-index: 1; /* Sit on top */
         left: 0;
         top: 0;
         width: 100%; /* Full width */
         height: 100%; /* Full height */
         overflow: auto; /* Enable scroll if needed */
         background-color: #474e5d;
         padding-top: 50px;
         }
         /* Modal Content/Box */
         .modal-content {
         background-color: #fefefe;
         margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
         border: 1px solid #888;
         width: 80%; /* Could be more or less, depending on screen size */
         }
         /* Style the horizontal ruler */
         hr {
         border: 1px solid #f1f1f1;
         margin-bottom: 25px;
         }
         /* The Modal Close Button (x) */
         .close {
         position: absolute;
         right: 35px;
         top: 15px;
         font-size: 40px;
         font-weight: bold;
         color: #f1f1f1;
         }
         .close:hover,
         .close:focus {
         color: #f44336;
         cursor: pointer;
         }
         /* Clear floats */
         .clearfix::after {
         content: "";
         clear: both;
         display: table;
         }
         /* Change styles for cancel button and delete button on extra small screens */
         @media screen and (max-width: 300px) {
         .cancelbtn, .deletebtn {
         width: 100%;
         }
         }
         /*Table*/
         .content-table {
         border-collapse: collapse;
         margin: auto;
         margin-bottom:10px;
         min-width: 600px;
         border-radius: 5px 5px 0 0;
         overflow: hidden;
         box-shadow: 0 0 20px rgba(0,0,0,0.15);
         }
         .content-table thead tr {
         background-color: #FF4162;
         color: white;
         text-align: left;
         font-weight: bold;
         }
         .content-table th,
         .content-table td {
         padding: 12px 15px;
         }
         .content-table tbody tr{
         background-color: #f3f3f3;
         border-bottom: 1px solid #dddddd;
         }
         .content-table tbody tr:last-of-type{
         border-bottom: 2px solid #FF4162;
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
         //user.setPicture(rs.getBlob(9));	
         %>
      <div id="blossom_container"></div>
      <script src="js/petals.js"></script>
      <!-- Topbar -->
      <div class="topbar">
         <img class="img-contain p-3" style="height: 60px" src="images/logo_mini.png">
         <div class="spacer"></div>
         <div class="mx-3">Home</div>
         <div class="mx-3">Sign in</div>
         <div class="mx-3">Register</div>
      </div>
      <!-- End of TopBar -->
      <div class=" container">
         <div style="background-color: pink; background-size:cover;" class="jumbotron">
            <div class="header1">
               <h1 class="display-2" style="color:white"><b>Hi <%= user.getfname() %>!!</b>
                  <button class="button btn-sm submit1" onclick="window.open('newEditProfile.jsp','_SELF')">Edit Profile</button>
               </h1>
               <h2 class="display-4" style="color:white">@ <%= user.getUsername() %></h2>
            </div>
         </div>
         <div class="grid-container">
            <div class="grid-item item1">
               <img src="GetImageServlet?userId=<%=userId%>" width="300px" class="float-left"/>
            </div>
            <div class="grid-item item2">
               <h3><b>Profile</b></h3>
               <br><br>
               <table style="width:100%" class="table table-hover">
                  <tr>
                     <th>First Name</th>
                     <th><%= (user.getfname() == null) ? "-" : user.getfname()%></th>
                  </tr>
                  <tr>
                     <th>Last Name</th>
                     <th><%= (user.getlname() == null) ? "-" : user.getlname() %></th>
                  </tr>
                  <tr>
                     <th>Username</th>
                     <th><%= user.getUsername() %></th>
                  </tr>
                  <tr>
                     <th>Email</th>
                     <th><%= user.getEmail() %></th>
                  </tr>
                  <tr>
                     <th>Date of Birth</th>
                     <th><%= (user.getDob() == null) ? "-" : user.getDob() %></th>
                  </tr>
                  <tr>
                     <th>Country</th>
                     <th><%= (user.getCountry() == null) ? "-" : user.getCountry() %></th>
                  </tr>
                  <tr>
                     <th>Gender</th>
                     <th><%= (user.getGender() == null) ? "-" : user.getGender() %></th>
                  </tr>
               </table>
            </div>
         </div>
         <!--  <center><form method="POST" class="register-form" id="register-form" name="register-form" action="DeleteAccountServlet" onSubmit="return validateDelete()">
            <div class="form-group form-button">
                                       <input type="submit" name="deleteAcc" id="deleteAcc" class="form-submit" value="Delete Account"/>
                           </div>
                           
            </form></center>-->
         <% 
            try{
            String query2 = "select m.title, a.artistName from purchasedTracks p, music m, artist a where p.songId = m.songId and m.artistId = a.artistId and userId = 2017";
            PreparedStatement ps2 = conn.prepareStatement(query2);
            //ps2.setInt(1,2017);
            ResultSet rs2 = ps2.executeQuery();	
            
            if(rs2.next()==false){
            	out.println("no records in the table!!");
            }
            else
            {%>
         <h2>PurchasedSongs </h2>
         <hr>
         <table class="content-table">
            <thead>
               <tr>
                  <th>Song Name</th>
                  <th>Artist Name </th>
                  <th></th>
               </tr>
            </thead>
            <tbody>
               <%
                  do{%>
               <tr>
                  <td> <%=rs2.getString(1)%></td>
                  <td> <%=rs2.getString(2)%></td>
               </tr>
               <%
                  }while(rs2.next()); %>
            </tbody>
         </table>
         <%
            }
            }catch (Exception e){
            e.printStackTrace();
            }
            %>
         <!-- Delete account button -->	
         <center>
            <button onclick="document.getElementById('id01').style.display='block'" class="bttn"> Delete Account </button>
            <div id="id01" class="modal">
               <span onclick="document.getElementById('id01').style.display='none'" class="close" title="close Modal">&times;</span>
               <form method="POST" class="modal-content" name="register-form" action="DeleteAccountServlet">
                  <div class = "container cntnr1">
                     <h1>Delete Account</h1>
                     <p>Are you sure you want to delete your account?</p>
                     <div class="clearfix">
                        <button type="button" class="cancelbtn">Cancel</button>
                        <button type="submit" class="deletebtn">Delete</button>
                     </div>
                  </div>
               </form>
            </div>
         </center>
      </div>
      <script>
         var modal = documnt.getElementById('id01');
         
         window.onclick = function(event){
         	if(event.target == modal){
         		modal.style.display = "none";
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
