<!-- 수량 수정 : 마이너스 -->
<!-- 한비 -->
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
	String minuscartID = request.getParameter("_clickedcartID");
	
	bread.minuscount(minuscartID);
	
	response.sendRedirect("Cart.jsp");
%>
</body>
</html>