package com.ongakustore;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		try {
			String email  = request.getParameter("userMail");
			String password = request.getParameter("userPass");
			
			String query = "SELECT userId, username, firstName, lastName, email FROM OngakuUser WHERE email = ? AND password = ? ; ";
			Connection conn = SqlConnect.connect();
			
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2,  password);
			
			
			ResultSet rs = ps.executeQuery();
			
			if(!rs.next()) {
				throw new Exception("User not found");
			}
			
			OngakuUser user = new OngakuUser();
			
			user.setfname(rs.getString(3));
			user.setlname(rs.getString(4));
			user.setUsername(rs.getString(2));
			user.setEmail(rs.getString(5));
			
			HttpSession session = request.getSession();
			session.setAttribute("currentUser", user);
			response.sendRedirect("http://www.google.com");
		}

		catch(Exception e) {
			e.printStackTrace();
			System.out.println(e.toString());
			request.setAttribute("success", false);
			RequestDispatcher rd = request.getRequestDispatcher("redirect.jsp");
			rd.forward(request,response);
		}
		
	}
	

}
