<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Happiness!</title>
    <link href="resources/CSS/Login_Join.css" rel="stylesheet" type="text/css" />
</head>

<body>

    <div class="parent">
        <div class="child">

            <h1 id="title">로그인</h1>

            <form method="post" action="loginAction.jsp">
				<table>
					<tr>
						<td>이메일</td>
						<td><input type="text" id="userEmail" name="userEmail">
						</td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" id="userPassWord"
							name="userPassword"></td>
					</tr>
					<tr>
						<td colspan="2">
							<button type="submit" id="btn_Login">로그인</button>
						</td>
					</tr>
				</table>
			</form>
			<input type="button" id="btn_Join" value="회원가입" onclick="location.href='join.jsp'"/>
        </div>
    </div>


</body>
</html>