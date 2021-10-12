package com.ongakustore;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GetImageServlet
 */
@WebServlet("/GetImageServlet")
public class GetImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetImageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	// ?userid=0001;
	protected void doGet(HttpServletRequest req, HttpServletResponse res) {
		try {
			res.setContentType("image/jpg");
			String userId = req.getParameter("userId");
			String query = "SELECT picture FROM OngakuUser WHERE userid = ?";
			Connection conn = SqlConnect.connect();
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, userId);
			
			ResultSet rs = ps.executeQuery();
			rs.next();
			
			Blob blob = rs.getBlob(1);
			
			// Set content length
			res.setContentLengthLong(blob.length());
			
			InputStream is = blob.getBinaryStream();
			OutputStream os = res.getOutputStream();
   
			int BUFFER_SIZE = 102400;
			byte[] buffer = new byte[BUFFER_SIZE];
			int  bytesRead = -1; 
			while((bytesRead = is.read(buffer)) != -1) {
				os.write(buffer, 0, bytesRead);
			}
			
			is.close();
			os.close();
		}catch(Exception e) {
			
		}
		
		
	}
}
