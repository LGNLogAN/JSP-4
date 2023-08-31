<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="style.css">
<meta charset="EUC-KR">
<title>매장별 커피 판매관리</title>
<script type="text/javascript">
	function ccc(){
		if(document.frm2.number1.value.length == 0){
			alert("판매코드 번호가 입력되지 않았습니다.");
			frm2.number1.focus();
			return false;
		}
		success();
		return true;
	}	
	
	function success(){
		alert("판매코드가 입력 되었습니다");
	}
</script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<section>
		<h1>판매코드조회</h1>
		<form name="frm2" action="action3.jsp">
			<table border=1>
				<tr>
					<td>판매코드 번호를 입력하시오</td>
					<td><input type="text" name = "number1"></td>
				</tr>
				
				<tr>
					<td colspan=2>
						<input type="submit" value="판매코드조회" onclick = "return ccc();">
						<input type="submit" value="홈으로" onclick = "window.location.href='index.jsp'; return false;">
					</td>
				</tr>
			</table>		
		</form>
	</section>
		
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>