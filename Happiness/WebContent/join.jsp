<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Happiness!</title>
	<link href="../src/CSS/Login_Join.css" rel="stylesheet" type="text/css" />
</head>

<body>

	<div class="parent">
		<div class="child">

			<h1 id="title">회원 가입</h1>

			<table>
				<tr>
					<td>이름</td>
					<td><input type="text" id="userName" name="Join_userEmail">
					</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" id="userEmail" name="Join_userID">
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" id="userPassword" name="Join_userPW">
					</td>
				</tr>
				<tr>
					<td>오픈날짜</td>
					<td><input type="date" id="openDate">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="submit" id="btn_Join">가입하기</button>
					</td>
				</tr>
			</table>

		</div>
	</div>

</body>
</html>