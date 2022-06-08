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
	private PreparedStatement pstmt;
	private ResultSet rs;

	public PostDAO() {
		try {
			String dbURL = "jdbc:mysql://127.0.0.1:3306/happiness?characterEncoding=utf8&serverTimezone=Asia/Seoul";
			String dbID = "happiness_admin";
			String dbPassword = "0812a";

			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword); // ***********

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int writePost(Post post, User user) {
		String sql = "insert into posts vales(?, ?, ?, ?, ?, str_to_date(?, '%Y-%m-%d'), ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			int id = getNextId();
			if (id == -1)
				return -1;

			pstmt.setInt(1, id);
			pstmt.setString(2, user.getUserEmail());
			pstmt.setBoolean(3, post.isPublic());
			pstmt.setString(4, post.getPostTitle());
			pstmt.setString(5, post.getPostBody());
			pstmt.setString(6, LocalDate.now().toString());
			pstmt.setInt(7, post.getPostIcon());

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return -1; // DB 에러
	}

	public int getNextId() {
		String sql = "select post_id from posts order by post_id desc";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB 에러
	}

}
