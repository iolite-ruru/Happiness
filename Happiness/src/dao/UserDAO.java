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
			String dbURL = "jdbc:mysql://127.0.0.1:3306/happiness?characterEncoding=utf8&serverTimezone=Asia/Seoul";
			String dbID = "happiness_admin";
			String dbPassword = "0812a";

			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword); //***********

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int login(User user) {
		String sql = "SELECT user_password FROM users WHERE user_email = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			// Debug
			// System.out.println("**"+user.getUserEmail());
			pstmt.setString(1, user.getUserEmail());
			//pstmt.setString(1, user.getUserPassword());
			rs = pstmt.executeQuery();
			System.out.println(sql);
			if (rs.next()) {
				if (rs.getString(1).equals(user.getUserPassword())) {
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
		System.out.println("join 함수 호출");
		System.out.println(user.getOpenDate());
		System.out.println(user.getUserEmail());
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserEmail());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return 0; // 이미 가입되어 있는 이메일
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		sql = "INSERT INTO USERS VALUES(?, ?, ?, str_to_date(?, '%Y-%m-%d'))"; // 포맷 확인
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserEmail());
			pstmt.setString(2, user.getUserName());
			pstmt.setString(3, user.getUserPassword());

			LocalDate localDate = LocalDate.now();
			user.setOpenDate(localDate.plusYears(1));
			System.out.println("date: "+user.getOpenDate());
			
			pstmt.setString(4, user.getOpenDate().toString());
			pstmt.executeUpdate();					//*****************************
			// pstmt.close(); //JDBC 자원 해제
			
			return 1; // 로그인 완료
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB 오류
	}
}
