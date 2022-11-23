
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1>뚜비니</h1>
   <%
      try {
         
         
         Class.forName("com.mysql.jdbc.Driver");
         Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/bread","root","1234");
         Statement stmt = conn.createStatement();

         //ResultSet rs = stmt.executeQuery("select breadname, category from bread");
         String category_ = "pie";
         String sql = "select breadname from bread where category like 'pie'  ";
            ResultSet rs = stmt.executeQuery(sql);
   %>
   <table border="1">
      <tr>
      <th>빵이름</th>
      <th>카테고리</th>
      </tr>
      <%
         while (rs.next()) {
               String breadname = rs.getString("breadname");
               /* String category = rs.getString("category"); */
               out.println("<tr>");
               out.println("<td width='100'>" + breadname + "</td>");
               /* out.println("<td width='100'>" + category + "</td>"); */
               out.println("</tr>");

            }
      %>
   </table>

   <%
      } catch (Exception e) {
         e.printStackTrace();
      }
   %>


</body>
</html>