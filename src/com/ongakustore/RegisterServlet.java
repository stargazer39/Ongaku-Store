package com.ongakustore;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
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
		OngakuUser user = new OngakuUser();
		
		user.setfname(request.getParameter("fname"));
		user.setlname(request.getParameter("lname"));
		user.setEmail(request.getParameter("email"));
		user.setPassword(request.getParameter("password"));
		user.setUsername(request.getParameter("username"));

		try {
			//Commit to database
			Connection conn = SqlConnect.connect();
			Statement stmt = conn.createStatement();
			StringBuilder query = new StringBuilder();
			
			query.append("INSERT INTO OngakuUser (firstName,lastName,email,password,username) VALUES (");
			query.append("'" + user.getfname() + "',");
			query.append("'" + user.getlname() + "',");
			query.append("'" + user.getEmail() + "',");
			query.append("'" + user.getPassword() + "',");
			query.append("'" + user.getUsername() + "'");
			query.append(");");
			
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

}
