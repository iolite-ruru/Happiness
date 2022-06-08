<%@page import="java.io.PrintWriter"%>
<%@page import="dao.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<jsp:useBean id="post" class="dto.Post" scope="session" />
<jsp:setProperty name="post" property="postTitle" />
<jsp:setProperty name="post" property="postBody" />
<jsp:setProperty name="post" property="isPublic" />


<jsp:useBean id="user" class="dto.User" scope="session" />

<%
	request.setCharacterEncoding("UTF-8");
	System.out.println(user.getUserEmail());
	/* PostDAO postDAO = new PostDAO();
	
	int result = postDAO.writePost(post, user);
	
	if (result == 1) { //가입 완료
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href='garden.jsp'");
		script.println("alert('글이 저장되었습니다.')");
		script.println("</script>");
	} else if (result == -1) { //DB 오류
		PrintWriter script = response.getWriter();
		System.out.println("-1");
		script.println("<script>");
		script.println("alert('DB Error')");
		script.println("history.back()");
		script.println("</script>");
	} */
%>