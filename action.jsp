<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>action.jsp</title>
</head>
<body>
	<%
		String saleno=request.getParameter("saleno");
		String pcode=request.getParameter("pcode");
		String saledate=request.getParameter("saledate");
		String scode=request.getParameter("scode");
		String amount=request.getParameter("amount");
		
		try{
			Class.forName("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection
					("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			Statement stmt = con.createStatement();
			String sql = " insert into ai_salelist_3 "+
					  " values("+saleno+",'"+pcode+"','"+saledate+"','"+scode+"',"+amount+")";

			stmt.executeUpdate(sql);
			response.sendRedirect("table1.jsp");
			
		}catch(Exception e){
			e.printStackTrace();
		}
	%>
</body>
</html>