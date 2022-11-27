<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	
	String pickupstore = "인천점";
	String pickupDate = "2022.11.27";
	String userIdx = "1";
	String breadID = "3";
	String talprice = "6000";
	java.util.Date d = new java.util.Date();
	String orderdate = (d.getYear()+1900) + "." + (d.getMonth()+1)+ "." + d.getDate();
	String count = "2";
	

	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/teampj","root","1234");
		Statement stmt = conn.createStatement();
		stmt.executeUpdate("Insert into ordertest (pickupstore, pickupDate, userIdx, breadID, tatalprice, orderdate, count)"
				+ " values ('"+pickupstore+"','"+pickupDate+"','"+userIdx+"','"+breadID+"','"+talprice+"','"+orderdate+"','"+count+"')");

		stmt.close();
		conn.close();
		
		out.println("완료");
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
</body>
</html>