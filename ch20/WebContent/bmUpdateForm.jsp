<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>
<!DOCTYPE html><html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 수정</title>
<link rel="stylesheet" type="text/css" href="style.css">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		$("#chk").keydown(function(e) {

		    if(e.keyCode === 9) { // tab was pressed
		    	alert("Tab Key 누름 ")
				var chk = $('#chk').val();
		    	alert("chk-> "+chk);

		    	$('.result1').append($(this).text());
		    	frm.bmaddr.value = chk;
	
		    }		
		});
	});
</script>

<body>


<form  name="frm" action="bmUpdatePro.do" method="post">
		<input type="hidden" name="bmno" value="${bookMember.bmno}">
		<input type="hidden" name="pageNum" value="${pageNum}">
		<table border="1">
					<caption><h2>도서 회원정보  수정</h2></caption>
					<tr><td>번호</td><td>${bookMember.bmno}</td></tr>
					<tr><td>회원 이름</td><td>
					<input type="text" id="chk" name="bmname" required="required" value="${bookMember.bmname}">
					    <input type="text" id="msg" name="bmname2" value="change" required="required" >
					    <span class="result1"></span>
					</td></tr>
					<tr><td>비밀번호</td><td><input type="text" name="passwd" required="required"
					 value="${bookMember.passwd}"></td></tr>
					<tr><td>주소</td><td><input type="text" name="bmaddr" required="required"
					 value="${bookMember.bmaddr}"></td></tr>
					<tr><td>전화</td><td><input type="text" name="bmtel" required="required"
						 value="${bookMember.bmtel}"></td></tr>
					<tr><td>근무지</td><td><input type="text" name="bmloc" 
						 value="${bookMember.bmloc}"></td></tr>
					<tr><td>회원등급</td><td><input type="text" name="bmgrade" required="required"
					 value="${bookMember.bmgrade}"></td></tr>
					<tr><td>미반납 회수</td><td><input type="text" name="noretcnt" required="required"
					 value="${bookMember.noretcnt}"></td></tr>
					<tr><td>대여구분</td><td><input type="text" name="lent_yn" required="required"
					 value="${bookMember.lent_yn}"></td></tr>
					<tr><td colspan="2"><input type="submit" value="수정완료" >
						</td></tr>
		</table>
</form>
</body>
</html>