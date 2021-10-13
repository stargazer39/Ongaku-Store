package com.ongakustore;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ArtistServlet extends HttpServlet{
	static int i = 1004;
	public void service(HttpServletRequest req, HttpServletResponse res){
		i=  Integer.parseInt(req.getParameter("artistid"));
		System.out.println("Servlet received artist id: " + i);
	}
}

