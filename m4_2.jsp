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
		<h1>상품별 판매액</h1>
		
		<table border=1>
			<tr>
				<td>상품코드</td>
				<td>상품명</td>
				<td>상품별 판매액</td>
			</tr>
			
			<%
				try{
					Class.forName("oracle.jdbc.OracleDriver");
					Connection con = DriverManager.getConnection
							("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
					Statement stmt = con.createStatement();
					String sql = "select al.pcode , ap.name , to_char(sum(ap.cost*al.amount) , '999,999') as ang " +
								 " from ai_product_3 ap , ai_salelist_3 al , ai_shop_3 ash " +
								 " where al.pcode = ap.pcode and ash.scode = al.scode " +
								 " group by al.pcode , ap.name " +
								 " order by ang desc";
						
					ResultSet rs = stmt.executeQuery(sql);
					while(rs.next()){
						out.print("<tr><td>" + rs.getString("pcode"));
						out.print("</td><td>" + rs.getString("name"));
						out.print("</td><td>" + rs.getString("ang") + "원</td></tr>");
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