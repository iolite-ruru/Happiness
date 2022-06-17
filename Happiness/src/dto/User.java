package dto;

import java.time.LocalDate;

public class User implements java.io.Serializable {
	private static final long serialVersionUID = -4274700572038677000L;
	
	private String userEmail;
	private String userPassword;
	private String userName;
	private LocalDate openDate;

	public User() {
	}

	public User(String userEmail, String userPassword) {
		this.userEmail = userEmail;
		this.userPassword = userPassword;
	}

	public User(String userEmail, String userPassword, String userName, LocalDate openDate) {
		this.userEmail = userEmail;
		this.userPassword = userPassword;
		this.userName = userName;
		/*
		 * LocalDate localDate = LocalDate.now(); localDate.plusYears(1);
		 */
		this.openDate = openDate;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public LocalDate getOpenDate() {
		return openDate;
	}

	public void setOpenDate(LocalDate openDate) {
		/*
		 * LocalDate localDate = LocalDate.now(); localDate.plusYears(1); this.openDate
		 * = localDate;
		 */
		
		this.openDate = openDate;
	}

}