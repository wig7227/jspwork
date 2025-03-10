
function inputCheck() {
	const qid = document.getElementsByName('id');
	const qpwd = document.getElementsByName('pwd');
	const qrePwd = document.getElementsByName('rePwd');
	const qname = document.getElementsByName('name');
	const qbirthday = document.getElementsByName('birthday');
	const qemail = document.getElementsByName('email');
	
	qid.innerHTML = ('id');

	
	 if(qid != null){
		alert("로그인 성공"); 
	 } else {
		alert("로그인 실패");
	 }
	 
	 if(qpwd != qrePwd) {
		 alert("비밀번호가 일치하지 않습니다");
	 } else {
		 alert("비밀번호가 일치합니다");
	 }
	
}