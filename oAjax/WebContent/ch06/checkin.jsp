<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title></head>
<body>
이름: ${param.name }님 반갑습니다 .<p>
<c:choose>
 <c:when test="${param.name=='admin' && param.pass=='1234'}">
 	당신은 모든 권한이 있습니다
 </c:when>
 <c:otherwise>
 	당신은 권한이 없습니다
 </c:otherwise>
</c:choose>
</body>
</html>