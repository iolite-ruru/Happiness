<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="post" class="dto.Post" scope="session" />
<!DOCTYPE html>
<html>
<head>
<title>Happiness!</title>
<link href="resources/CSS/Garden.css" rel="stylesheet" type="text/css" />
</head>

<body>
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
	<h1>(미완) Garden 페이지</h1>
	<div>
		<!-- 테스트용 이미지 div (글 추가시 이미지 변환시키기)-->
		<img src="resources/IMG/transparency.png" id="img" width="100"
			height="100" />
	</div>
	<div>
		<input type="button" id="btnWrite" value="글 작성"
			onclick="location.href='writePost.jsp'" /><br> <input
			type="button" id="btnOpen" value="글 조회"
			onclick="location.href='openPost.jsp'" /><br> <input
			type="button" id="btnLogout" value="로그아웃"
			onclick="location.href='logout.jsp'" /><br>
	</div>
</body>
</html>