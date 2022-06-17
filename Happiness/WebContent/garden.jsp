<%@page import="java.time.temporal.ChronoUnit"%>
<%@page import="java.time.Period"%>
<%@page import="java.time.LocalDate"%>
<%@page import="dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="post" class="dto.Post" scope="session" />
<!DOCTYPE html>
<html>
<head>
<title>Happiness!</title>
<link href="resources/CSS/Login_Join.css" rel="stylesheet"
	type="text/css" />
<style>
@font-face {
	font-family: 'KOTRAHOPE';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2110@1.0/KOTRAHOPE.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

body {
	font-family: 'KOTRAHOPE';
	padding: 0;
	margin: 0;
	background-image: url('resources/IMG/cloud.png');
	background-size: cover;
}

.parent {
	font-family: 'KOTRAHOPE';
	text-align: center;
	position: relative;
}

.child {
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-10%, 10%)
}
</style>
</head>

<body>
	<%
		User sessionUser = new User();
		String userEmail = null;
		String userName = null;

		if (session.getAttribute("User") != null) {
			sessionUser = (User) session.getAttribute("User");
		} else {
			response.sendRedirect("index.jsp");
		}
	%>
	<div
		style="position: relative; top: 0px; left: 0px; width: 100%; height: 937px; overflow: hidden; padding: 0; margin: 0">

		<div
			style='position: absolute; top: 0px; left: 0px; z-index: 1; left: 0%; top: 0%; transform: translate(0%, 45%); width: 100%; height: 910px;'>
			<img src="resources/IMG/background.png" width="100%" height="910" />
		</div>

		<div
			style='position: absolute; top: 0px; left: 0px; z-index: 2; left: 16%; top: 0%; transform: translate(50%, 25%)'>
			<!-- text-shadow: 6px 3px 5px rgb(230, 230, 230);  -->
			<h1
				style="color: rgb(230, 199, 24); text-shadow: 1px 1px 3px rgb(255, 255, 255);">
				<span style="font-size: 63px; color: rgb(255, 122, 14);"
					id="user_name">이미림</span> &nbsp;<span
					style="font-size: 45px;">님, 오늘의 행복을 작성하세요 !</span>
			</h1>
		</div>

		<div
			style='position: absolute; top: 0px; left: 0px; z-index: 2; width: 70px; text-align: center; left: 29%; top: 13%; transform: translate(60%, 70%); background-color: rgb(255, 255, 255); padding: 5px; border-radius: 30px; font-size: 18px'>
			열람일</div>
		<div
			style='position: absolute; top: 0px; left: 0px; z-index: 2; left: 33%; top: 0%; transform: translate(64%, 41%); text-shadow: 1px 1px 3px rgb(255, 255, 255)'>
			<h2 style="font-size: 60px; color: rgb(63, 121, 207);" id="user_Dday">
				D-<%= ChronoUnit.DAYS.between(LocalDate.now(), sessionUser.getOpenDate())%></h2>
		</div>
		<%-- 
		<%Period period = LocalDate.now().until(sessionUser.getOpenDate());//Period.between(LocalDate.now(), sessionUser.getOpenDate());%>
 
		<div
			style='position: absolute; top: 0px; left: 0px; z-index: 2; left: 33%; top: 0%; transform: translate(64%, 41%); text-shadow: 1px 1px 3px rgb(255, 255, 255);'>
			<%-- <h2 style="font-size: 60px; color: rgb(63, 121, 207);" id="user_Dday">
				D-<%=ChronoUnit.DAYS.between(LocalDate.now(), sessionUser.getOpenDate())%></h2>
		</div> --%>

		<div
			style='position: absolute; top: 0px; left: 0px; z-index: 2; left: 47%; top: 33%; transform: translate(100%, 10%)'>
			<!-- <input type="button" id="btnWrite" value="글 작성"
				onclick="location.href='writePost.jsp'" /><br> -->
			<a href="./writePost.jsp"><img src="resources/IMG/girl.png"
				width="300" height="480" /></a>
		</div>

		<div
			style='position: absolute; top: 0px; left: 0px; z-index: 2; left: 15%; top: 20%; transform: translate(50%, 50%)'>
			<img src="resources/IMG/sprout.png" width="120" height="90" id="img1" />
			<img src="resources/IMG/sprout.png" width="120" height="90" id="img2" />
			<img src="resources/IMG/sprout.png" width="120" height="90" id="img3" />
			<img src="resources/IMG/sprout.png" width="120" height="90" id="img4" />
			<img src="resources/IMG/sprout.png" width="120" height="90" id="img5" />
		</div>

		<div
			style='position: absolute; top: 0px; left: 0px; z-index: 2; left: 15%; top: 34%; transform: translate(57%, 50%);'>
			<span style="font-size: 25px; margin-right: 67px;" id="title_1">제목1</span>
			<span style="font-size: 25px; margin-right: 67px;" id="title_2">제목2</span>
			<span style="font-size: 25px; margin-right: 67px;" id="title_3">제목3</span>
			<span style="font-size: 25px; margin-right: 67px;" id="title_4">제목4</span>
			<span style="font-size: 25px; margin-right: 67px;" id="title_5">제목5</span>
		</div>

		<div
			style='position: absolute; top: 0px; left: 0px; z-index: 2; left: 15%; top: 40%; transform: translate(50%, 50%)'>
			<img src="resources/IMG/sprout.png" width="120" height="90" />
			<img src="resources/IMG/sprout.png" width="120" height="90" />
			<img src="resources/IMG/sprout.png" width="120" height="90" />
			<img src="resources/IMG/sprout.png" width="120" height="90" />
			<img src="resources/IMG/sprout.png" width="120" height="90" />
		</div>

		<div
			style='position: absolute; top: 0px; left: 0px; z-index: 2; left: 15%; top: 60%; transform: translate(50%, 50%)'>
			<img src="resources/IMG/sprout.png" width="120" height="90" />
			<img src="resources/IMG/sprout.png" width="120" height="90" />
			<img src="resources/IMG/sprout.png" width="120" height="90" />
			<img src="resources/IMG/sprout.png" width="120" height="90" />
			<img src="resources/IMG/sprout.png" width="120" height="90" />
		</div>
		<input type="button" id="btnSend" value="(TEST CODE)메일 전송하기"
			onclick="location.href='sendMail.jsp'" /><br>
		<input type="button" id="btnOpen" value="글 조회"
			onclick="location.href='openPost.jsp'" /><br>
		<input type="button" id="btnLogout" value="로그아웃"
			onclick="location.href='logout.jsp'" /><br>
	</div>

</body>
</html>