<%@page import="java.util.HashMap"%>
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
	HashMap<String, String> map = new HashMap<String, String>();
	map.put("Park", "목동");
	map.put("길동", "율도국");
	map.put("Jasica", "크라이스처치");
	map.put("Susan", "시드니");
	request.setAttribute("ADDRESS", map);
	RequestDispatcher dispatcher = request.getRequestDispatcher("mapView.jsp?NAME=Park"); //?표는 get방식 의미
	dispatcher.forward(request, response);
%>
</body>
</html>