<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String context = request.getContextPath();
%>
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Main Menu</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
<script type="text/javascript">

	/* $(function() {
		$('#bmno').click(function() {
			var bmno = $('#bmno').val();
			var sendData = 'bmno='+bmno;
				$.post('ajax.jsp', sendData , function(msg) {
				$('#memberName').html(msg);
			});
		});

	}); */
	
	function getListDept3(){
		str    = "";
		str2   = "";

		console.log("getListDept ajaxTest3 Run");
		alert("getListDept ajaxTest3 ... Run->");  
		
		$.post('ajaxTest3.jsp', function(msg) {
	    	var list = JSON.parse(msg);
            var item; 
			// alert("ajaxTest3 list->"+list);
		 	$.each(list,function() {
			 	 alert("ajaxTest3->"  +this.bmno+this.name); 
			}); 
		});
	 }	
	
	function getListDept5(){
		str2   = "";
		console.log("getListDept ajaxTest5 Run");
		alert("getListDept ajaxTest5 ... Run->");  
		$.getJSON('item.json',function(data,status) {
				$('#fruits').append('<tr><th>ID</th><th>이름</th>'+
				'<th>가격</th><th>설 명</th></tr>');
			$.each(data,function() {
			    alert("item.json->" + +this.id+this.name);
	
			$('#fruits').append('<tr><td>'+this.id+'</td>'
					+'<td>'+this.name+'</td><td>'+this.price+
					'</td><td>'+this.description+'</td></tr>');
			});
		});
	}

	function getListDept7(){
		str    = "";
		str2   = "";

		console.log("getListDept ajaxTest7 Run");
		alert("getListDept ajaxTest7 ... Run->");  
		
		$.post('ajaxTest7.jsp', function(msg) {
	    	var list = JSON.parse(msg);
			alert("ajaxTest7 list->"+list);
	    	alert("ajaxTest7 2 ->"  +list.bmno+list.name); 
            var item; 
		});
	 }	

</script>
</head>
<body>
<c:if test="${result<0 }">
	<script type="text/javascript">
		alert("잘못된 사용자입니다 ! ");
		location.href="login.do";
	</script>
</c:if>	
<c:if test="${result == 0 }">
	<script type="text/javascript">
		alert("헐 ~ ㅠㅠ 암호 틀려");
		location.href="login.do";
	</script>
</c:if>	

<input type="button"   id="bmno"    value="${ bmno}">${ bmno}님  <p>
AjaxTest LISTVO3: <input type="button" id="btn_Dept3"     value="부서명 LIST3"  onclick="getListDept3()"> <p>
    <span id="DeptList"></span><p>
AjaxTest LISTVO5: <input type="button" id="btn_Dept5"     value="부서명 LIST5"  onclick="getListDept5()"> 
	                        <table id="fruits" border="1"></table>
AjaxTest LISTVO7: <input type="button" id="btn_Dept7"     value="부서명 LIST7"  onclick="getListDept7()"> 
	     <span id="DeptList7"></span><p>
<div>

		숫자 <span id="bmno"></span> -> <span id="name"></span>

	</div>

<span id="memberName"></span><p>
<h1>도서회원관리</h1>
<table bgcolor="pink" border="1" width="80%">
	<tr><td><a href="bmWriteForm.do">도서회원 생성</a></td></tr>
	<tr><td><a href="bmList.do">도서회원 명단List</a></td></tr>
</table><p><p>

<h1>입고내역관리</h1>
<table bgcolor="pink" border="1" width="80%">
	<tr><td><a href="biWriteForm.do">입고내역 신규등록</a></td></tr>
	<tr><td><a href="biList.do">입고내역  List</a></td></tr>
</table> 

<h1>출고내역관리</h1>
<table bgcolor="pink" border="1" width="80%">
	<tr><td><a href="boWriteForm.do">출고내역 신규등록</a></td></tr>
	<tr><td><a href="boList.do">출고내역  List</a></td></tr>
</table> 

</body>
</html>