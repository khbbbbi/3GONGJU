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
try {      
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/teampj","root","1234");
        Statement stmt = conn.createStatement();
        
        String sql = "select * from breadinfo";
        
        ResultSet rs = stmt.executeQuery(sql);
        while(rs.next()){
        	String sr = rs.getString("imgsrc");
        	String name = rs.getString("breadname");
        	String price = rs.getString("price");
        	%><table>
        		<tr><img src="<%= sr %>"></tr>
        		<tr><%= name %></tr>
        		<tr><%= price %></tr>
        	</table>
        	<%
        }

        rs.close();
  		stmt.close();
  		conn.close();
	 		
    } catch (Exception e) {
        e.printStackTrace();
    }
%>


<input type = "button" value ="파이" onclick = "img()">

</body>
</html>
