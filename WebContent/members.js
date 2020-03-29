function infoConfirm() {
	if(document.signupForm.id.value.length === 0){
		alert("Enter your user ID.");
		document.signupForm.id.focus();
		return;
	}
	
	if(document.signupForm.id.value.length < 4){
		alert("Your ID must have more than 4 characters.");
		document.signupForm.id.focus();
		return;
	}
	
	if(document.signupForm.password.value.length === 0){
		alert("Enter your password.");
		document.signupForm.password.focus();
		return;
	}
	
	if(document.signupForm.password.value !== document.signupForm.confirmPassword.value){
		alert("Passwords doesn't match.");
		document.signupForm.password.focus();
		return;
	}
	
	if(document.signupForm.name.value.length === 0){
		alert("Enter your name.");
		document.signupForm.name.focus();
		return;
	}
	
	if(document.signupForm.email.value.length === 0){
		alert("Enter your email.");
		document.signupForm.email.focus();
		return;
	}
	
	document.signupForm.submit();
}

function updateInfoConfirm() {
	if(document.updateForm.password.value.length === 0) {
		alert("Enter your password.");
		document.updateForm.password.focus();
		return;
	}
	
	if(document.updateForm.password.value !== document.updateForm.confirmPassword.value) {
		alert("Passwords doesn't match.");
		document.updateForm.password.focus();
		return;
	}
	
	if(document.updateForm.email.value.length === 0) {
		alert("Enter your email.");
		document.updateForm.email.focus();
		return;
	}
	
	document.updateForm.submit();	
}