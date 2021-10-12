package com.ongakustore;

public class OngakuUser {
	private String fname;
	private String lname;
	private String username;
	private String password;
	private String email;
	private String gender;
	private String country;
	private String dob;
	private byte image_data[];
	public String getfname() {
	return fname;
	}
	public void setfname(String fname) {
	this.fname = fname;
	}
	public String getlname() {
	return lname;
	}
	public void setlname(String lname) {
	this.lname = lname;
	}
	public String getPassword() {
	return password;
	}
	public void setPassword(String password) {
	this.password = password;
	}
	public String getEmail() {
	return email;
	}
	public void setEmail(String email) {
	this.email = email;
	}
	public String getGender() {
	return gender;
	}
	public void setGender(String gender) {
	this.gender = gender;
	}
	public String getCountry() {
	return country;
	}
	public void setCountry(String country) {
	this.country = country;
	}
	public String getDob() {
	return dob;
	}
	public void setDob(String dob) {
	this.dob = dob;
	}
	public byte[] getImage_data() {
	return image_data;
	}
	public void setImage_data(byte[] image_data) {
	this.image_data = image_data;
	}
	public String getUsername() {
	return username;
	}
	public void setUsername(String username) {
	this.username = username;
	}
}
