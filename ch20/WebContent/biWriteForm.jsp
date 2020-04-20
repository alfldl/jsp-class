<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도서 입고정보 등록</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head><body>
<form action="biWritePro.do?pageNum=${pageNum}"  method="post">
<table>
	<caption><h2>도서 입고정보 등록</h2></caption>
	<tr><td>도서 유형</td><td> 
	 <select name="book_kind" required="required" width="50">
		<option value="A">A:소설          </option>
		<option value="B">B:수필          </option>
		<option value="C">C:기술           </option>
		<option value="D">D:스포츠        </option>
		<option value="E">E:잡지            </option>
	</select><p>
	 </td></tr>
	<tr><td>도서 번호</td><td><input type="text" name="bookno"   required="required"></td></tr>
	<tr><td>도서 일련번호 </td><td><input type="text" name="bookseq" 	required="required"></td></tr>
	<tr><td>도서명 </td><td><input type="text" name="bookname" 	required="required"></td></tr>
	<tr><td>저자</td><td><input type="text" name="write" required="required"></td></tr>
	<tr><td>도서상태</td><td>   
	      <select name="bookstate" required="required"  width="50">
					<option value="A">A급           </option>
					<option value="B">B급           </option>
					<option value="C">C급           </option>
					<option value="D">D급          </option>
	     </select><p>
	<tr>
	    <td><input type="submit" value="확인"></td>
		<td><input type="reset" value="다시작성"></td>
	</tr>
</table>
</form>
</body></html>