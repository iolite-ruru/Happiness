<%@ page import="java.sql.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Connection conn = null;
	try {
		String dbURL = "jdbc:mysql://127.0.0.1:3306/happiness?characterEncoding=utf-8&serverTimezone=Asia/Seoul";
		String dbID = "happiness_admin";
		String dbPassword = "0812a";

		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(dbURL, dbID, dbPassword);

	} catch (SQLException ex) {
		out.println("데이터베이스 연결이 실패했습니다.<br>");
		out.println("SQLException: " + ex.getMessage());
	}
%>