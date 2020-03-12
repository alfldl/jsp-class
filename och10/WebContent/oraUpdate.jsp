<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
	int deptno = Integer.parseInt(request.getParameter("deptno"));
	String dname = request.getParameter("dname");
	String loc = request.getParameter("loc");
	String sql = "update dept set dname=?, loc=? where deptno=?";
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, "scott", "tiger");
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, dname);
	pstmt.setString(2, loc);
	pstmt.setInt(3, deptno);
	int result = pstmt.executeUpdate();
	
	if(result > 0) out.println("수정성공");
	else out.println("실패");
	pstmt.close(); conn.close();

%>
</body>
</html>