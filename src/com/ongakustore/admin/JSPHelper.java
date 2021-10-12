package com.ongakustore.admin;

import javax.servlet.http.HttpSession;

public class JSPHelper {
	// Helper for checking if user authorized
	public static boolean isAuthorized(HttpSession session) {
		if(session.isNew()) {
			return false;
		}
		OngakuUser user = (OngakuUser) session.getAttribute("currentAdmin");
		return (user != null);
	}
}
