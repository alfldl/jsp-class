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
	int sum = 0;
	for (int i = 1; i <= 100; i++) {
		sum += i;
	}
 	request.setAttribute("sum", sum); //Exprsstion 용
 	request.setAttribute("sum1", sum); // Expression Language(EL표기)
 	RequestDispatcher rd = request.getRequestDispatcher("hunResult.jsp"); //웹간 페이지호출
 	rd.forward(request, response); //보내줌
%>
</body>
</html>