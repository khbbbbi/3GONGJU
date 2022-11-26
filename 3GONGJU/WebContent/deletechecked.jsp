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
	String state = (String)session.getAttribute("__ID");
	String[] checked = request.getParameterValues("category");

	bread.checkeddelete(state, checked);

	response.sendRedirect("Cart.jsp");
%>
</body>
</html>