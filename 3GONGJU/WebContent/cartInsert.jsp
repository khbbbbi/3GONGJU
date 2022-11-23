<!-- 장바구니에 담기 버튼 누르면 장바구니에 insert하기  -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	String breadID = request.getParameter("_breaID");
	String surrang = request.getParameter("_surrang");
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/teampj","root","1234");
		Statement stmt = conn.createStatement();
		//stmt.executeUpdate("Insert into cart (userIdx, breadID) values('"+userid+"','"+breadID+"')");
		//out.println("ID : " + id);
		//out.println("암호 : " + pw);
		//out.println("성명 : " + name);
		out.println("<h1>회원정보 등록이  완료되었습니다.</h1>");
		stmt.close();
		conn.close();
	}catch(SQLException e){
		e.printStackTrace();
	}
   %>
</body>
</html>