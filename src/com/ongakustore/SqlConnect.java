package com.ongakustore;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Scanner;
import java.io.File;
import java.io.FileNotFoundException;
import java.nio.file.Path;
import java.nio.file.Paths;

public class SqlConnect {
	public static Connection conn = null;
	public static String database = "Ongaku";
	
	public static Connection connect() throws FileNotFoundException {
		try {
			String creds[] = getCredentials();
			String connURL = "jdbc:sqlserver://" + creds[0] + ";"
	                + "database=" + database + ";"
	                + "user=" + creds[1] + ";"
	                + "password=" + creds[2] + ";"
	                + "loginTimeout=30;";
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			conn = DriverManager.getConnection(connURL);
			return conn;
		}catch(Exception e) {
			System.out.println(e);
			return null;
		}
	}
	
	public static String[] getCredentials() throws FileNotFoundException {
		Path credPath = Paths.get(System.getProperty("user.home"),"credentials.txt");
		File credentials = credPath.toFile();
		Scanner credReader = new Scanner(credentials);
		
		String host = credReader.nextLine();
		String username = credReader.nextLine();
		String password = credReader.nextLine();
		
		credReader.close();
		return new String[]{host, username, password};
	}
}
