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

	public UserDAO() {
		try {
			String dbURL = "jdbc:oracle:thin:@localhost:1521:XE";
			String dbID = "system";
			String dbPassword = "0812";

			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int login(User user) {
		String sql = "SELECT user_password FROM users WHERE user_email = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserEmail()); // "test"
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(user.getUserPassword())) { // "test"
					return 1; // 로그인 성공
				} else {
					return 0;
				}
			}
			return -1; // 유효하지 않은 회원
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // DB 오류
	}

	public int join(User user) {
		String sql = "SELECT * FROM users WHERE user_email = ?";
		/*
		 * try { pstmt = conn.prepareStatement(sql); pstmt.setString(1,
		 * user.getUserEmail()); rs = pstmt.executeQuery(); if (rs.next()) { return 0;
		 * //이미 가입되어 있는 이메일 } } catch (Exception e) { e.printStackTrace(); }
		 */
		
		sql = "INSERT INTO USERS VALUES(?, ?, ?, to_date(?, 'yyyy.mm.dd'))";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserEmail());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			
			LocalDate localDate = LocalDate.now();
			localDate.plusYears(1);
			user.setOpenDate(localDate);
			
			Date date = java.sql.Date.valueOf(user.getOpenDate()); //substring으로 값 잘라서 넣기..?
			pstmt.setDate(4, date);
			//pstmt.executeQuery();
			pstmt.executeUpdate();
			//pstmt.close(); //JDBC 자원 해제. 일단 추가해둠.
			
			return 1; //로그인 완료
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB 오류
	}
}
