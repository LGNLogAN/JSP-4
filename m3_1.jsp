<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장별 커피 판매관리</title>
<link rel="stylesheet" href="style.css">

<script type="text/javascript">
	function aaa(){
		if(document.frm.saleno.value.length == 0){
			alert("판매번호가 입력되지 않았습니다.");
			frm.saleno.focus();
			return false;
		}
		
		if(document.frm.pcode.value.length == 0){
			alert("판매코드가 선택되지 않았습니다.");
			frm.pcode.focus();
			return false;
		}
		
		if(document.frm.saledate.value.length == 0){
			alert("판매날짜가 입력되지 않았습니다.");
			frm.saledate.focus();
			return false;
		}
		
		if(document.frm.scode[0].checked==false && 
				document.frm.scode[1].checked==false && 
				document.frm.scode[2].checked==false && 
				document.frm.scode[3].checked==false && 
				document.frm.scode[4].checked==false && 
				document.frm.scode[5].checked==false){
			alert("매장코드를 선택하지 않았습니다.");
			frm.scode[0].focus();
			return false;
		}
		
		if(document.frm.amount.value.length == 0){
			alert("판매수량이 입력되지 않았습니다.");
			frm.amount.focus();
			return false;
		}
		success();
		return true;
		
	function success(){
		alert("정상적으로 매장별 판매등록이 완료되었습니다");
	}
	
	function bbb(){
		alert("모든 데이터를 삭제하고 처음부터 다시 입력합니다 !");
		frm.saleno.focus();
		return false;
	}
}

</script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
		<section>
			<h1>판매 등록</h1>
			<form action="action2.jsp" name="frm">
				<table border=1>
						<tr>
							<td>비번호</td>
							<td><input type="text" name="saleno"></td>
						</tr>
						
						<tr>
							<td>상품코드</td>
							<td>
								<select name="pcode" style="margin-right:61px;">
									<option value=""></option>
									<option value="AA01">아메리카노</option>
									<option value="AA02">에스프레소</option>
									<option value="AA03">카페라떼</option>
									<option value="AA04">카라멜마끼</option>
									<option value="AA05">카푸치노</option>
									<option value="AA06">초코롤케잌</option>
									<option value="AA07">녹차롤케잌</option>
									<option value="AA08">망고쥬스</option>
									<option value="AA09">핫초코</option>
								</select>
							</td>
						</tr>
						
						<tr>
							<td>판매날짜</td>
							<td><input type="date" name="saledate"></td>
						</tr>
						
						<tr>
							<td>매장코드</td>
							<td>
								<input type="radio" name="scode" value="S001">S001
								<input type="radio" name="scode" value="S002">S002
								<input type="radio" name="scode" value="S003">S003<br>
								<input type="radio" name="scode" value="S004">S004
								<input type="radio" name="scode" value="S005">S005
								<input type="radio" name="scode" value="S006">S006
							</td>
						</tr>
						
						<tr>
							<td>판매수량</td>
							<td><input type="text" name="amount"></td>
						</tr> 
						
						<tr>
							<td colspan=2;>
								<input type="submit" value="등록" onclick="return aaa()">
								<input type="reset" value="다시쓰기" onclick="return bbb()">
							</td>
						</tr>
						
				</table>	
			</form>
		</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>