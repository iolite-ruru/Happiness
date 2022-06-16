<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Happiness!</title>
<link href="resources/CSS/Register_Write.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>

</head>
<body>
	<div class="parent">
		<div class="child">

			<h1 id="title">글 작성</h1>
			<form method="post" action="writePostAction.jsp">
				<input type="text" name="postTitle" id="postTitle" placeholder="제목"
					maxlength="20"
					style="border-radius: 30px; border: none; width: 640px; height: 50px; resize: none; padding-right: 20px; padding-left: 20px;" /><br />

				<!-- 				<input type="date" name="date" id="input_date"
					style="border-radius: 20px; border: none; width: 100px; height: 40px; padding-right: 20px; padding-left: 20px;" /><br />
 -->
				<textarea id="postBody" name="postBody" maxlength="1000"
					style="border-radius: 30px; border: none; width: 600px; height: 400px; padding: 40px; resize: none;"
					placeholder="오늘의 행복했던 순간을 적어주세요 :)"></textarea>
				<br /> <input type="checkbox" name="isPublic" value="isPublic" />글
				공개 여부
				<button type="submit"
					style="position: absolute; top: 0px; left: 0px; z-index: 1; left: 35%; top: 110%; transform: translate(50%, 50%); width: 100px;"
					onclick="add()" id="btnUpload">등록</button>

			</form>
		</div>
	</div>
</body>
</html>