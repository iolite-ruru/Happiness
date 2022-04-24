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
			<form method="post" action="joinAction.jsp">
				<table>
					<tr>
						<td colspan="2">
							<h1>회원 가입</h1>
						</td>
					</tr>
					<tr>
						<td>닉네임</td>
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
							<!-- <input type="button" value="가입하기" id="btn_Join" /> -->
							<button type="submit" id="btn_Join">가입하기</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>

</body>
</html>