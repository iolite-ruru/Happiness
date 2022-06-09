<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Happiness!</title>
</head>
<body>
	<%@ include file="dbconn.jsp"%>
	<%
		String userEmail = null;
		String userName = null;
		if (session.getAttribute("userEmail") != null) {
			userEmail = (String) session.getAttribute("userEmail");
			userName = (String) session.getAttribute("userName");
		}
		
		if (userEmail == null) {
			response.sendRedirect("index.jsp");
		}		
	%>
	<h1><%=userName %> 님의 글 목록</h1>
	<%
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM posts WHERE user_email = ? ORDER BY write_date";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userEmail);
		rs = pstmt.executeQuery();
		while (rs.next()) {
	%>
	<h3><%=rs.getString("post_title")%></h3>
	<p><%=rs.getString("write_date")%></p>
	<p><%=rs.getString("post_body")%></p>
	<hr>
	<%
		}
		if (rs != null)
			rs.close();
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
	%>
</body>
</html>