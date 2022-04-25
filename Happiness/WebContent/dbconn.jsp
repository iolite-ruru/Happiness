<%@ page import="java.sql.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Connection conn = null;
	try {
		String dbURL = "jdbc:oracle:thin:@localhost:1521:XE";
		String dbID = "system";
		String dbPassword = "0812";

		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(dbURL, dbID, dbPassword);

	} catch (SQLException ex) {
		out.println("데이터베이스 연결이 실패했습니다.<br>");
		out.println("SQLException: " + ex.getMessage());
	}
%>