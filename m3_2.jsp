<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="style.css">
<meta charset="EUC-KR">
<title>매장별 커피 판매관리</title>
<script type="text/javascript">
	function aaa(){
		if(document.frm.saleno.value.length == 0){
			alert("판매번호가 입력되지 않았습니다.");
			frm.saleno.focus();
			return false;
		}
		if(document.frm.pcode.value.length == 0){
			alert("판매코드를 선택하지 않았습니다.");
			frm.pcode.focus();
			return false;
		}
		if(document.frm.saledate.value.length == 0){
			alert("판매날짜가 입력되지 않았습니다.");
			frm.saledate.focus();
			return false;
		}
		if(document.frm.scode.value.length == 0){
			alert("매장코드를 입력하지 않았습니다.");
			frm.scode.focus();
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
			alert("정상적으로 매장별 판매등록이 완료되었습니다.");
		}
		
		function bbb(){
			alert("모든 데이터를 삭제하고 처음부터 다시 입력합니다.");
			frm.saleno.focus;
		}
	}
</script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<section>
		<h1>판매 등록</h1>
			<form name="frm" action="action.jsp">
				<table border=1>
					<tr>
						<td>비번호</td>
						<td><input type="text" name="saleno"></td>
					</tr>
					
					<tr>
						<td>상품코드</td>
						<td><input type="text" name="pcode"></td>
					</tr>
					
					<tr>
						<td>판매날짜</td>
						<td><input type="text" name="saledate"></td>
					</tr>
					
					<tr>
						<td>매장코드</td>
						<td><input type="text" name="scode"></td>
					</tr>
					
					<tr>
						<td>판매수량</td>
						<td><input type="text" name="amount"></td>
					</tr>
					
					<tr>
						<td colspan=2>
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