<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="dao.*" errorPage="Error.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		<% 	
			BookMemberDao bmd = BookMemberDao.getInstance();
		   List<BookMember> list = bmd.bmlist(1, 10);	
		
		  JSONObject json= new JSONObject();
		   JSONArray jsonArray = new JSONArray();//배열이 필요할때

		   for(int i=0;i < list.size() ; i++){
	//		      JSONObject obj = new JSONObject(); //배열 내에 들어갈 json
	    	       json.put(list.get(i).getBmno(), list.get(i).getBmname());
		//     	   jsonArray.add(obj);
		   }
      //      json.put("list", jsonArray);//배열을 넣음
	//	   out.print(json);    
           out.print("123456yyy"); 
		   
	/* 	    for(int i=0; i < list.size(); i++) {
			   JSONObject obj = new JSONObject();
			   obj.put("bmno","name");
			   JSONArray data = new JSONArray();
			   data.add(i);
			   obj.put(list.get(i).getBmno(), list.get(i).getBmname());
		    	// System.out.println("  " + list.get(i).getBmno());
		    	// System.out.println("  " + list.get(i).getBmname());
		    	//obj.put("bmno",list.get(i).getBmno());
		    	//obj.put("name",list.get(i).getBmname());
		    	out.print(obj); 
		    } */
		
		%>
</body>
</html>