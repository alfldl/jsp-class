<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="dao.*" errorPage="Error.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		<% 	
			int bmno = Integer.parseInt(request.getParameter("bmno")); 
			BookMemberDao bmd = BookMemberDao.getInstance();
			String bmname = bmd.bmGetBMName(bmno); 
			out.println(bmname);
		%>
</body>
</html>