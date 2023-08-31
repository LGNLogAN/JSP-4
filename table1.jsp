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
		<h1>판매데이터 Table</h1>
		<table border=1>
			<tr>
				<td>판매번호</td>
				<td>판매코드</td>
				<td>판매일</td>
				<td>매장코드</td>
				<td>수량</td>
			</tr>
		<%
			try{
				Class.forName("oracle.jdbc.OracleDriver");
				Connection con = DriverManager.getConnection
						("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
				Statement stmt = con.createStatement();
				String sql = " select saleno, pcode,"+
							 " to_char(saledate,'YYYY-MM-DD HH24:MI:SS') as date1 , scode," +
							 " amount||'개' as amount1" +
							 " from ai_salelist_3";
				ResultSet rs = stmt.executeQuery(sql);
				while(rs.next()){
					out.print("<tr><td>" + rs.getString("saleno"));
					out.print("</td><td>" + rs.getString("pcode"));
					out.print("</td><td>" + rs.getString("date1"));
					out.print("</td><td>" + rs.getString("scode"));
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