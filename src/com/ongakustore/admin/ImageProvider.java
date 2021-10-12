package com.ongakustore.admin;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ongakustore.SqlConnect;

/**
 * Servlet implementation class GetImagesController
 */
@WebServlet("/getImage")
public class ImageProvider extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ImageProvider() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String type = "";
		int id = 0;
		try {
			// Get type and Id parameters
			type = request.getParameter("type");
			id = Integer.parseInt(request.getParameter("id"));
			
			// Get image stream from database
			InputStream is = getImageStream(type,id);
			OutputStream os = response.getOutputStream();
			
			// Read all bytes into a temporary buffer
			byte[] buffer = is.readAllBytes();
			
			// Set content type to image
			response.setContentType("image/jpg");
			// Set content length
			response.setContentLength(buffer.length);
			
			// Write in to output stream and flush
			os.write(buffer);
			os.flush();
		}catch(Exception e){
			e.printStackTrace();
			return;
		}
	}
	
	// Get image stream from DB 
	protected InputStream getImageStream(String type, int id) throws Exception {
		StringBuilder query = new StringBuilder();
		System.out.println(type + " " +id);
		query.append("SELECT ");
		// Change query according to type
		switch(type) {
		case"artist":
			query.append("artistImage FROM Artist WHERE artistId = "+ id +";");
			break;
		case"album":
			query.append("albumArt FROM Music WHERE songId = "+ id +";");
			break;
		default:
			throw new Exception("Wrong params");
		}
		Connection conn = SqlConnect.connect();
		PreparedStatement ps = conn.prepareStatement(query.toString());
		
		ResultSet rs = ps.executeQuery();
		
		if(!rs.next()) {
			throw new Exception("Id not in database");
		}
		// Return InputStream
		return rs.getBlob(1).getBinaryStream();
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
