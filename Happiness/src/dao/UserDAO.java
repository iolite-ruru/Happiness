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
			// Debug
			// System.out.println("**"+user.getUserEmail());
			pstmt.setString(1, user.getUserEmail());
			pstmt.setString(1, user.getUserPassword());
			rs = pstmt.executeQuery();
			System.out.println(sql);
			if (rs.next()) {
				if (rs.getString(1).equals(user.getUserPassword())) {
					return 1; // �α��� ����
				} else {
					return 0;
				}
			}
			return -1; // ��ȿ���� ���� ȸ��
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // DB ����
	}

	public int join(User user) {
		String sql = "SELECT * FROM users WHERE user_email = ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserEmail());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return 0; // �̹� ���ԵǾ� �ִ� �̸���
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		sql = "INSERT INTO USERS VALUES(?, ?, ?, to_date(?, 'yyyy-mm-dd'))"; // ���� Ȯ��
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserEmail());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());

			LocalDate localDate = LocalDate.now();
			user.setOpenDate(localDate.plusYears(1));
			
			//Debug
//			System.out.println(localDate.plusYears(1));
//			System.out.println(localDate);
			
			pstmt.setString(4, user.getOpenDate().toString());
			pstmt.executeUpdate();
			// pstmt.close(); //JDBC �ڿ� ����
			
			return 1; // �α��� �Ϸ�
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB ����
	}
}
