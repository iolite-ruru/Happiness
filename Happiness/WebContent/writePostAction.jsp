<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<jsp:useBean id="post" class="dto.Post" scope="session" />
<jsp:setProperty name="user" property="postTitle" />
<jsp:setProperty name="post" property="postBody" />
<jsp:setProperty name="post" property="userEmail" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	%>
</body>
</html>