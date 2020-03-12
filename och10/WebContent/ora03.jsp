<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="DBError.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String deptno = request.getParameter("deptno");
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	String sql = "select * from dept where deptno=" + deptno;
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, "scott","tiger");
	Statement stmt = conn.createStatement();
	//1. SQL을 DB에서 수행한 결과를 가져옴
	//2. 그 결과를 ResultSet rs 안에 넣어둔다
	ResultSet rs = stmt.executeQuery(sql);
	if (rs.next()) {
		String dname = rs.getString(2); //rs.getString(2);
		String loc = rs.getString("loc"); // 숫자는 조회되는 칼럼 순서
		request.setAttribute("deptno", deptno);
		request.setAttribute("dname", dname);
		request.setAttribute("loc", loc);
	} else out.println("???");
	rs.close(); 
	stmt.close();
	conn.close();

	RequestDispatcher rd = request.getRequestDispatcher("ora03Result.jsp");
	rd.forward(request, response);
	
%>
</body>
</html>


