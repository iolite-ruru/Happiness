function CheckJoin() {

	var userName = document.getElementById("userName");
	var userEmail = document.getElementById("userEmail");
	var userPassword = document.getElementById("userPassword");
	var userPasswordRe = document.getElementById("userPasswordRe");
	//alert("validation.js 호출");
	//이름
	if (!Check(/[a-zA-Z가-힣0-9]{2,12}/, userName)) {
		alert("[이름]2~12자 내의 문자를 입력하세요");
		userName.select();
		userName.focus();
		return false;
	}
	
	//이메일
	if (!Check(/[a-z0-9]{2,}@[a-z0-9-]{2,}\.[a-z0-9]{2,}/i, userEmail))
		alert("[이메일]유효한 이메일을 입력해주세요.");
		return false;

	//비밀번호
	if (!Check(/[a-z0-9]{8,20}/, userPassword)) {
		alert("[비밀번호]\n8~20자 내의 영소문자, 숫자만 입력해주세요.");
		userPassword.select();
		userPassword.focus();
		return false;
	}
	
	//비밀번호 일치 확인
	if (userPassword.value != userPasswordRe.value) {
		alert("[비밀번호 확인]비밀번호가 일치하지 않습니다.");
		userPasswordRe.select();
		userPasswordRe.focus();
		return false;
	}
	
	 document.joinForm.submit();
}

function Check(regExp, value) {
	if (regExp.test(value.value)) {
		return true;
	}
	value.select();
	value.focus();
	return false;
}