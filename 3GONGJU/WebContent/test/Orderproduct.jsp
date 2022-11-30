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
	String[] checked = request.getParameterValues("category");	//cartid
	String checkedID = new String();
	
	 try {      
         Class.forName("com.mysql.jdbc.Driver");
         Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/teampj","root","1234");
         Statement stmt = conn.createStatement();

         for(int i = 0; i < checked.length; i++){
         	String sql = "select * from cart, breadinfo where cart.breadID = breadinfo.breadID and cart.cartID = '"+checked[i]+"'";
         	ResultSet rs = stmt.executeQuery(sql);
        	 
         while(rs.next()){
        	 String cartID = rs.getString("cartID");
        	 String breadname = rs.getString("breadname");
        	 String price = rs.getString("price");
        	 
        	 out.println(cartID);
        	 out.println(breadname);
        	 out.println(price);
         }
         rs.close();
         }
         stmt.close();
	  	 conn.close();
	 		
	 } catch (Exception e) {
	     e.printStackTrace();
	 }

     %>
</body>
</html>