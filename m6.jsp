<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="style.css">
<meta charset="EUC-KR">
<title>���庰 Ŀ�� �ǸŰ���</title>
<script type="text/javascript">
	function ccc(){
		if(document.frm2.number1.value.length == 0){
			alert("�Ǹ��ڵ� ��ȣ�� �Էµ��� �ʾҽ��ϴ�.");
			frm2.number1.focus();
			return false;
		}
		success();
		return true;
	}	
	
	function success(){
		alert("�Ǹ��ڵ尡 �Է� �Ǿ����ϴ�");
	}
</script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<section>
		<h1>�Ǹ��ڵ���ȸ</h1>
		<form name="frm2" action="action3.jsp">
			<table border=1>
				<tr>
					<td>�Ǹ��ڵ� ��ȣ�� �Է��Ͻÿ�</td>
					<td><input type="text" name = "number1"></td>
				</tr>
				
				<tr>
					<td colspan=2>
						<input type="submit" value="�Ǹ��ڵ���ȸ" onclick = "return ccc();">
						<input type="submit" value="Ȩ����" onclick = "window.location.href='index.jsp'; return false;">
					</td>
				</tr>
			</table>		
		</form>
	</section>
		
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>