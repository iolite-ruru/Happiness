<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Happiness!</title>
</head>
<body>
	<div class="parent">
		<div class="child">

			<h1 id="title">�� �ۼ�</h1>
			<form method="post" action="writePostAction.jsp">
				<table>
					<tr>
						<!-- <td>����</td> -->
						<td><input type="text" id="postTitle" name="postTitle"
							placeholder="����"></td>
					</tr>
					<tr>
						<!-- <td>����</td> -->
						<td><textarea id="postBody" name="postBody" rows="40"
								cols="80" placeholder="����"></textarea></td>
					</tr>
					<tr>
						<td><input type="checkbox" name="isPublic" value="isPublic" />��
							���� ����</td>
					<tr>
						<td>
							<button type="submit" id="btnUpload">�ۼ��Ϸ�</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>