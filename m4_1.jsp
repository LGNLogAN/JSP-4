<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
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
		<h1>매장별판매액</h1>
		
		<table border=1>
			<tr>
				<td>매장코드</td>
				<td>매장명</td>
				<td>매장별판매액</td>
			</tr>
			
			<%
				try{
					Class.forName("oracle.jdbc.OracleDriver");
					Connection con = DriverManager.getConnection
							("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
					Statement stmt = con.createStatement();
					String sql = " select al.scode , ash.sname , to_char(sum(ap.cost*al.amount) , '999,999')||'원' as ang " +
								 " from ai_product_3 ap , ai_salelist_3 al , ai_shop_3 ash " +
								 " where al.pcode = ap.pcode and ash.scode = al.scode " +
								 " group by al.scode , ash.sname " +
								 " order by scode asc";
					
					ResultSet rs = stmt.executeQuery(sql);
					while(rs.next()){
						out.print("<tr><td>" + rs.getString("scode"));
						out.print("</td><td>" + rs.getString("sname"));
						out.print("</td><td>" + rs.getString("ang") + "</td></tr>");
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