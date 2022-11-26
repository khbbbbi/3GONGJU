<!-- 회원가입하면 user테이블에 정보 insert -->
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
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("_name");
	String id = request.getParameter("_id");
	String pw = request.getParameter("_pw");
	
	bread.userinsert(name, id, pw);
	
	out.println(name);
	out.println(id);
	out.println(pw);
	response.sendRedirect("Login.jsp");
%>
</body>
</html>