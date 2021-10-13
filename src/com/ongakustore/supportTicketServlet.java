package com.ongakustore;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class supportTicketServlet
 */
@WebServlet("/supportTicketServlet")
public class supportTicketServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public supportTicketServlet() {
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
		supportTicket st = new supportTicket();
		
		st.setFname(request.getParameter("fname"));
		st.setLname(request.getParameter("lname"));
		st.setEmail(request.getParameter("email"));
		st.setSubject(request.getParameter("subject"));
		st.setDescription(request.getParameter("description"));
		
		try {
			//Commit to database
			Connection conn = SqlConnect.connect();
			String query = "INSERT SupportTicket(firstName,lastName,email,description,subject) VALUES (?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(query);
			
			ps.setString(1,st.getFname());
			ps.setString(2,st.getLname());
			ps.setString(3,st.getEmail());
			ps.setString(4,st.getDescription());
			ps.setString(5,st.getSubject());
			
			if(ps.executeUpdate() <= 0) {
				throw new Exception("FAILED!!");
			}
			request.setAttribute("success", true);
			RequestDispatcher rd =  request.getRequestDispatcher("ticket.jsp");
			rd.forward(request,response);
			
		} 
		catch(Exception e) {
			System.out.println(e.toString());
			request.setAttribute("success", false);		
		}
	}

}
		