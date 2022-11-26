<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

%>
<form>
	<select>
		<%
			for(int i = 1; i<100; i++){
				%><option><%=i %></option><%
			}
		%>
	</select>  
	<input type = "button" value = "수정"><p>
	<input name = "_count" type = "text"  value = "1">     
	<input type = "button" value = "수정"><p>
	<input name = "_count" type = "text" value = "1">     
	<input type = "button" value = "수정"><p>
	<input name = "_count" type = "text" value = "1">     
	<input type = "button" value = "수정"><p>
</form>

</body>
</html>