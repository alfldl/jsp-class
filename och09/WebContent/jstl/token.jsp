<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set var="animals" value="토끼, 강아지*고양이, 망아지"> </c:set>
<h2>사자의 생일</h2>
<c:forTokens var="an" items="${animals }" delims="*" > <!-- delims 뒤에 요소가 구분자가되어 value를 나눠줌  ,*둘다 쓰면 둘다 삭제해줌-->
${an }<br>
</c:forTokens>
</body>
</html>