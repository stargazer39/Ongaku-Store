package com.ongakustore;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeleteAccountServlet
 */
@WebServlet("/DeleteAccountServlet")
public class DeleteAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteAccountServlet() {
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
		
		try {
			//Commit to database
			Connection conn = SqlConnect.connect();
			StringBuilder query = new StringBuilder();
			
			String em = new String("nithularatnayaker@gmail.com");	
			query.append("DELETE FROM OngakuUser WHERE email = ?");
			PreparedStatement ps = conn.prepareStatement(query.toString());
			ps.setString(1,em);
			
			
			System.out.println(query.toString());
			int i = ps.executeUpdate(); 
			if(i <= 0) throw new Exception("Sql Error");
			request.setAttribute("success", true);
			request.setAttribute("redirto", "https://www.youtube.com/watch?v=dQw4w9WgXcQ");
			
		}catch(Exception e) {
			System.out.println(e.toString());
			request.setAttribute("success", false);
		}
		RequestDispatcher rd = request.getRequestDispatcher("n_redirect.jsp");
		rd.forward(request,response);
	}

}
