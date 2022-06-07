<% request.setCharacterEncoding("utf-8"); %>
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
<%-- <jsp:setProperty name="user" property="openDate" /> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");

		//오픈 날짜 설정(UserDAO로 코드 옮김)
		//LocalDate localDate = LocalDate.now();
		//user.setOpenDate(localDate.plusYears(1));

		//Debug
		System.out.println("user.getOpenDate: "+user.getOpenDate()); //null. 당연함.

		if (user.getUserName() == null || user.getUserEmail() == null || user.getUserPassword() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('모든 빈칸을 입력해주세요.')");
			script.println("history.back()");
			script.println("</script>");
		}

		System.out.println("UserDAO() 호출 전");
		UserDAO userDAO = new UserDAO();
		System.out.println("UserDAO() 호출 후");		
		
		
		int result = userDAO.join(user);

		if (result == 1) { //가입 완료
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href='garden.jsp'");
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
			script.println("alert('DB Error')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>

</body>
</html>