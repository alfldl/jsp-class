<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="och12.*" errorPage="Error.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title></head>
<body>
<jsp:useBean id="member" class="och12.Member"></jsp:useBean>
<jsp:setProperty property="*" name="member"/>
<%
	MemberDao md = MemberDao.getInstance();
	int result = md.insert(member);
	if (result > 0) { 
%>
	<script type="text/javascript">
		alert("회원가입 축하 !! ");
		location.href="loginForm.jsp";
	</script>
<%
	} else { %>
		<script type="text/javascript">
			alert("실패");
			location.href="joinForm.jsp";
		</script>
<%	}  %>
</body>
</html>