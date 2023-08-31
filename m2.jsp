<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="style.css">
<meta charset="EUC-KR">
<title>매장별 커피 판매관리</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<section>
		<h1>판매현황</h1>
		<table border=1>
			<tr>
				<td>비번호</td>
				<td>상품코드</td>
				<td>판매날짜</td>
				<td>매장코드</td>
				<td>상품명</td>
				<td>판매수량</td>
				<td>총판매액</td>
			</tr>
		<%
			try{
				Class.forName("oracle.jdbc.OracleDriver");
				Connection con = DriverManager.getConnection
						("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
				Statement stmt = con.createStatement();
				String sql = " select sale.saleno , sale.pcode , to_char(sale.saledate,'YYYY-MM-DD') as date1 ," +
							 " sale.scode , apro.name , sale.amount||'개' as amount1 , "+
							 " to_char((apro.cost*sale.amount),'999,999,999')||'원' as cost1 "+
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