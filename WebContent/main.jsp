<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%
	if(session.getAttribute("isAuthenticated") == null) {
%>
		<jsp:forward page="login.jsp" />
<%
	}

	String name = (String)session.getAttribute("name");
	String id = (String)session.getAttribute("id");
%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
		<h1>Welcome <%= name %></h1> <br />
		<form action="logout.jsp" method="post">
			<input type="submit" value="logout">&nbsp;&nbsp;&nbsp;<input type="button" value="update profile" onclick="javascript:window.location='update.jsp'">
		</form>
	</body>
</html>