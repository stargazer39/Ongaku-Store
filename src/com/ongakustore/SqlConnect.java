package com.ongakustore;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Scanner;
import java.io.File;
import java.io.FileNotFoundException;
import java.nio.file.Path;
import java.nio.file.Paths;

public class SqlConnect {
	private static Connection conn = null;
	private static String database = "Ongaku";
	
	public static Connection connect() throws FileNotFoundException {
		try {
			// Get credentials from file
			String creds[] = getCredentials();
			String connURL = "jdbc:sqlserver://" + creds[0] + ";"
	                + "database=" + database + ";"
	                + "user=" + creds[1] + ";"
	                + "password=" + creds[2] + ";"
	                + "loginTimeout=30;";
			// Get connection
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			conn = DriverManager.getConnection(connURL);
			return conn;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	// Utility function to get server credentials from file
	public static String[] getCredentials() throws FileNotFoundException {
		// Read credentials.txt from user's home dir
		Path credPath = Paths.get(System.getProperty("user.home"),"credentials.txt");
		File credentials = credPath.toFile();
		Scanner credReader = new Scanner(credentials);
		
		String host = credReader.nextLine();
		String username = credReader.nextLine();
		String password = credReader.nextLine();
		
		credReader.close();
		// Return credentials in a string array
		return new String[]{host, username, password};
	}
}
