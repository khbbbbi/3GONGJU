<!--cartcopycheck에서 확인했는데 같은 상품이 없을때 장바구니에 insert하기  -->
<!--한비  -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id = "bread" class = "bread.breadDAO"></jsp:useBean>
<%
	request.setCharacterEncoding("UTF-8");

	String state = (String)session.getAttribute("__ID");
	String breadID = request.getParameter("_breadID");
	String surrang = request.getParameter("_surrang");

	//breadDAO에 디비 연결 있음.
	bread.cartinsert(state,breadID, surrang);
	
	
	out.println("<script>if (confirm('장바구니로 이동하시겠습니까?')) {");
	out.println("location.href='Cart.jsp?_breadID="+breadID+"&_surrang="+surrang+"';");
	out.println("} else { history.back();} </script>");
	
	
	%>
<%-- 	<script>
	if (confirm('장바구니로 이동하시겠습니까?')) {
		//네!!
    	// insert를 한 후 장바구니로 이동할 것인지 물음.
    	<% response.sendRedirect("Cart.jsp?_breadID="+breadID+"&_surrang="+surrang+"");%>
    } else {
    	//아니오ㅡ.ㅡ
    	//바로 전페이지로 이동(DetailMenu.jsp)
    	history.back();
    }	
	</script> --%>

</body>
</html>