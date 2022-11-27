<!-- 장바구니에서 주문하기 누를때 페이지-->
<!-- 장바구니에서 선택된 상품들의 정보를 가져옴 -->
<!-- 한비 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String state = (String)session.getAttribute("__ID");
	String[] checked = request.getParameterValues("category");
	
	 try {      
         Class.forName("com.mysql.jdbc.Driver");
         Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/teampj","root","1234");
         Statement stmt = conn.createStatement();
         
         String sql = "select * from cart, breadinfo, user where cart.breadID = breadinfo.breadID and cart.userIdx = user.userIdx and user.userId = "+state+"";
         ResultSet rs = stmt.executeQuery(sql);

         while(rs.next()){
         }
	  		rs.close();
	  		stmt.close();
	  		conn.close();
	 		
	 } catch (Exception e) {
	     e.printStackTrace();
	 }

     %>
%>
</body>
</html>