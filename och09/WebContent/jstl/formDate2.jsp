<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<c:set var="date" value="<%=new Date() %>"> </c:set>
<body>
<h2>현재 날짜와 시간</h2>
<fmt:formatDate value="${date }" type="both" dateStyle="short" timeStyle="short" /> <br>
<fmt:formatDate value="${date }" type="both" dateStyle="medium" timeStyle="medium" /> <br>
<fmt:formatDate value="${date }" type="both" dateStyle="long" timeStyle="long" /> <br>
<fmt:formatDate value="${date }" type="both" dateStyle="full" timeStyle="full" /> <br>
</body>
</html>