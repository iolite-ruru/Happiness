<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%
	session.invalidate();
	response.sendRedirect("index.jsp");
	
	PrintWriter script = response.getWriter();
	System.out.println("-1");
	script.println("<script>");
	script.println("alert('로그아웃 되었습니다.')");
	script.println("</script>");
%>