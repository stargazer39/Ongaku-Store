package com.ongakustore.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ongakustore.SqlConnect;

import java.sql.*;
/**
 * Servlet implementation class DeleteArtistContoller
 */
@WebServlet("/deleteArtist")
public class DeleteArtistContoller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteArtistContoller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String attistId = request.getParameter("artistId");
			
			Connection conn = SqlConnect.connect();
			String query = "DELETE FROM Artist WHERE artistId = ?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, attistId);
			
			if(!SqlHelper.assertSuccess(ps.executeUpdate())) {
				throw new Exception("SQL Query error");
			};
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
