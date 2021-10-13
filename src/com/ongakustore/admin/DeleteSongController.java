package com.ongakustore.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ongakustore.SqlConnect;

/**
 * Servlet implementation class DeleteSongController
 */
@WebServlet("/deleteSong")
public class DeleteSongController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteSongController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String songId = request.getParameter("songId");
			
			System.out.println(songId);
			Connection conn = SqlConnect.connect();
			String query = "DELETE FROM Music WHERE songId = ?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, songId);
			
			if(!SqlHelper.assertSuccess(ps.executeUpdate())) {
				throw new Exception("SQL Query error");
			};
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
