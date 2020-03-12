<%@page import="java.util.GregorianCalendar,java.io.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!
	private PrintWriter pw;
	String date;

	public void jspInit() {
		GregorianCalendar gc = new GregorianCalendar();
		date = String.format("%TF %TT", gc, gc);
		String fileName = "c:/log/" + date.replaceAll(":", "") + ".txt";
		try {
			pw = new PrintWriter(new FileWriter(fileName, true));
		} catch (Exception e) {
			System.out.println("대박 ! 으이그");
		}
	}
	%>
	<%
		String name = request.getParameter("name");
		String msg = name + "님 방가워 ";
		out.println(msg + "<p> 현재시간 : " + date);
		pw.println(msg + "\r\n 현재시간 : " + date + "\r\n");
	%>
	<%!public void jspDestroy() {
		if (pw != null)
			pw.close();
	}%>
</body>
</html>