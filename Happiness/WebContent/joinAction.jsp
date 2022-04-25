<%@page import="java.time.LocalDate"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dao.UserDAO"%>
<%@include file="dbconn.jsp" %>
<%@page import="java.io.PrintWriter"%>
<jsp:useBean id="user" class="dto.User" scope="session"/>
<jsp:setProperty name="user" property="userName"/>
<jsp:setProperty name="user" property="userEmail"/>
<jsp:setProperty name="user" property="userPassword"/>
<jsp:setProperty name="user" property="openDate"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		
/* 		if(user.getUserName() == null || user.getUserEmail() == null || user.getUserPassword() == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('모든 빈칸을 입력해주세요.')");
			script.println("history.back()");
			script.println("</script>");
		} */
		/* LocalDate localDate = LocalDate.now();
		localDate.plusYears(1);
		user.setOpenDate(localDate); */
		UserDAO userDAO = new UserDAO();
		int result = userDAO.join(user);
		
		if(result == 1){ //가입 완료
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href='index.jsp'");
			script.println("</script>");
		} else if(result == 0){ //이미 가입되어있는 이메일
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 가입되어있는 이메일입니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('Error')"); //DB 오류
			script.println("history.back()");
			script.println("</script>");
		}
	%>

</body>
</html>