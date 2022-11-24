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
<%
	boolean found;
	
request.setCharacterEncoding("UTF-8");

	String breadID = request.getParameter("_breadID");
	String surrang = request.getParameter("_surrang");
	
	try {      
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/teampj","root","1234");
        Statement stmt = conn.createStatement();

        String sql = "select * from cart where userIdx = '1' AND breadID = '"+breadID+"'";
        ResultSet rs = stmt.executeQuery(sql);
        found = rs.next();
        
        if(found){
        	out.println("<script>if (confirm('이미 동일한 상품이 장바구니에 있습니다. 장바구니로 이동하시겠습니까?')) {");
        	out.println("location.href='Cart.jsp?_userIdx=1&_breadID="+breadID+"&_surrang="+surrang+"';");
        	out.println("} else { history.back();} </script>");
        }else{
        	response.sendRedirect("cart_insert.jsp?_userIdx=1&_breadID="+breadID+"&_surrang="+surrang+"");
        }

  		rs.close();
  		stmt.close();
  		conn.close();
 		
       } catch (Exception e) {
          e.printStackTrace();
       }
	
   %>

</body>
</html>