package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;

import dto.Post;
import dto.User;

public class PostDAO {
	private Connection conn;
//	private PreparedStatement pstmt;
	private ResultSet rs;

	public PostDAO() {
		try {
			String dbURL = "jdbc:mysql://127.0.0.1:3306/happiness?characterEncoding=utf8&serverTimezone=Asia/Seoul";
			String dbID = "happiness_admin";
			String dbPassword = "0812a";

			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int writePost(Post post) {
		String sql = "INSERT INTO posts(post_id, user_email, is_public, post_title, post_body, write_date, post_icon)"
				+ "VALUES(null, ?, ?, ?, ?, str_to_date(?, '%Y-%m-%d'), ?)";
		try {
			/*
			 * int id = getNextId(); if (id == -1) return -1;
			 */

			// 임시 코드
			post.setPostIcon(1);
			post.setWriteDate(LocalDate.now());
			post.setPublic(false);
			
			PreparedStatement pstmt = conn.prepareStatement(sql);

			// pstmt.setInt(1, null); //post_id (AUTO_INCREMENT 설정함)
			// System.out.println(post.getUserEmail());
			pstmt.setString(1, post.getUserEmail()); // error
			pstmt.setBoolean(2, post.isPublic()); // *********** 후에 수정해야할 부분(Boolear, String)
			pstmt.setString(3, post.getPostTitle());
			pstmt.setString(4, post.getPostBody());
			pstmt.setString(5, post.getWriteDate().toString());
			pstmt.setInt(6, post.getPostIcon());

			pstmt.executeUpdate();
			pstmt.close(); // 임시 코드
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB 에러
	}

	/*
	 * public int getNextId() { String sql =
	 * "SELECT  post_id from posts ORDER BY post_id DE"; try { pstmt =
	 * conn.prepareStatement(sql); rs = pstmt.executeQuery(); if (rs.next()) {
	 * return rs.getInt(1) + 1; } return 1; } catch (Exception e) {
	 * e.printStackTrace(); } return -1; // DB 에러 }
	 */

}
