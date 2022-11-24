<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>안녕안녕</h1>
		<%
    	String userIdx = request.getParameter("_userIdx");
		String breadID = request.getParameter("_breadID");
		String surrang = request.getParameter("_surrang");
		
		 try {      
	         Class.forName("com.mysql.jdbc.Driver");
	         Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/teampj","root","1234");
	         Statement stmt = conn.createStatement();
	         
	         //String sql = "select * from cart, breadinfo where cart.breadID = breadinfo.breadID and userIdx = "+userIdx+"";
	         String sql = "select * from cart, breadinfo, user where cart.breadID = breadinfo.breadID and cart.userIdx = user.userIdx and cart.userIdx = "+userIdx+"";
	         
	         ResultSet rs = stmt.executeQuery(sql);

	         out.println("<table border = 1>");
	         while(rs.next()){
	        	 //String userId = rs.getString("userId");
	        	 //String breadname = rs.getString("breadname");
	        	 //String price = rs.getString("price");
	        	 //String count = rs.getString("count");
	        	String userIdxx = rs.getString("userIdx");
	        	String userId = rs.getString("userId");
	        	String breadname = rs.getString("breadname");
	        	String price = rs.getString("price");
	        	String count = rs.getString("count");
	        	
	        	out.println("<tr>");
	    		out.println("<td>userIdx</td>");
	    		out.println("<td>userId</td>");
	    		out.println("<td>breadname</td>");
	    		out.println("<td>price</td>");
	    		out.println("<td>count</td>");
	    		out.println("</tr>");
	     		out.println("<tr>");
	    		out.println("<td>" + userIdxx + "</td>");
	    		out.println("<td>" + userId + "</td>");
	    		out.println("<td>" + breadname + "</td>");
	    		out.println("<td>" + price + "</td>");
	    		out.println("<td>" + count + "</td>");
	    		out.println("</tr>");
	         }
	         out.println("</table>");
		  		rs.close();
		  		stmt.close();
		  		conn.close();
		 		
		       } catch (Exception e) {
		          e.printStackTrace();
		       }
	    %>  
</body>
</html>