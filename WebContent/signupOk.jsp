<%@ page import="java.sql.Timestamp" %>
<%@ page import="com.javaloc.ex.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" %>
<% request.setCharacterEncoding("EUC-KR"); %>
<jsp:useBean id="dto" class="com.javaloc.ex.MemberDTO" />
<jsp:setProperty name="dto" property="*" />
<%
		dto.setRegisteredDate(new Timestamp(System.currentTimeMillis()));
		MemberDAO dao = MemberDAO.getInstance();
		if(dao.confirmId(dto.getId()) == MemberDAO.MEMBER_EXISTS) {
%>
			<script>
				alert("This ID already exists.");
				history.back();
			</script>
<%
		} 
		else {
			int result = dao.insertMember(dto);
			if(result == MemberDAO.MEMBER_SIGNUP_SUCCESS) {
				session.setAttribute("id", dto.getId());
%>
			<script>
				alert("Successfully registered.");
				document.location.href="login.jsp";
			</script>
<%
			} else {
%>
				<script>
					alert("Failed registration.");
					document.location.href="login.jsp";
				</script>
<%
			}
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