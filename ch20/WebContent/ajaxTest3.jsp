<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="jdk.nashorn.internal.ir.debug.JSONWriter"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="dao.*" errorPage="Error.jsp" %>

		<% 	
			BookMemberDao bmd = BookMemberDao.getInstance();
		   List<BookMember> list = bmd.bmlist(1, 10);	
		
		   JSONObject json= new JSONObject();
		   JSONArray jsonArray = new JSONArray();//배열이 필요할때

		   for(int i=0;i < list.size() ; i++){
			        JSONObject obj = new JSONObject();
			    	obj.put("bmno",list.get(i).getBmno());
			    	obj.put("name",list.get(i).getBmname());
	//		      JSONObject obj = new JSONObject(); //배열 내에 들어갈 json
	//    	       json.put(list.get(i).getBmno(), list.get(i).getBmname());
		    	   jsonArray.add(obj);
		   }
      //      json.put("list", jsonArray);//배열을 넣음
		   out.print(jsonArray);    
     
	
		
		%>
