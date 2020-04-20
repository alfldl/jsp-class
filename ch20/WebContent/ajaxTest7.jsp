<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="jdk.nashorn.internal.ir.debug.JSONWriter"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="dao.*" errorPage="Error.jsp" %>

		<% 	
			BookMemberDao bmd = BookMemberDao.getInstance();
		    List<BookMember> list = bmd.bmlist(1, 1);	
		
			JSONObject obj = new JSONObject();
			obj.put("bmno",list.get(0).getBmno());
			obj.put("name",list.get(0).getBmname());
		   //  jsonArray.add(obj);
 		   out.print(obj);    
     
	
		
		%>
