<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="style.css">
<title>action3</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
			<%
				String number1 = request.getParameter("number1");
			
				try{
					Class.forName("oracle.jdbc.OracleDriver");
					Connection con = DriverManager.getConnection
							("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
					Statement stmt = con.createStatement();
					String sql = " select saleno, pcode,"+
								 " to_char(saledate,'YYYY-MM-DD') as date1 , scode," +
								 " amount||'��' as amount1" +
								 " from ai_salelist_3 " +
								 " where pcode = '"+ number1 +"'";
					
					ResultSet rs = stmt.executeQuery(sql);
					
					if(rs.next()){
							%>
							<h1>�Ǹ��ڵ���ȸ</h1>
							<h1>�Ǹ��ڵ� : <%= request.getParameter("number1") %> �� ��ȸ���</h1>
							<table border=1>
								<tr>
									<td>�ǸŹ�ȣ</td>
									<td>�Ǹ��ڵ�</td>
									<td>�Ǹ���</td>
									<td>�����ڵ�</td>
									<td>����</td>
								</tr>
							
							<%
							do{
								out.print("<tr><td>" + rs.getString("saleno"));
								out.print("</td><td>" + rs.getString("pcode"));
								out.print("</td><td>" + rs.getString("date1"));
								out.print("</td><td>" + rs.getString("scode"));
								out.print("</td><td>" + rs.getString("amount1") + "</td></tr>");
							}while(rs.next());
							%>
								</table>
							<%
							out.print("<div style=\"text-align:center; padding:10px;\">");
							out.print("<button onclick=\"window.location.href='index.jsp'\">" + "���ư���" + "</button>");
							out.print("</div>");
					}else{
						out.print("<h1>�Ǹ��ڵ尡 �������� �ʽ��ϴ� !</h1>");
						out.print("<div style=\"text-align:center; padding-bottom:10px;\">");
						out.print("<button onclick=\"window.location.href='index.jsp'\">" + "���ư���" + "</button>");
						out.print("</div>");
					}
					stmt.executeUpdate(sql);
				}catch(Exception e){
					e.printStackTrace();
				}
				
			%>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>