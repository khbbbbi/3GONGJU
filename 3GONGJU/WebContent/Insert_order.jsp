<!-- 주문확정 시 insert, 주문확인 페이지로 값보내기-->
<!-- 한비 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");

 	String state = (String)session.getAttribute("__ID");
	String pickupstore = request.getParameter("_pickupstore");
	
	String pickupMonth = request.getParameter("_pickupMonth");
	String pickupDay = request.getParameter("_pickupDay");
	String pickuphour = request.getParameter("_pickuphour");
	String pickupminute = request.getParameter("_pickupminute");
	String pickupdate = pickupMonth  + "." +  pickupDay  + "." +  pickuphour  + ":" +  pickupminute;	//픽업일자
	
	String[] breadid = request.getParameterValues("_breadID");	//빵ID
	String[] totalprice = request.getParameterValues("_productprice");	//수량*금액
	
	java.util.Date d = new java.util.Date();
	String orderdate = (d.getYear()+1900) + "." + (d.getMonth()+1)+ "." + d.getDate();	//주문 날짜
	
	String[] count = request.getParameterValues("_count");		//수량
	String JJintotal = request.getParameter("_total");	//결제 총액
	
	for(int i = 0; i < breadid.length; i++){
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/teampj","root","1234");
			Statement stmt = conn.createStatement();
			stmt.executeUpdate("insert into orders(pickupstore,pickupDate, userIdx, breadID, tatalprice, orderdate, count)" +
			"values('"+pickupstore+"','"+pickupdate+"',(select userIdx from user where userId = '"+state+"'), '"+breadid[i]+"','"+totalprice[i]+"', '"+orderdate+"', '"+count[i]+"')");

			stmt.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	String Estore="";
	if(pickupstore.equals("인천점")) {Estore = "Incheon";}
	if(pickupstore.equals("수원점")) {Estore = "Suwon";}
	if(pickupstore.equals("일산점")) {Estore = "Ilsan";}
		
	out.println("<script>alert('주문이 완료되셨습니다^^감사합니다');</script>");

	response.sendRedirect("Ordercheck.jsp?_store="+Estore+"&_pickupdate="+pickupdate+"&_JJintotal="+JJintotal+"");
	
%>
</body>
</html>