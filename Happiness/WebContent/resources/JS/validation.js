function CheckJoin() {

	var userName = document.getElementById("userName");
	var userEmail = document.getElementById("userEmail");
	var userPassword = document.getElementById("userPassword");
	var userPasswordRe = document.getElementById("userPasswordRe");
	// alert("validation.js 호출");

	if (!userName || !userEmail || !userPassword || !userPasswordRe) {
		alert("입력 칸이 비어 있어서는 안됩니다.");
		return false;
	}

	// 이름
	if (!Check(/[a-zA-Z가-힣0-9]{2,12}/, userName)) {
		alert("[이름]2~12자 내의 문자, 숫자만 입력할 수 있습니다.");
		document.joinForm.userName.select();
		document.joinForm.userName.focus();
		return false;
	}

	// 이메일
	if (!Check(/[a-z0-9]{2,}@[a-z0-9-]{2,}\.[a-z0-9]{2,}/i, userEmail)) {
		alert("[이메일]유효한 이메일 주소가 아닙니다.");
		document.joinForm.userEmail.select();
		document.joinForm.userEmail.focus();
		return false;
	}

	// 비밀번호
	if (!Check(/[a-z0-9]{8,20}/, userPassword)) {
		alert("[비밀번호]\n8~20자 내의 영소문자, 숫자만 입력할 수 있습니다.");
		document.joinForm.userPassword.select();
		document.joinForm.userPassword.focus();
		return false;
	}

	// 비밀번호 일치 확인
	if (userPassword.value !== userPasswordRe.value) {
		alert("[비밀번호 확인]비밀번호가 일치하지 않습니다.");
		document.joinForm.userPasswordRe.select();
		document.joinForm.userPasswordRe.focus();
		return false;
	}

	document.joinForm.submit();
}

function Check(regExp, value) {
	if (regExp.test(value.value)) {
		return true;
	}
	return false;
}