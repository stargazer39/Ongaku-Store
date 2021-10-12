package com.ongakustore.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.*;
import com.ongakustore.SqlConnect;
/**
 * Servlet implementation class SearchArtistContoller
 */
@WebServlet("/getSongs")
public class SearchSongInfoProvider extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchSongInfoProvider() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		// Set JOSN response headers
		response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
		PrintWriter out = response.getWriter();
		Gson gs = new Gson();
		
		// Get match word
		String match = "";
		try {
			match = request.getParameter("like");
			if(match == "" || match == null) {
				out.append(gs.toJson("null"));
				out.flush();
				return;
			}
		}catch(Exception e) {
			e.printStackTrace();
			// On error send the error message in JSON
			out.append(gs.toJson(e.getMessage()));
			out.flush();
			return;
		}
		
		try {
			// Get all matching entries for the match word
			Connection conn = SqlConnect.connect();
			String query = "SELECT artistId, title, songId FROM Music WHERE title LIKE ?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1,"%"+match+"%");
			
			System.out.println(query);
			ResultSet rs = ps.executeQuery();
			// Response array
			List<Music> music = new ArrayList<Music>();
			
			while(rs.next()) {
				Music ms = new Music();
				
				ms.setSongId(rs.getInt(3));
				ms.setArtistId(rs.getInt(1));
				ms.setTitle(rs.getString(2));
				
				music.add(ms);
			}
			
			// Convert songs array to JSON string
			String jsonString = gs.toJson(music);
			// Send it
			out.append(jsonString);
		}catch(Exception e) {
			e.printStackTrace();
			// On error send the error message in JSON
			String jsonString = gs.toJson(e.getMessage());
			out.append(jsonString);
		}
		out.flush();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
