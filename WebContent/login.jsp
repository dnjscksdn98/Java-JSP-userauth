<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" %>
<% if(session.getAttribute("isAuthenticated") != null) { %>
	<jsp:forward page="main.jsp"></jsp:forward>
<% } %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
		<form action="loginOk.jsp" method="post">
			ID : <input type="text" name="id" value="<% if(session.getAttribute("id") != null) out.println(session.getAttribute("id")); %>"> <br />
			Password : <input type="password" name="password"><br />
			<input type="submit" value="Login"><br />
			You don't have an account? <input type="button" value="Signup" onclick="javascript:window.location='signup.jsp'">
		</form>
	</body>
</html>