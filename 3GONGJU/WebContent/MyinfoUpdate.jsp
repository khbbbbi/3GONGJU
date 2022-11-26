<!-- 현희 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
<%

	//이전페이지에서 받은 변경 할 비밀번호
	String getUserPassword = request.getParameter("userPassword");
	//이전페이지에서 받은 변경대상 회원번호
	String getUserIdx = request.getParameter("userIdx");
	
   	System.out.println("비번은? : "+getUserPassword);
   	System.out.println("회원번호는? : "+getUserIdx);
	
try {      
	
	Class.forName("com.mysql.jdbc.Driver");
	
	System.out.println("====데이터베이 연결시작 ====");
	
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/teampj","root","1234");
    //업데이트 쿼리 실행
	String sql = "UPDATE user SET userPassword = ? WHERE userIdx = ?";
   	
   	PreparedStatement pstmt = conn.prepareStatement(sql);
	
   	//업데이트 ?물음표에 들어갈 값 바인딩
   	pstmt.setString(1, getUserPassword);
	pstmt.setString(2, getUserIdx);

	int result = pstmt.executeUpdate();
	
	//업데이트가 정상이면 쿼리에서 1을 반환한다.
	if(result > 0){
		%>
		<script>
			alert("비밀번호를 변경하였습니다.");
			location.href="Login.jsp";
		</script>
		<%
	}else{
		%>
		<script>
			alert("비밀번호를 변경실패 하였습니다.");
			location.href="Myinfo.jsp";
		</script>
		<%
	}
  	
	pstmt.close();
	conn.close();
	
 } catch (Exception e) {
    e.printStackTrace();
 }

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
</head>
<body>
</body>
</html>