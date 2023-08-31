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
		<h1>�Ǹ���Ȳ</h1>
		<table border=1>
			<tr>
				<td>���ȣ</td>
				<td>��ǰ�ڵ�</td>
				<td>�Ǹų�¥</td>
				<td>�����ڵ�</td>
				<td>��ǰ��</td>
				<td>�Ǹż���</td>
				<td>���Ǹž�</td>
			</tr>
		<%
			try{
				Class.forName("oracle.jdbc.OracleDriver");
				Connection con = DriverManager.getConnection
						("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
				Statement stmt = con.createStatement();
				String sql = " select sale.saleno , sale.pcode , to_char(sale.saledate,'YYYY-MM-DD') as date1 ," +
							 " sale.scode , apro.name , sale.amount||'��' as amount1 , "+
							 " to_char((apro.cost*sale.amount),'999,999,999')||'��' as cost1 "+
				  			 " from ai_product_3 apro , ai_salelist_3 sale" +
						 	 " where apro.pcode=sale.pcode";
				ResultSet rs = stmt.executeQuery(sql);
				while(rs.next()){
					out.print("<tr><td>" + rs.getString("saleno"));
					out.print("</td><td>" + rs.getString("pcode"));
					out.print("</td><td>" + rs.getString("date1"));
					out.print("</td><td>" + rs.getString("scode"));
					out.print("</td><td>" + rs.getString("name"));
					out.print("</td><td>" + rs.getString("amount1"));
					out.print("</td><td>" + rs.getString("cost1") + "</td></tr>");
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