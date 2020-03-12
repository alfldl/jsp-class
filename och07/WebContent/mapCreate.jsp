 <%@page import="java.util.HashMap"%>
<%@page contentType="text/html; charset=UTF-8"%> 

<%
	HashMap<String, String> map = new HashMap<String, String>(); 
	map.put("Park",    "목동"); 
	map.put("길동",     "율도국"); 
	map.put("Jasica",  "크라이스 처치"); 
	map.put("Susan",   "시드니"); 
	request.setAttribute("ADDRESS", map); 
	RequestDispatcher dispatcher = 
			request.getRequestDispatcher("mapView.jsp?NAME=Park"); 
	dispatcher.forward(request, response); 
%> 