<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>Insert title here</title>
		<script src="members.js"></script>
	</head>
	<body>
		<form action="signupOk.jsp" method="post" name="signupForm">
			ID : <input type="text" name="id" size="20"><br />
			Password : <input type="password" name="password" size="20"><br />
			Confirm Password : <input type="password" name="confirmPassword" size="20"><br />
			Name : <input type="text" name="name" size="20"><br />
			Email : <input type="email" name="email" size="20"><br />
			Address : <input type="text" name="address" size="50"><br />
			<input type="button" value="Signup" onclick="infoConfirm()"><br />
			You already have an account? <input type="reset" value="Login" onclick="javascript:window.location='login.jsp'">
		</form>
	</body>
</html>