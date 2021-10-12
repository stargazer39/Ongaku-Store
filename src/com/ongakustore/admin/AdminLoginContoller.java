package com.ongakustore.admin;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.google.gson.*;
import com.ongakustore.SqlConnect;
/**
 * Servlet implementation class AdminLoginContoller
 */
@WebServlet("/auth")
public class AdminLoginContoller extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private Gson gs = new Gson();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLoginContoller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			// Get username and password from request
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			
			try {
				// Get matching user's object 
				OngakuUser admin = this.validateAdmin(username, password);
				// Authorize the user
				this.authorize(request, response, admin);
			}catch(UserNotFoundException e) {
				// New Login response object
				LoginResponse lr = new LoginResponse();
				// Set error state
				lr.setSuccess(false);
				lr.setStatus("wup");
				
				// Convert to JSON string
				String json = this.gs.toJson(lr);
				
				// Set content type to JSON
				response.setContentType("application/json");
				response.getWriter().append(json).flush();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	protected void authorize(HttpServletRequest req, HttpServletResponse res, OngakuUser user) throws IOException {
		// Get session object
		HttpSession session = req.getSession();
		// Set currntAdmin user
		session.setAttribute("currentAdmin", user);
		
		// New LoginResponse object with current state
		LoginResponse rs = new LoginResponse();
		rs.setSuccess(true);
		rs.setStatus("success");
		
		String json = this.gs.toJson(rs);
		res.setContentType("application/json");
		res.getWriter().append(json).flush();
	}
	protected OngakuUser validateAdmin(String username, String password) throws UserNotFoundException, SQLException, FileNotFoundException {
		// Query the matching user
		Connection conn = SqlConnect.connect();
		String query = "SELECT userId, username, firstName, lastName, country, gender FROM OngakuUser WHERE username = ? AND password = ? ;";
		PreparedStatement ps = conn.prepareStatement(query);
		ps.setString(1, username);
		ps.setString(2, password);
		// TODO - check the user role
		ResultSet rs = ps.executeQuery();
		// If no user entry found, throw exception
		if(!rs.next()) throw new UserNotFoundException("User Not found");
		
		// Create a user object and return it
		OngakuUser user = new OngakuUser();
		user.setfname(rs.getString(3));
		user.setlname(rs.getString(4));
		user.setUsername(rs.getString(2));
		
		return user;
	}
}
