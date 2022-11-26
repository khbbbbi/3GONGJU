<%@page import="bread.breadDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id = "bread" class = "bread.breadDAO"></jsp:useBean>
<%
	String pluscartID = request.getParameter("_clickedcartID");
	
	//out.println(pluscartID);
	
	bread.pluscount(pluscartID);
	
	response.sendRedirect("Cart.jsp");
	//out.println("<script>history.back();</script>");
%>
</body>
</html>