<%@page import="java.io.FileWriter"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 결과</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	String msg = "제목: " + title + "\r\n";
	msg += "작성자: " + writer + "\r\n";
	msg += "내용: " + content + "\r\n";
	Date date = new Date();
	long filename = date.getTime();
	String real = application.getRealPath("/WEB-INF/out/") + filename +".txt";
	System.out.println(real);
	FileWriter fw = new FileWriter(real);
	fw.write(msg);
	fw.close();
	out.println("제목: "+ title + "<br>");
	out.println("작성자: "+ writer + "<br>");
	out.println("내용: "+ content + "<br>");
	
%>

저장성공!





</body>
</html>