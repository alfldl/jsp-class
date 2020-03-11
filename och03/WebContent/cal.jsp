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
	request.setCharacterEncoding("utf-8");
	int num1 = Integer.parseInt(request.getParameter("num1"));
	int num2 = Integer.parseInt(request.getParameter("num2"));
	int add = num1 + num2;
	int min = num1 - num2;
	int mul = num1 * num2;
	int div = num1 / num2;
	
	request.setAttribute("add", add);
	request.setAttribute("min", min);
	request.setAttribute("mul", mul);
	request.setAttribute("div", div);
	RequestDispatcher rd = request.getRequestDispatcher("calResult.jsp");
	rd.forward(request, response);
		//rd.include(request, response);	
%>
</body>
</html>