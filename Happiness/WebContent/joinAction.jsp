<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dao.UserDAO"%>
<%@page import="java.io.PrintWriter"%>
<jsp:useBean id="user" class="dto.User" scope="page"/>
<jsp:setProperty name="user" property="user_email"/>
<jsp:setProperty name="user" property="user_PW"/>
<jsp:setProperty name="user" property="user_name"/>
<%-- <jsp:setProperty name="user" property="user_OpenDate"/> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		
		if(user.getUserEmail() == null || user.getUserPassword() == null
				|| user.getUserName() == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('모든 빈칸을 입력해주세요.')");
			script.println("history.back()");
			script.println("</script>");
		}
		
		UserDAO userDAO = new UserDAO();
		int result = userDAO.join(user);
		
		if(result == 1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href='main.jsp'");
			script.println("</script>");
		} else if(result == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 옳지 않습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('가입되어있지 않는 이메일입니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else if(result == -2){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('DB 오류')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>

</body>
</html>