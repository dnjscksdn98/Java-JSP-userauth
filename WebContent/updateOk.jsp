<%@ page import="com.javaloc.ex.MemberDAO" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" %>

<jsp:useBean id="dto" class="com.javaloc.ex.MemberDTO" scope="page" />
<jsp:setProperty name="dto" property="*" />    

<%
	String id = (String)session.getAttribute("id");
	dto.setId(id);
	
	MemberDAO dao = MemberDAO.getInstance();
	int result = dao.updateMember(dto);
	
	if(result == 1) {
%>
		<script>
			alert("Successfully updated user profile.");
			document.location.href="main.jsp";
		</script>
<%
	} else {
%>
		<script>
			alert("Failed to update user profile.");
			history.go(-1);
		</script>
<%
	}
%>    

<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
		
	</body>
</html>