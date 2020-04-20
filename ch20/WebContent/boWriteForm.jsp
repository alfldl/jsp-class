<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도서 출고정보 등록</title>
<link rel="stylesheet" type="text/css" href="style.css">

<script type="text/javascript">
	function chk() {
		if (frm.passwd.value != frm.passwd2.value) {
			alert("암호가 다릅니다");
			frm.passwd.focus();
			return false;
		}
		return true;
	}
	
	function winop1() {
		window.open("confirmBmno.jsp?bmno=" + frm.bmno.value, "",
			                 	  "width=400 height=600");
	}	
	function winop2() {
		window.open("confirmBI.jsp", "",	  "width=700 height=600");
}
</script>
</head>
<body>
<form action="boWritePro.do?pageNum=${pageNum}"  method="post" name="frm" >
	<table>
		<caption><h2>도서 출고정보 등록</h2></caption>
		<tr>
					<td>출고회원</td>
					<td><input type="text" name="bmno"  id="bmno"   required="required" readonly >
				        	<input  name="bmname"  id="bmname" disabled>
				        	<input type="button"  value="출고회원 체크" onclick="winop1()">
				    </td>
		</tr>
		
		<tr><td>도서 유형</td> 
				<td><input type="text" name="book_kind"  id="book_kind"   required="required" readonly ></td>	
		</tr>		
		<tr><td>도서 번호</td> <td><input type="text" name="bookno"       id="bookno"        required="required"  readonly></td></tr>      
		<tr><td>도서 체크</td> <td><input type="text" name="bookseq"     id="bookseq"       required="required" readonly ></td></tr>      
	     <tr><td>도서명 </td><td><input type="text" name="bookname" 	required="required" readonly ></td></tr>
		 <tr><td>저자</td><td><input type="text" name="write" required="required"  readonly></td></tr>
		 <tr><td>도서 체크버튼</td><td><input type="button"  value="도서 번호 / 체크 정보 가져오기" onclick="winop2()"></td></tr>
		 <tr><td>대여일자</td><td><input type="date" name="bookLentDate" required="required" ></td></tr>
		 <tr><td>반납일자</td><td><input type="date" name="bookRetDate" required="required" ></td></tr>
		<tr>
		    <td  colspan="2"><input type="submit" value="도서출고정보 등록">
			                                 <input type="reset" value="다시작성">
			</td>
		</tr>
	</table>
</form>
</body></html>