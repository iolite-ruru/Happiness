<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="CSS/Join.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div id="join_form">
		<h1>회원 가입</h1>

        <table>
        	<tr>
				<td>닉네임</td> 
                <td>
                	<input type="text" id="user_name" name="user_name">
				</td>
			</tr>
			<tr>
            	<td>이메일</td> 
                <td>
                	<input type="text" id="user_ID" name="user_ID">
                </td>
            </tr>
            <tr>
            	<td>비밀번호</td> 
                <td>
                	<input type="password" id="user_PW" name="user_PW">
                </td>
            </tr>
		</table>
	</div>

	<div class="btn_sumit">
    	<input type="button" value="가입하기" id="btn_Join_sumit"/>
	</div>
</body>
</html>