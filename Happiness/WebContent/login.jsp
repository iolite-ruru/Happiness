<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Happiness!</title>
<link href="CSS/Login_Join.css" rel="stylesheet" type="text/css" />
</head>

<body>

	<div class="parent">
		<div class="child">
			<form method="post" action="loginAction.jsp">
				<table>
					<tr>
						<td colspan="2">
							<h1>로그인</h1>
						</td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input type="text" id="userEmail" name="login_userID">
						</td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" id="userPassWord"
							name="login_userPW"></td>
					</tr>
					<tr>
						<td colspan="2">
							<!-- <input type="button" value="로그인" id="btn_Login"/> -->
							<button type="submit" id="btn_Login">로그인</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>


</body>
</html>