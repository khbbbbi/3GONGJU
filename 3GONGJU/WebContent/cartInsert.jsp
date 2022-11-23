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
<jsp:useBean id = "bread" class = "bread.breadDAO"></jsp:useBean>
<%
	request.setCharacterEncoding("UTF-8");

	String breadID = request.getParameter("_breadID");
	String surrang = request.getParameter("_surrang");
	
	bread.insert(breadID, surrang);
	
	
	out.println(breadID);
	out.println(surrang);
	
   %>
</body>
</html>