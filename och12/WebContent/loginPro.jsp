<%@page import="och12.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	MemberDao md = MemberDao.getInstance();
	int result = md.check(id, passwd);
	//유저 존재
	if (result == 1) {
		session.setAttribute("id", id);
		response.sendRedirect("main.jsp");
	//패스워드 틀림	
	}else if (result == 0) {
%>
	<script type="text/javascript">
		alert("비밀번호가 일치하지 않습니다.");
		history.go(-1); // 이전페이지로 이동(loginForm.jsp)
	</script>
<% } else { %>
	<script type="text/javascript">
		alert("일치하는 아이디가 없습니다.");
		history.go(-1); // 이전페이지로 이동(loginForm.jsp)
	</script>
<% } %>	


%>	
</body>
</html>