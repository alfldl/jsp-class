<%@page import="och10.Dept"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Dept dept = (Dept)request.getAttribute("dept"); 

%>
<h1>Expresstion 부서정보</h1>
부서코드: <%=dept.getDeptno() %><p>
부서명: <%=dept.getDname() %><p>
근무지: <%=dept.getLoc() %><p>

<h1>EL 표기법 부서정보</h1>
부서코드: ${dept.deptno } <p>
부서명: ${dept.dname }<p>
근무지: ${dept.loc }<p>
</body>
</html>




