<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String pickupstore = request.getParameter("_store");
						String pickupdate = request.getParameter("_pickupdate");
						String total = request.getParameter("_total");
					out.println(pickupstore);	
					out.println(pickupdate);	
					out.println(total);	
						%>
</body>
</html>