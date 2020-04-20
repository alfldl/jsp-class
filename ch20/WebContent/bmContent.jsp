<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="style.css">
<style type="text/css">table { width: 80%; }</style></head><body>

<table border="1">
	<caption><h2>도서 회원정보 상세내역</h2></caption>
	<tr><td width="50">회원번호</td><td>${bookMember.bmno}</td></tr>
	<tr><td>도서 회원 이름</td><td>${bookMember.bmname}</td></tr>
	<tr><td>주소</td><td>${bookMember.bmaddr}</td></tr>
	<tr><td>전화</td><td>${bookMember.bmtel}</td></tr>
	<tr><td>근무지</td><td>${bookMember.bmloc}</td></tr>
	<tr><td>회원등급</td><td>${bookMember.bmgrade}</td></tr>
	<tr><td>미반납 회수</td><td>${bookMember.noretcnt}</td></tr>
	<tr><td>대여구분</td><td><pre>${bookMember.lent_yn}</pre></td></tr>
	<tr><td colspan="2"><input type="button" value="수정" 
	 onclick="location.href='bmUpdateForm.do?bmno=${bookMember.bmno}&pageNum=${pageNum}'">
		<input type="button" value="삭제"
	 onclick="location.href='bmDeleteForm.do?bmno=${bookMember.bmno}&pageNum=${pageNum}'">
		<input type="button" value="목록"
			onclick="location.href='bmList.do?pageNum=${pageNum}'"></td></tr>
</table></body></html>