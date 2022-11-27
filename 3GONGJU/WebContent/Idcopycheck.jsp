<!-- 아이디 중복확인 버튼 누르면 나오는 팝업창 8 -->
<!-- 한비 -->
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
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("_id");

      try {      
         Class.forName("com.mysql.jdbc.Driver");
         Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/teampj","root","1234");
         Statement stmt = conn.createStatement();

         String sql = "select userId from user where userId ='"+id+"'";
         ResultSet rs = stmt.executeQuery(sql);

 		if(rs.next()){
 			//
			%>
			<table style="text-align: center; margin:auto;">
				<tr><td>이미 사용중인 아이디입니다.</td></tr>
				<tr><td><input type="button" value="수정하기" onclick="resetid()"></td></tr>
			</table>
			<%
 		}else{
 			%>
			 <table style="text-align: center; margin:auto;">
				<tr><td>사용 가능한 아이디입니다.</td></tr>
				<tr><td><input type="button" value="사용하기" onclick="useid()"></td></tr>
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
   <script type="text/javascript">
        function resetid(){
        	window.close();
             opener.document.getElementById("idcheck").value = "";
             opener.document.getElementById("idcheck").focus();
        }
        function useid(){
        	window.close();
        	opener.document.getElementById("pw").focus();
        }
   </script>
</body>
</html>