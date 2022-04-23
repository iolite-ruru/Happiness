package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import com.sun.jmx.snmp.Timestamp;

import dto.User;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO(){
		try{
			String dbURL = "jdbc:oracle:thin:@localhost:1521:XE";
			String dbID = "system";
			String dbPassword= "0812";
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public int login(String userEmail, String userPassword) {
		String sql = "SELECT user_password FROM users WHERE user_email = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userEmail);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					return 1; //로그인 성공
				}else {
					return 0;
				}
			}
			return -1; //유효하지 않은 회원
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; //DB 오류
	}
	
	public int join(User user) {
		String sql = "INSERT INTO USERS VALUES(?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserEmail());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			
			//LocalDate localDate = LocalDate.now();
			//localDate.plusYears(1);
			
			Date date = java.sql.Date.valueOf(user.getOpenDate());
			pstmt.setDate(5, date);
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //DB 오류
	}
}
