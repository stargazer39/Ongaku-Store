package com.ongakustore;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
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

import org.apache.tomcat.util.codec.binary.Base64;

/**
 * Servlet implementation class MusicController
 */
@WebServlet("/saveArtist")
@MultipartConfig
public class AddArtistController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddArtistController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			// Create a new artist
			Artist artist = new Artist();
			// Check if admin authorized before sending artist info
			boolean authorized = JSPHelper.isAuthorized(request.getSession());
			if(!authorized){
				 response.sendRedirect("notAuthorized.jsp");
				 return;
			}
			artist.setArtistName(request.getParameter("artistName"));
			artist.setArtistDescription(request.getParameter("description"));
			
			// Get albumArt stream
			Part filePart = request.getPart("artistImage");
			InputStream albumartStream = filePart.getInputStream();
			
			// Add to database
			int row = addArtistToDatabase(artist, albumartStream); 
			// Assert if success and set success attribute
			request.setAttribute("success",SqlHelper.assertSuccess(row));
		}catch(Exception e) {
			// Set success to false on exception
			System.out.println(e.toString());
			request.setAttribute("success",false);
		}
		
		// Redirect to redirect.jsp
		RequestDispatcher rd = request.getRequestDispatcher("redirect.jsp");
        rd.forward(request, response); 
	}
	
	// Function for adding artist to DB
	public int addArtistToDatabase(Artist artist, InputStream image) throws SQLException, FileNotFoundException {
		// Get database connection object
		Connection conn = SqlConnect.connect();
		String query = "INSERT INTO Artist (artistName, artistDescription, artistImage) VALUES (?, ?, ?)";
		// Prepare statement
		PreparedStatement ps = conn.prepareStatement(query);
		ps.setString(1,artist.getArtistName());
		ps.setString(2, artist.getArtistDescription());
		ps.setBlob(3,image);
		
		// Return if success
		return ps.executeUpdate();
	}
}
