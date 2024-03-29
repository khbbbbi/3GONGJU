<!-- 선택상품 삭제, 수량수정, 선택상품의 금액만 계산  -->
<!-- 한비 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>장바구니</title>
    <link rel="stylesheet" href="css/Cart.css" />
</head>
<body>
<jsp:useBean id = "bread" class = "bread.breadDAO"></jsp:useBean>
<script language = "javascript">
	function order(){
        if (confirm('주문을 하러가시겠습니까?')) {
        	// 네!
        	location.href="Order.jsp";
        } else {
        	//아니오ㅡ.ㅡ
        	location.href="#";
        }
	}
	
    var sum=0;
    function checkSelectAll(price, cBox) {
    var sumtext = document.getElementById("sumtext"); // 이런것들 무조건 function안에 쓰기.
    
    if(cBox.checked)
        sum += parseInt(price); 
    else
       sum -= parseInt(price);
   	   sumtext.value = sum;
        
    }
    function godeletechecked(){
    	document.gogo.action = "deletechecked.jsp";
		document.gogo.submit();
    }
    function goshopping(){
		document.gogo.action = "Menu.jsp";
		document.gogo.submit();
	}
	function goorder(){
		document.gogo.action = "Order.jsp";
		document.gogo.submit();
	}
	function plus(clicked_id){
		location.href="plus.jsp?_clickedcartID="+clicked_id+"";
	}
	function minus(clicked_id){
		location.href="minus.jsp?_clickedcartID="+clicked_id+"";
	}

