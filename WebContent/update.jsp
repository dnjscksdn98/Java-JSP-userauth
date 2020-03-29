<%@ page import="com.javaloc.ex.MemberDTO" %>
<%@ page import="com.javaloc.ex.MemberDAO" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<% request.setCharacterEncoding("EUC-KR"); %>
<%
	String id = (String)session.getAttribute("id");
	MemberDAO dao = MemberDAO.getInstance();
	MemberDTO dto = dao.getMember(id);
%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>Insert title here</title>
		<script src="members.js"></script>
	</head>
	<body>
		<form action="updateOk.jsp" method="post" name="updateForm">
			ID : <%= dto.getId() %><br />
			Password : <input type="password" name="password" size="20"><br />
			Confirm Password : <input type="password" name="confirmPassword" size="20"><br />
			Name : <%= dto.getName() %><br />
			Email : <input type="email" name="email" size="20" value="<%= dto.getEmail() %>"><br />
			Address : <input type="text" name="address" size="50" value="<%= dto.getAddress() %>"><br />
			<input type="button" value="update" onclick="updateInfoConfirm()">&nbsp;&nbsp;&nbsp; <input type="reset" value="cancel" onclick="javascript:window.location='main.jsp'">
		</form>
	</body>
</html>