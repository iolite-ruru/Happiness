<%
	request.setCharacterEncoding("utf-8");
%>
<%@page import="java.time.LocalDate"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dao.UserDAO"%>
<%@include file="dbconn.jsp"%>
<%@page import="java.io.PrintWriter"%>
<jsp:useBean id="user" class="dto.User" scope="session" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userEmail" />
<jsp:setProperty name="user" property="userPassword" />

<%
	request.setCharacterEncoding("UTF-8");

	String userEmail = null;
	if (session.getAttribute("userEmail") != null) {
		userEmail = (String) session.getAttribute("userEmail");
	}

	if (userEmail != null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href='garden.jsp");
		script.println("alert('이미 로그인이 되어있습니다.')");
		script.println("</script>");
	}

	UserDAO userDAO = new UserDAO();
	int result = userDAO.join(user);

	if (result == 1) { //가입 완료
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href='index.jsp'");
		script.println("alert('회원가입 성공!')");
		script.println("</script>");
	} else if (result == 0) { //이미 가입되어있는 이메일
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 가입되어있는 이메일입니다.')");
		script.println("history.back()");
		script.println("</script>");
	} else if (result == -1) { //DB 오류
		PrintWriter script = response.getWriter();
		System.out.println("-1");
		script.println("<script>");
		//script.println("alert('DB Error')");
		script.println("history.back()");
		script.println("</script>");
	}
%>