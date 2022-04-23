package dto;

import java.time.LocalDate;

public class User implements java.io.Serializable{
	private String user_email;
	private String user_PW;
	private String user_name;
	private LocalDate openDate;
	
	public User() {
	}
	
	public User(String userEmail, String userPassword) {
		this.user_email = userEmail;
		this.user_PW = userPassword;
	}
	
	public User(String userEmail, String userPassword, String userName) {
		this.user_email = userEmail;
		this.user_PW = userPassword;
		this.user_name = userName;
		LocalDate localDate = LocalDate.now();
		localDate.plusYears(1);
		this.openDate = localDate;
	}

	public String getUserEmail() {
		return user_email;
	}
	public void setUserEmail(String userEmail) {
		this.user_email = userEmail;
	}
	public String getUserPassword() {
		return user_PW;
	}
	public void setUserPassword(String userPassword) {
		this.user_PW = userPassword;
	}
	public String getUserName() {
		return user_name;
	}
	public void setUserName(String userName) {
		this.user_name = userName;
	}
	public LocalDate getOpenDate() {
		return openDate;
	}
	
	public void setOpenDate(LocalDate openDate) {
		this.openDate = openDate;
	}	
	
}
