<%
	String bmno = (String)session.getAttribute("bmno");
	if (bmno == null || bmno.equals("")) {
		response.sendRedirect("loginAction.do");
	}
%>