package com.ongakustore.admin;

import java.sql.ResultSet;
import java.sql.SQLException;

public class SqlHelper {
	// Helper functions to assert if SQL query Success
	public static boolean assertSuccess(int rows) {
		return (rows > 0);
	}
	public static boolean assertSuccess(ResultSet rs) throws SQLException {
		int size = 0;
		while(rs.next()) {
			return true;
		}
		return false;
	}
}
