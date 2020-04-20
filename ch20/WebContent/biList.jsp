<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도서 입고관리</title>
<link rel="stylesheet" href="style.css" type="text/css">
<style type="text/css">
table {
	width: 100%;
}
</style>
</head>
<body>
	<h2>도서 입고 리스트</h2>
	<table>
		<tr>
			<td><a href="biWriteForm.do">도서 입고 등록</a></td>
			<td><a href="biDeleteForm.do">도서 입고 삭제</a></td>
		</tr>
	</table>
	<table>
		<tr>
			<th>도서 순서</th>
			<th>도서 유형</th>
			<th>도서 번호</th>
			<th>도서 일련번호</th>
			<th>도서명</th>
			<th>저자</th>
			<th>도서상태</th>
			<th>대여구분 </th>
		</tr>
		<c:if test="${totCnt > 0 }">
			<c:forEach var="bookIn" items="${list }">
				<tr>
					<td>${startNum }</td>
					<td>${bookIn.book_kind }</td>
	    			<td>${bookIn.bookno }</td>
	    			<td>${bookIn.bookseq }</td>
					<td class=left width=200>
					        <c:if test="${bookIn.booklent_yn == 'Y'}">
						         	<img src='images/hot.gif'>
						   </c:if>
						 <a href='biContent.do?book_kind=${bookIn.book_kind}&bookno=${bookIn.bookno}&bookseq=${bookIn.bookseq}&pageNum=${currentPage}'>
							${bookIn.bookname}</a>
					</td>
					<td>${bookIn.write}</td>
					<td>${bookIn.bookstate}</td>
					<td>${bookIn.booklent_yn}</td>
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
			<a href='biList.do?pageNum=${startPage-blockSize}'>[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href='biList.do?pageNum=${i}'>[${i}]</a>
		</c:forEach>
		<c:if test="${endPage < pageCnt }">
			<a href='biList.do?pageNum=${startPage+blockSize}'>[다음]</a>
		</c:if>
	</div>
</body>
</html>