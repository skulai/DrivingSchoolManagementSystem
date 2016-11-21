
package com.dsms.servlet;
 
public class User {
 
	private String username;
	private String password;
	private String userId;
 
	public User(String username, String password, String userId){
		this.username = username;
		this.password = password;
		this.userId = userId;
	}
 
	public String getUsername() {
		return username;
	}
 
	public void setUsername(String username) {
		this.username = username;
	}
 
	public String getPassword() {
		return password;
	}
 
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getUserId() {
		return userId;
	}
 
	public void setUserId(String userId) {
		this.userId = userId;
	}
 
}