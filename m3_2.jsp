<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="style.css">
<meta charset="EUC-KR">
<title>���庰 Ŀ�� �ǸŰ���</title>
<script type="text/javascript">
	function aaa(){
		if(document.frm.saleno.value.length == 0){
			alert("�ǸŹ�ȣ�� �Էµ��� �ʾҽ��ϴ�.");
			frm.saleno.focus();
			return false;
		}
		if(document.frm.pcode.value.length == 0){
			alert("�Ǹ��ڵ带 �������� �ʾҽ��ϴ�.");
			frm.pcode.focus();
			return false;
		}
		if(document.frm.saledate.value.length == 0){
			alert("�Ǹų�¥�� �Էµ��� �ʾҽ��ϴ�.");
			frm.saledate.focus();
			return false;
		}
		if(document.frm.scode.value.length == 0){
			alert("�����ڵ带 �Է����� �ʾҽ��ϴ�.");
			frm.scode.focus();
			return false;
		}
		if(document.frm.amount.value.length == 0){
			alert("�Ǹż����� �Էµ��� �ʾҽ��ϴ�.");
			frm.amount.focus();
			return false;
		}
		success();
		return true;
		
		function success(){
			alert("���������� ���庰 �Ǹŵ���� �Ϸ�Ǿ����ϴ�.");
		}
		
		function bbb(){
			alert("��� �����͸� �����ϰ� ó������ �ٽ� �Է��մϴ�.");
			frm.saleno.focus;
		}
	}
</script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<section>
		<h1>�Ǹ� ���</h1>
			<form name="frm" action="action.jsp">
				<table border=1>
					<tr>
						<td>���ȣ</td>
						<td><input type="text" name="saleno"></td>
					</tr>
					
					<tr>
						<td>��ǰ�ڵ�</td>
						<td><input type="text" name="pcode"></td>
					</tr>
					
					<tr>
						<td>�Ǹų�¥</td>
						<td><input type="text" name="saledate"></td>
					</tr>
					
					<tr>
						<td>�����ڵ�</td>
						<td><input type="text" name="scode"></td>
					</tr>
					
					<tr>
						<td>�Ǹż���</td>
						<td><input type="text" name="amount"></td>
					</tr>
					
					<tr>
						<td colspan=2>
							<input type="submit" value="���" onclick="return aaa()">
							<input type="reset" value="�ٽþ���" onclick="return bbb()">
						</td>
					</tr>
			</table>
		</form>
		
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>