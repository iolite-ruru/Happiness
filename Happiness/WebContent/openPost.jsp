<%@page import="dto.User"%>
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
<link href="resources/CSS/Login_Join.css" rel="stylesheet"
	type="text/css" />
</head>
<body>
	<%@ include file="dbconn.jsp"%>
	<%
		User sessionUser = new User();
		String userEmail = null;
		String userName = null;

		if (session.getAttribute("User") != null) {
			sessionUser = (User) session.getAttribute("User");
		} else {
			response.sendRedirect("index.jsp");
		}
	%>
	<h1><%=sessionUser.getUserName()%> 님의 글 목록</h1>
	<%
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM posts WHERE user_email = ? ORDER BY write_date";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, sessionUser.getUserEmail());
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
	<input type="button" id="btnBack" value="돌아가기" onclick="location.href='garden.jsp'" />
</body>
</html>