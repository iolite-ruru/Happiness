<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Happiness!</title>
</head>
<body>
	<div class="parent">
		<div class="child">

			<h1 id="title">글 작성</h1>
			<form method="post" action="writePostAction.jsp">
				<table>
					<tr>
						<!-- <td>제목</td> -->
						<td><input type="text" id="postTitle" name="postTitle"
							placeholder="제목" maxlength="20"></td>
					</tr>
					<tr>
						<!-- <td>본문</td> -->
						<td><textarea id="postBody" name="postBody" rows="40"
								cols="80" placeholder="본문" maxlength="1000"></textarea></td>
					</tr>
					<tr>
						<td><input type="checkbox" name="isPublic" value="isPublic" />글
							공개 여부</td>
					<tr>
						<td>
							<button type="submit" id="btnUpload">작성완료</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>