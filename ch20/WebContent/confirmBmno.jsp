<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="Error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도서회원 리스트 조회 및 선택</title>
<link rel="stylesheet" href="style.css" type="text/css">
<style type="text/css">
table {
	width: 100%;
}
</style>

<% 	String bmno = request.getParameter("bmno"); %>
<script type="text/javascript">
	function wincl(bmno, bmname) {
/* 		alert("wincl Start");
		alert("wincl bmno"+bmno);
	 	alert("wincl bmname"+bmname);  */
	    opener.document.frm.bmno.value=bmno;
		opener.document.frm.bmname.value=bmname; 
		window.close();
	}
</script></head>
<body>
	<h2>도서회원 리스트 조회 및 선택</h2>
	<a href='boConfirmBmno.do'>도서회원 리스트조회</a>
	<table>
		<tr>
			<th>순번</th>
			<th>도서 회원 번호</th>
			<th>도서 회원 이름</th>
		</tr>
		<c:if test="${totCnt > 0 }">
			<c:forEach var="bookMember" items="${list }">
				<tr>
					<td>${startNum }</td>
					<td>${bookMember.bmno}</td>
					<td >${bookMember.bmname} 	<input type="button" value="선택"   onclick="wincl('${bookMember.bmno}','${bookMember.bmname}' 	)">		</td>
				</tr>
				<c:set var="startNum" value="${startNum - 1 }" />
			</c:forEach>
		</c:if>
		<c:if test="${totCnt == 0 }">
			<tr>
				<td colspan=7>데이터가 없네</td>
			</tr>
		</c:if>
	</table>
	
	<div style="text-align: center;">
		<c:if test="${startPage > blockSize }">
			<a href='boConfirmBmno.do?pageNum=${startPage-blockSize}'>[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href='boConfirmBmno.do?pageNum=${i}'>[${i}]</a>
		</c:forEach>
		<c:if test="${endPage < pageCnt }">
			<a href='boConfirmBmno.do?pageNum=${startPage+blockSize}'>[다음]</a>
		</c:if>
	</div>
	
</body>
</html>