<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<c:set var="greet" value="How Are You ?"> </c:set>
<body>
<h2>인사말</h2>
원글 : ${greet } <p>
대문자 : ${fn:toUpperCase(greet) }<p>
소문자 : ${fn:toLowerCase(greet) }<p>
Are 위치 : ${fn:indexOf(greet, "Are") }<p>
Are 변경 : ${fn:replace(greet, "Are","Were") }<p>
문자길이: ${fn:length(greet) }

</body>
</html>