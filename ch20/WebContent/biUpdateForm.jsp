<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>
<!DOCTYPE html><html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도서 입고관리 수정</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head><body>
<form action="biUpdatePro.do" method="post">
		<input type="hidden" name="book_kind" value="${bookIn.book_kind}">
		<input type="hidden" name="bookno" value="${bookIn.bookno}">
		<input type="hidden" name="bookseq" value="${bookIn.bookseq}">
		<input type="hidden" name="pageNum" value="${pageNum}">
		<table border="1">
					<caption><h2>도서 입고관리  수정</h2></caption>
					<tr><td>도서 유형</td><td>${bookIn.book_kind}</td></tr>
					<tr><td>도서 번호</td><td>${bookIn.bookno}</td></tr>
					<tr><td>도서 일련번호</td><td>${bookIn.bookseq}</td></tr>
					<tr><td>도서 명</td><td>
					<input type="text" name="bookname" required="required"	 value="${bookIn.bookname}"></td></tr>
					<tr><td>저자</td>
					        <td><input type="text" name="write" required="required" value="${bookIn.write}"></td></tr>
					<tr><td>도서생성일자</td>
					     <td><input type="text" name="bookcredate" required="required"	 value="${bookIn.bookcredate}"></td></tr>
					<tr><td>도서상태</td>
					      <td><input type="text" name="bookstate" required="required"  value="${bookIn.bookstate}"></td></tr>
					<tr><td>대여여부</td>
					     <td><input type="text" name="booklent_yn" value="${bookIn.booklent_yn}"></td></tr>
					<tr><td colspan="2">
					      <input type="submit" value="수정완료" >
						</td>
					</tr>
		</table>
</form>
</body>
</html>