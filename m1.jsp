<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="style.css">
<meta charset="EUC-KR">
<title>���庰 Ŀ�� �ǸŰ���</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<section>
		<h1>�Ǹŵ�����</h1>
		<table border=1>
			<tr>
				<td>�ǸŹ�ȣ</td>
				<td>�Ǹ��ڵ�</td>
				<td>�����ڵ�</td>
				<td>����</td>
			</tr>
		<%
			try{
				Class.forName("oracle.jdbc.OracleDriver");
				Connection con = DriverManager.getConnection
						("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
				Statement stmt = con.createStatement();
				String sql = " select saleno, pcode ," +
							 " case scode" +
							 " when 'S001' then '������'" +
							 " when 'S002' then '������'" +
							 " when 'S003' then '������'" +
							 " when 'S004' then '������'" +
							 " when 'S005' then '���빮��'" +
							 " when 'S006' then '��õ��' "+
							 " END ang ," +
							 " amount||'��' as amount1 " +
							 " from ai_salelist_3 ";
				ResultSet rs = stmt.executeQuery(sql);
				while(rs.next()){
					out.print("<tr><td>" + rs.getString("saleno"));
					out.print("</td><td>" + rs.getString("pcode"));
					out.print("</td><td>" + rs.getString("ang"));
					out.print("</td><td>" + rs.getString("amount1") + "</td></tr>");
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		
		%>
		</table>
	</section>
		
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>