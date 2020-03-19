<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="memberCheck.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title></head>
<body>
<h2>탈퇴하려면 암호를 입력하시오</h2>
<form action="deletePro.jsp">
	<fieldset >
		<label for="passwd">암호 : </label> 
 		 <input type="password" name="passwd" id="passwd"><p>		 	
 		 <input type="submit" value="확인">
	</fieldset>	
</form>
</body>
</html>