</script>
    <header>
        <!-- 상단에 이름, 로그아웃, 장바구니 -->
        <div class = "area_header">
            <div class = "gita">
                <% 
            	String state = (String)session.getAttribute("__ID");
            	if(state ==null){
            	%>
            		<script>
            			 if (confirm('로그인이 필요한 서비스입니다. 로그인창으로 이동하시겠습니까?')) {
            		        	// 네!
            		        	location.href="Login.jsp";
            		        } else {
            		        	//아니오ㅡ.ㅡ
            		        	history.back();
            		        }
            		</script>
            	<%
            	}else{%>
                	<a href="Myinfo.jsp" class="link_text" style="color: darkslateblue"><%= state %></a>님
                	<a href="Logout.jsp" onclick="logout()" id = "logintf" class="link_text" style="color: darkslateblue">로그아웃</a>            		
                	<a href="Cart.jsp" class="link_text"><img src = "images/mybag.png" width="24" height="21"></a>
            	<%}
            	%>
            </div>
        
            <!-- 헤더에서 로고와 네비바 -->
                <!-- 로고 -->
                <div class = "logo">
                    <a href="Main.jsp"><img src = "images/logo1.png" width="140" height="90"></a>
                </div>
                <!-- 네비바 -->
                <div class = "nav">
                    <nav class = "navbar">
                        <ul id="main-menu">
                            <li><a href="#"><b>Menu</b></a>
                            <ul id="sub-menu">
                                <li><a href="Menu.jsp" >전체</a></li>
                                <li><a href="Menu.jsp?cate_=cookie" aria-label="subemnu">쿠키&파이</a></li>
                                <li><a href="Menu.jsp?cate_=cake" aria-label="subemnu">케익</a></li>
                                <li><a href="Menu.jsp?cate_=bakery" aria-label="subemnu">베이커리</a></li>
                                <li><a href="Menu.jsp?cate_=macaroon" aria-label="subemnu">마카롱&오믈렛</a></li>
                                <li><a href="Menu.jsp?cate_=drink" aria-label="subemnu">음료</a></li>
                            </ul>
                            </li>
                            <li><a href="#"><b>Store</b></a>
                            <ul id="sub-menu">
                                <li><a href="Map.jsp" aria-label="subemnu">매장찾기</a></li>
                            </ul>
                            </li>
                            <li><a href="#"><b>Mypage</b></a>
                            <ul id="sub-menu">
                                <li><a href="Orderlist.jsp" aria-label="subemnu">주문내역</a></li>
                                <li><a href="Cart.jsp" aria-label="subemnu">장바구니</a></li>
                                <li><a href="Myinfo.jsp" aria-label="subemnu">내정보</a></li>
                            </ul>
                            </li>
                            <li><a href="#"><b>Event</b></a>
                            <ul id="sub-menu">
                                <li><a href="Eventlist.jsp" aria-label="subemnu">이벤트</a></li>
                            </ul>
                        </ul>
                    </nav>
                </div>
        </div>
    </header>
    <div class = "area_all">
            <section class = "area_main">
                <article class="cart">
                        <ul>
                            <li>* 장바구니 상품은 최대 30일간 저장됩니다.</li>
                            <li>가격, 옵션 등 정보가 변경된 경우 주문이 불가할 수 있습니다.</li>
                            <li>오늘출발 상품은 판매자 설정 시점에 따라 오늘출발 여부가 변경될 수 있으니 주문 시 꼭 다시 확인해 주시기 바랍니다.</li>
                        </ul>
                </article>
                <article id="sec2">
                	<form name = "gogo" action = "deletechecked.jsp" method = "get">
                        <table class="cart__list">
                            <thead>
                                <tr>
                                    <td colspan="2">상품정보</td>
                                    <td>옵션</td>
                                    <td>상품금액</td>
                                </tr>
                            </thead>
                            <tbody>
    	<%
    	//while(rs.next)가 반복되는 구간이니 반복할 구간에서 디비를 설정해야함! header밑에 넣었다가 안됐었음..주의!
		String breadID = request.getParameter("_breadID");
		String surrang = request.getParameter("_surrang");
		
		 try {      
	         Class.forName("com.mysql.jdbc.Driver");
	         Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/teampj","root","1234");
	         Statement stmt = conn.createStatement();
	         
			//cart,breadinfo,user 세개의 테이블을 외래키를 통해 연결시켜 세 테이블의 모든 정보 불러 올  수 있음. 조건문에  현재 로그인된 사용자의 장바구니정보를 가져올 수 있도록 userIdx를 받아온 userIdx와 비교
	         String sql = "select * from cart, breadinfo, user where cart.breadID = breadinfo.breadID and cart.userIdx = user.userIdx and user.userId = '"+state+"'";
	         ResultSet rs = stmt.executeQuery(sql);

	         while(rs.next()){
	        	 	String cartID = rs.getString("cartID");
		        	String userId = rs.getString("userId");
		        	String breadname = rs.getString("breadname");
		        	//수량에 따른 상품가격을 측정하기위해 int로 받아옴.
		        	int  price = rs.getInt("price");
		        	int count = rs.getInt("count");
	     %>
                                <tr class="cart_list_detail">
                                    <input type = "hidden" value = <%=cartID %>>
                                    <td  style="width: 5%;"><input type="checkbox" name="category" value =<%=cartID %> onclick='checkSelectAll("<%=price*count %>", this)'>
                                    </td>
                                    <td>
                                    	<span class="cart_list_3GongJu">3GongJu</span>
                                        <p><%= breadname %></p>
                                        <span name = "price"><%= price %></span>
                                    </td>
                                    <td class="cart_list_option">
                                        <p>상품명 : <%= breadname %></p>
                                        <input type = "button" onclick="minus(this.id)" id = "<%= cartID %>" value = "-">
                                        <input id = "count" name = "_count" type = "text" class="cart_list_optionbtn" value="<%= count %>">              
                                        <input type = "button" onclick="plus(this.id)" id = "<%= cartID %>" value = "+">
                                        
                                    </td>
                                    <td>
                                    	<p name = "_sangpumprice" class="sangpumprice"><%= price*count %></p>
                                    </td>
                                </tr>
       <%
	         }
		  		rs.close();
		  		stmt.close();
		  		conn.close();
		 		
		       } catch (Exception e) {
		          e.printStackTrace();
		       }
	    %>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td colspan="5">
                                        <button class="cart_list_optionbtn" onclick = "godeletechecked()">선택상품 삭제</button>
                                    </td>
                                </tr>
                            </tfoot>
                        
                    </table>
					<div class = "price">
                         <h3>전체금액</h3>
                         <input id="sumtext" name = "Productprice" type="text" value="0" style="width:300px;font-size:20px;"readonly="readonly">
                    </div>
                    <div class="cart_mainbtns">
                        <button class="cart_bigorderbtn left" onclick = "goshopping()">쇼핑 계속하기</button>
                        <button class="cart_bigorderbtn right" onclick="goorder()">픽업예약하기</button>
                    </div>
                    </form>
                </article>
            </section>
            
        <footer>
            <p>Company/CEO : SMC INTERNATIONAL CO., LTD. / Minchang Shin, Hanna Choi<br>
            Address : 321, Eonju-ro, Gangnam-gu, Seoul, Republic of Korea [Zip Code: 06226]<br>
            Customer Service : 1644 - 2927<br>
            Registration Number : 719 - 86 - 00092<br></p>
            <div class = "endline">
            <p>TM & Copyright 2022 로고. All Rights Reserved.</p> 
            </div>
        </footer>
        </div>
        <script>

        </script>
</body>
</html>