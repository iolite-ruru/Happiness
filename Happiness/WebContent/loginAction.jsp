<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dao.UserDAO"%>
<%@include file="dbconn.jsp"%>
<%@page import="java.io.PrintWriter"%>
<jsp:useBean id="user" class="dto.User" scope="page" />
<jsp:setProperty name="user" property="userEmail" />
<jsp:setProperty name="user" property="userPassword" />

<%
	request.setCharacterEncoding("UTF-8");

	String userEmail = null;
	String userName = null;
	if(session.getAttribute("userEmail") != null){
		userEmail = (String) session.getAttribute("userEmail");
		userName = (String) session.getAttribute("userName");
	}
	
	if(userEmail != null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인이 되어있습니다.')");
		script.println("location.href='garden.jsp");
		script.println("</script>");
	}

	UserDAO userDAO = new UserDAO();
	int result = userDAO.login(user);

	if (result == 1) {
		session.setAttribute("userEmail", user.getUserEmail());
		session.setAttribute("userName", user.getUserName());
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href='garden.jsp'");
		script.println("alert('로그인 성공!')");
		script.println("</script>");

		response.sendRedirect("garden.jsp");
	} else if (result == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 옳지 않습니다.')");
		script.println("history.back()");
		script.println("</script>");
	} else if (result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('가입되어있지 않는 이메일입니다.')");
		script.println("history.back()");
		script.println("</script>");
	} else if (result == -2) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('DB 오류')");
		script.println("history.back()");
		script.println("</script>");
	}
%>