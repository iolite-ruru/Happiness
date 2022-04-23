package dto;

public class User implements java.io.Serializable{
	private String userEmail;
	private String userPassword;
	private String userName;
	private String openDate;
	
	public User() {
	}
	
	public User(String userEmail, String userPassword, String userName, String openDate) {
		this.userEmail = userEmail;
		this.userPassword = userPassword;
		this.userName = userName;
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
	public String getOpenDate() {
		return openDate;
	}
	
	public void setOpenDate(String openDate) {
		this.openDate = openDate;
	}	
	
}
