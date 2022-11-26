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
	boolean found;

	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("_id");
	String pw = request.getParameter("_pw");
	
	try {      
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/teampj","root","1234");
        Statement stmt = conn.createStatement();
        
        String sql = "select * from user where userId = "+id+" and userPassword = "+pw+"";
        
        ResultSet rs = stmt.executeQuery(sql);
        found = rs.next();
        
        if(found){
        	response.sendRedirect("Main.jsp");
        	//out.println("성공");
        }else{
        	//out.println("실패");
        	out.print("<script>alert('입력하신 아이디 혹은 비밀번호가 일치하지 않습니다.');");
        	out.print("history.back();</script>");
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