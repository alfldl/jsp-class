<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="style.css">
<style type="text/css">table { width: 70%; }</style></head><body>

<table border="1">
	<caption><h2>도서 입고내역 상세내역</h2></caption>
	<tr><td width="80">도서 유형</td><td>${bookIn.book_kind}</td></tr>
	<tr><td>도서 번호</td><td>${bookIn.bookno}</td></tr>
	<tr><td>일련 번호</td><td>${bookIn.bookseq}</td></tr>
	<tr><td>도서 명</td><td>${bookIn.bookname}</td></tr>
	<tr><td>저자</td><td>${bookIn.write}</td></tr>
	<tr><td>도서생성일자</td><td>${bookIn.bookcredate}</td></tr>
	<tr><td>도서상태</td><td>${bookIn.bookstate}</td></tr>
	<tr><td>대여여부</td><td>${bookIn.booklent_yn}</td></tr>
	<tr><td>도서 입고일</td><td><pre>${bookIn.reg_date}</pre></td></tr>
	<tr><td colspan="2"><input type="button" value="수정" 
	 onclick="location.href='biUpdateForm.do?book_kind=${bookIn.book_kind}&bookno=${bookIn.bookno}&bookseq=${bookIn.bookseq}&pageNum=${pageNum}'">
		<input type="button" value="삭제"
	 onclick="location.href='biDeleteForm.do?book_kind=${bookIn.book_kind}&bookno=${bookIn.bookno}&bookseq=${bookIn.bookseq}&pageNum=${pageNum}'">
		<input type="button" value="목록"
			onclick="location.href='biList.do?pageNum=${pageNum}'"></td></tr>
</table></body></html>