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
<jsp:useBean id = "bread" class = "bread.breadDAO"></jsp:useBean>
<%
	String state = (String)session.getAttribute("__ID");
	String pickupstore = request.getParameter("_pickupstore");
	
	String pickupMonth = request.getParameter("_pickupMonth");
	String pickupDay = request.getParameter("_pickupDay");
	String pickuphour = request.getParameter("_pickuphour");
	String pickupminute = request.getParameter("_pickupminute");
	
	String total = request.getParameter("_total");
	
	java.util.Date d = new java.util.Date();
	String orderdate = (d.getYear()+1900) + "." + (d.getMonth()+1)+ "." + d.getDate();
	
	String pickupdate = pickupMonth + pickupDay + " " +  pickuphour + pickupminute;

	
	bread.orderinsert(pickupstore, pickupdate, state, total, orderdate);
	
	out.println("<script>alert('주문이 완료되셨습니다^^감사합니다');</script>");
	

	response.sendRedirect("NewFile.jsp?_store="+pickupstore+"&_pickupdate="+pickupdate+"&_total="+total+"");
%>
</body>
</html>