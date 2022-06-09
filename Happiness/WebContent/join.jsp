<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Happiness!</title>
<link href="resources/CSS/Login_Join.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="resources/JS/validation.js"></script>
</head>

<body>

	<div class="parent">
		<div class="child">

			<h1 id="title">회원 가입</h1>
			<form method="post" name="joinForm" action="joinAction.jsp">
				<table>
					<tr>
						<td>이름</td>
						<td><input type="text" id="userName" name="userName">
						</td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input type="text" id="userEmail" name="userEmail">
						</td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" id="userPassword"
							name="userPassword"></td>
					</tr>
					<tr>
						<td>비밀번호 확인</td>
						<td><input type="password" id="userPasswordRe"
							name="userPasswordRe"></td>
					</tr>
					<!-- <tr>
						<td>오픈날짜</td>
						<td><input type="date" id="openDate" name="openDate"></td>
					</tr> -->
					<tr>
						<td colspan="2">
							<button type="submit" id="btnJoin" onclick="CheckJoin()">가입하기</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>

</body>
</html>