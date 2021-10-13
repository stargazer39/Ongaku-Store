package com.ongakustore;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Scanner;
import java.io.File;
import java.io.FileNotFoundException;
import java.nio.file.Path;
import java.nio.file.Paths;

public class ArtistpageServlet {
	
	int artistID=1004;
	String url="jdbc:sqlserver://188.166.240.175:1433";
	String username="SA";
	String password="4VkaD%hnt@QRokZ%W$AKnZX";
	String sql= "select * from Artist where artistID=" + artistID;
	String sql2= "select * from Music where artistID=" + artistID;
	String sql3= "select * from artist_comments where artistID=" + artistID;
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	Connection con= DriverManager.getConnection(url,username,password);
	Statement st= con.createStatement();
	
	ResultSet rs= st.executeQuery(sql);
	rs.next();

}
