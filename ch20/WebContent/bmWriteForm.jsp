<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도서 회원정보 등록</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head><body>
<form action="bmWritePro.do?pageNum=${pageNum}"  method="post">
<table>
	<caption><h2>도서 회원정보 등록</h2></caption>
	<tr><td> 회원 이름</td><td> <input type="text" name="bmname" required="required" > </td></tr>
	<tr><td>주소</td><td><input type="text" name="bmaddr"   required="required"></td></tr>
	<tr><td>전화 </td><td><input type="text" name="bmtel" 	required="required"></td></tr>
	<tr><td>근무지 </td><td><input type="text" name="bmloc" 	required="required"></td></tr>
	<tr><td>회원등급</td><td><input type="text" name="bmgrade" required="required"></td></tr>
	<tr><td>비밀번호</td><td><input type="password" name="passwd" 	required="required"></td></tr>
	<tr>
	    <td><input type="submit" value="확인"></td>
		<td><input type="reset" value="다시작성"></td>
	</tr>
</table>
</form>
</body></html>