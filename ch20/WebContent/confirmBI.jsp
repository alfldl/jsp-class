<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="Error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도서입고 리스트  조회 및 선택</title>
<link rel="stylesheet" href="style.css" type="text/css">
<style type="text/css">
table {
	width: 100%;
}
</style>
<% 	String bmno = request.getParameter("bmno"); %>
<script type="text/javascript">
	function wincl(book_kind, bookno,bookseq, bookname,write ) {
/* 		alert("wincl bookname"+bookname);
	 	alert("wincl write"+write);  */
	    opener.document.frm.book_kind.value=book_kind;
		opener.document.frm.bookno.value=bookno; 
		opener.document.frm.bookseq.value=bookseq; 
		opener.document.frm.bookname.value=bookname; 
		opener.document.frm.write.value=write; 
		window.close();
	}
</script></head>
<body>
	<h2>도서입고 리스트 조회 및 선택</h2>
	<a href='boConfirmBI.do'>도서입고 리스트 조회</a>
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
					<td>${startNum } 
					        <input type="button" value="선택"   
					                     onclick="wincl('${bookIn.book_kind}','${bookIn.bookno}' ,'${bookIn.bookseq}' ,'${bookIn.bookname}' ,'${bookIn.write}'  	)">
					</td>
					<td>${bookIn.book_kind }</td>
	    			<td>${bookIn.bookno }</td>
	    			<td>${bookIn.bookseq }</td>
					<td>${bookIn.bookname}	</td>
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
			<a href='boConfirmBI.do?pageNum=${startPage-blockSize}'>[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href='boConfirmBI.do?pageNum=${i}'>[${i}]</a>
		</c:forEach>
		<c:if test="${endPage < pageCnt }">
			<a href='boConfirmBI.do?pageNum=${startPage+blockSize}'>[다음]</a>
		</c:if>
	</div>	
</body>
</html>