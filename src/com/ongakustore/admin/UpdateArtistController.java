package com.ongakustore.admin;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.ongakustore.SqlConnect;

import java.sql.*;
/**
 * Servlet implementation class UpdateArtistController
 */
@WebServlet("/updateArtist")
@MultipartConfig
public class UpdateArtistController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateArtistController() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			// Check if admin authorized before sending artist info
			boolean authorized = JSPHelper.isAuthorized(request.getSession());
			if(!authorized){
				 response.sendRedirect("notAuthorized.jsp");
				 return;
			}
			
			String artistId = request.getParameter("artistId");
			String artistName = request.getParameter("artistName");
			String description = request.getParameter("description");
			
			// Get artisImage stream
			Part filePart = request.getPart("artistImage");
			InputStream imageStream = filePart.getInputStream();
			
			Connection conn = SqlConnect.connect();
			String query = "UPDATE Artist SET  artistName = ?, artistDescription = ? WHERE artistId = ?";
			
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1,artistName);
			ps.setString(2, description);
			ps.setString(3, artistId);
			
			if(ps.executeUpdate() <= 0) {
				throw new Exception("SQL Query error");
			}
			
			if(filePart != null && filePart.getSize() != 0) {
				updateArtistImage(artistId, imageStream);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	private void updateArtistImage(String id, InputStream imageStream) throws Exception {
		Connection conn = SqlConnect.connect();
		String query = "UPDATE Artist SET  artistImage = ? WHERE artistId = ?";
		
		PreparedStatement ps = conn.prepareStatement(query);
		ps.setBinaryStream(1, imageStream);
		
		if(ps.executeUpdate() <= 0) {
			throw new Exception("SQL Query error");
		}
	}

}
