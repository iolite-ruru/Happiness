<%@page import="dto.User"%>
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

	User sessionUser = new User();
	//String userEmail;
	
	if((User)(session.getAttribute("User")) != null){
		sessionUser = (User) session.getAttribute("User");
	}
	
	if(sessionUser.getUserEmail() != null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인이 되어있습니다.')");
		script.println("location.href='garden.jsp");
		script.println("</script>");
	}

	UserDAO userDAO = new UserDAO();
	int result = userDAO.login(user);

	if (result == 1) {
		session.setAttribute("User", user);
		
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