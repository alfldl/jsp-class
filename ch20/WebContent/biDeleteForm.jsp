<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도서 입고관리 삭제</title>
<link rel="stylesheet" href="style.css" type="text/css">
<style type="text/css">
table {
	width: 100%;
}
</style>

<script type="text/javascript">
	function chk() {
		var list = new Array();
	 	<c:forEach items="${list }" var="list" >	
	    	list.push("${list.check1}");
		</c:forEach>

		for (var i=0; i<list.length;){
			alert("list->"+ i + " :  "+ list[i++]);
		}
		return false;
	}	
	
	</script>
	
</head>
<body>
	<h2>도서 입고 리스트 삭제 kkk --> biDeleteForm2.jsp</h2>
<%-- 	<form action="biDeletePro.do?pageNum=${pageNum}"  method="post"  onsubmit="return chk()"> --%>
	<form action="biDeletePro.do?pageNum=${pageNum}"  method="post"  >
			<table>
				<tr>
					<th>삭제구분</th>
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
					<c:forEach var="bookIn" items="${list }"   varStatus="status">
							<input type="hidden" name="book_kind"   value="${bookIn.book_kind}">
		                   <input type="hidden" name="bookno"          value="${bookIn.bookno}">
		                   <input type="hidden" name="bookseq"        value="${bookIn.bookseq}">
		                   <input type="hidden" name="bookname"     value="${bookIn.bookname}">
				    	<%--   <input type="hidden" name="check"              value="${bookIn.check }"> --%>
						<tr>
							<td>
		                           
							<%--     삭제<input type="text" name="check1" value="${bookIn.check1 }"> --%>
					  	삭제<input type="checkbox" name="check1" value="1"><br>		
	    					  <!-- <select name="check1" required="required"  >
										<option value="0">유지  </option>
										<option value="1">삭제  </option>
						     </select> 	 -->	 				       
							</td>
							<td>${startNum }</td>
							<td>${bookIn.book_kind }</td>
			    			<td>${bookIn.bookno }</td>
			    			<td>${bookIn.bookseq }</td>
							<td class=left width=200>
							        <c:if test="${bookIn.booklent_yn == 'Y'}">
								         	<img src='images/hot.gif'>
								   </c:if>
									${bookIn.bookname}
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
			<tr>
			    <td><input type="submit" value="확인kk"></td>
				<td><input type="reset" value="다시작성"></td>
			</tr>			
	</form>
	<div style="text-align: center;">
		<c:if test="${startPage > blockSize }">
			<a href='biDeleteForm.do?pageNum=${startPage-blockSize}'>[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href='biDeleteForm.do?pageNum=${i}'>[${i}]</a>
		</c:forEach>
		<c:if test="${endPage < pageCnt }">
			<a href='biDeleteForm.do?pageNum=${startPage+blockSize}'>[다음]</a>
		</c:if>
	</div>
</body>
</html>