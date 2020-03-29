<%@ page import="com.javaloc.ex.MemberDTO" %>
<%@ page import="com.javaloc.ex.MemberDAO" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" %>
    
<%
	request.setCharacterEncoding("EUC-KR");

	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	MemberDAO dao = MemberDAO.getInstance();
	int checkNum = dao.userCheck(id, password);
	if(checkNum == -1) {
%>
		<script>
			alert("This ID doesn't exist.");
			history.go(-1);
		</script>
<%
	} else if(checkNum == 0) {
%>
		<script>
			alert("Wrong password.");
			history.go(-1);
		</script>
<%
	} else if(checkNum == 1) {
		MemberDTO dto = dao.getMember(id);
		
		if(dto == null) {
%>
			<script>
				alert("This ID doesn't exist.");
				history.go(-1);
			</script>
<%
		} else {
			String name = dto.getName();
			session.setAttribute("id", id);
			session.setAttribute("name", name);
			session.setAttribute("isAuthenticated", "true");
			response.sendRedirect("main.jsp");
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