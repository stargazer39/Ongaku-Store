package com.ongakustore;

import java.io.InputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;



/**
 * Servlet implementation class EditProfileServlet
 */
@WebServlet("/EditProfileServlet")
@MultipartConfig
public class EditProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 OngakuUser user = new OngakuUser();
		 String em = new String ("nithularatnayaker@gmail.com");
		
		
		try {
			 Part filePart = request.getPart("picture");
			InputStream pictureStream = filePart.getInputStream();
			if(filePart != null && filePart.getSize() != 0)
			addPictureToDatabase(pictureStream, em);
			
		}catch(Exception e) {
			System.out.println(e.toString());
			request.setAttribute("success", false);
			
		}
		user.setfname(request.getParameter("fname"));
		user.setlname(request.getParameter("lname"));
		user.setEmail(request.getParameter("email"));
		user.setUsername(request.getParameter("username"));
		user.setPassword(request.getParameter("password"));
		user.setGender(request.getParameter("gender"));
		user.setCountry(request.getParameter("country"));
		user.setDob(request.getParameter("dob"));
		
		try {
			//Commit to database
			Connection conn = SqlConnect.connect();
			
			Statement stmt = conn.createStatement();
			StringBuilder query = new StringBuilder();
				
			query.append("UPDATE OngakuUser SET");
			query.append(" firstname = '" + user.getfname() + "', ");
			query.append("lastName = '" + user.getlname() + "', ");
			query.append("password = '" + user.getPassword() + "', ");
			query.append("country = '" + user.getCountry() + "', ");
			query.append("username = '" + user.getUsername() + "',");
			query.append("gender = '" + user.getGender() + "', ");
			query.append("dob = '" + user.getDob() + "'");
			query.append(" WHERE ");
			query.append("email = '" + em + "';");
			
			System.out.println(query.toString());
			int i = stmt.executeUpdate(query.toString()); 
			if(i <= 0) throw new Exception("Sql Error");
			
			request.setAttribute("success", true);
			request.setAttribute("redirto", "UserProfile.jsp");
		}catch(Exception e) {
			System.out.println(e.toString());
			request.setAttribute("success", false);
		}
		RequestDispatcher rd = request.getRequestDispatcher("n_redirect.jsp");
		rd.forward(request,response);
		
		
		
	}
	public int addPictureToDatabase(InputStream image , String e) throws SQLException, FileNotFoundException{
		//Commit to database
		Connection conn = SqlConnect.connect();
		String query = "Update OngakuUser SET picture = ? WHERE email = ?";
		PreparedStatement ps = conn.prepareStatement(query);
		ps.setBlob(1,image);
		ps.setString(2,e);
		
		return ps.executeUpdate();
		
	}
}