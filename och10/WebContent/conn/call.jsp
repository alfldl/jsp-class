<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,javax.sql.*,javax.naming.*"
    errorPage="../DBError.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title></head><body>
<%
 	Context ctx = new InitialContext();
	DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");
	Connection conn = ds.getConnection();
	String sql = "{call Emp_Info3(?,?)}";
	CallableStatement cs = conn.prepareCall(sql);
	cs.registerOutParameter(2, Types.DOUBLE);
	cs.setInt(1, 7369);
	cs.execute();
	out.println("급여 : " + cs.getDouble(2));
	cs.close();	conn.close();
%>
</body>
</html>