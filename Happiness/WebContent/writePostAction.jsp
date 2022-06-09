<%
	request.setCharacterEncoding("utf-8");
%>
<%@page import="java.io.PrintWriter"%>
<%@page import="dao.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="post" class="dto.Post" scope="session" />
<jsp:setProperty name="post" property="postTitle" />
<jsp:setProperty name="post" property="postBody" />

<%
	request.setCharacterEncoding("UTF-8");
	//System.out.println(user.getUserEmail());

	String userEmail = null;
	if (session.getAttribute("userEmail") != null) {
		userEmail = (String) session.getAttribute("userEmail");
	}

	if (userEmail == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인 후에 이 페이지를 이용할 수 있습니다.')");
		script.println("location.href='index.jsp");
		script.println("</script>");
	}
	
	if (post.getPostTitle() == null || post.getPostBody() == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력 칸이 비어 있어서는 안됩니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
	
	
//document.getElementById('img').src = "../IMG/flower.png";
	post.setUserEmail(userEmail);
	
	System.out.println("PostDAO() 호출 전");	
	PostDAO postDAO = new PostDAO();
	System.out.println("PostDAO() 호출 후");
	System.out.println("post.email: "+ post.getUserEmail());
	System.out.println("post.title: "+ post.getPostTitle());
	System.out.println("post.body: "+ post.getPostBody());
	System.out.println("post.isPublic: "+ post.isPublic());
	
	int result = postDAO.writePost(post);

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
	}
%>