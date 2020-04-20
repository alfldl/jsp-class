<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도서회원</title>
<link rel="stylesheet" href="style.css" type="text/css">
<style type="text/css">
table {
	width: 100%;
}
</style>
</head>
<body>
	<h2>도서회원 리스트</h2>
	<table>
		<tr>
			<td><a href="bmWriteForm.do">글쓰기</a></td>
		</tr>
	</table>
	<table>
		<tr>
			<th>도서 회원 번호</th>
			<th>도서 회원 이름</th>
			<th>주소</th>
			<th>전화</th>
			<th>회원등급</th>
			<th>미반납 회수</th>
			<th>대여구분 </th>
		</tr>
		<c:if test="${totCnt > 0 }">
			<c:forEach var="bookMember" items="${list }">
				<tr>
					<td>${startNum }</td>
					<td class=left width=200>
					        <c:if test="${bookMember.noretcnt > 2}">
						         	<img src='images/hot.gif'>
						   </c:if>
						 <a href='bmContent.do?bmno=${bookMember.bmno}&pageNum=${currentPage}'>
							${bookMember.bmname}</a>
					</td>
					<td>${bookMember.bmaddr}</td>
					<td>${bookMember.bmtel}</td>
					<td>${bookMember.bmgrade}</td>
					<td>${bookMember.noretcnt}</td>
					<td>${bookMember.lent_yn}</td>
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
			<a href='bmList.do?pageNum=${startPage-blockSize}'>[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href='bmList.do?pageNum=${i}'>[${i}]</a>
		</c:forEach>
		<c:if test="${endPage < pageCnt }">
			<a href='bmList.do?pageNum=${startPage+blockSize}'>[다음]</a>
		</c:if>
	</div>
</body>
</html>