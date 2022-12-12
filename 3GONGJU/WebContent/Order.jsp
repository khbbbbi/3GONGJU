<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문</title>
    <link rel="stylesheet" href="css/Order.css" />
</head>
<script language = "javascript">
	function resetorder(){
        if (confirm('정말 주문을 취소하시겠어요?')) {
        	// 네!
        	history.back();
        } else {
        	//아니오ㅡ.ㅡ
        	location.href="#";
        }
	}
	
	function incart(){
		if (confirm('장바구니로 이동하시겠어요?')) {
        	// 네!
        	location.href="Cart.jsp";
        } else {
        	//아니오ㅡ.ㅡ
        	location.href="#";
        }
	}
	
	/* function goorder(){
		if (confirm('주문을 확정하시겠어요?')) {
        	// 네!
			document.detail.action = "Insert_order.jsp";
			document.detail.submit();
        } else {
        	//아니오ㅡ.ㅡ
        	location.href="#";
        }
	} */
	function goorder(){
		if (confirm('주문을 확정하시겠어요?')) {
        	// 네!
			document.detail.action = "Insert_order.jsp";
			document.detail.submit();
        } else {
        	//아니오ㅡ.ㅡ
        	location.href="#";
        }
	}
</script>
<body>
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
        <main>
            <section class = "area_main">
                <h1 style="text-align: center; font-size: 30px;text-decoration: overline; color: white;">픽업 예약하기</h1>
                <article class="container">
        		<form action = "Insert_order.jsp" method = "get">
                    <div class = "date">
                        <p style="text-align: left;">Pickup_Info</p>
                        <div class = "date_grid">
                            <p><img src="./images/place.png" width="25" height="20">픽업지점 </p>
                            <div class = "item">
                            <select id="pickup_spot" name = "_pickupstore" value = "인천점">
                                <option>인천점</option>
                                <option>수원점</option>
                                <option>일산점</option>
                            </select>
                            </div>
                        <p><img src="./images/Cal.png" width="30" height="20">픽업일</p>
                        <div class = "item">
                            <p style="font-size: 8px;">&#x261D; 시간을 정확히 입력해주세요 &#x261D;</p>
                            <select name = "_pickupMonth" value = "01">
                                <option>01</option>
                                <option>02</option>
                                <option>03</option>
                                <option>04</option>
                                <option>05</option>
                                <option>06</option>
                                <option>07</option>
                                <option>08</option>
                                <option>09</option>
                                <option>10</option>
                                <option>11</option>
                                <option>12</option>
                            </select>월
    
                            <select name = "_pickupDay" value = "01">
                                <option>01</option>
                                <option>02</option>
                                <option>03</option>
                                <option>04</option>
                                <option>05</option>
                                <option>06</option>
                                <option>07</option>
                                <option>08</option>
                                <option>09</option>
                                <option>10</option>
                                <option>11</option>
                                <option>12</option>
                                <option>13</option>
                                <option>14</option>
                                <option>15</option>
                                <option>16</option>
                                <option>17</option>
                                <option>18</option>
                                <option>19</option>
                                <option>20</option>
                                <option>21</option>
                                <option>22</option>
                                <option>23</option>
                                <option>24</option>
                                <option>25</option>
                                <option>26</option>
                                <option>27</option>
                                <option>28</option>
                                <option>29</option>
                                <option>30</option>
                                <option>31</option>
                            </select>일
                            <select name = "_pickuphour" value = "09">
                                <option>09</option>
                                <option>10</option>
                                <option>11</option>
                                <option>12</option>
                                <option>13</option>
                                <option>14</option>
                                <option>15</option>
                                <option>16</option>
                                <option>17</option>
                                <option>18</option>
                                <option>19</option>
                                <option>20</option>
                                <option>21</option>
                            </select>시
                            <select name = "_pickupminute" value = "00">
                                <option>00</option>
                                <option>30</option>
                            </select>분
                        </div>
                        </div>
                    </div>
                    <div class="check_container">
                        <p  style="text-align: left;">Product_Info</p>
                        <table class="cart__list">
                                <thead>
                                    <tr>
                                        <td>상품정보</td>
                                        <td>금액</td>
                                        <td>수량</td>
                                        <td>결제금액</td>
                                    </tr>
                                </thead>
                                <tbody>
<%
	String[] checked = request.getParameterValues("category");	//cartid
	String checkedID = new String();
	String breadID = request.getParameter("_breadID");
	
	 try {      
         Class.forName("com.mysql.jdbc.Driver");
         Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/teampj","root","1234");
         Statement stmt = conn.createStatement();
         
         if(checked == null){
  			String sql = "select * from breadinfo where breadID = "+breadID+"";
          }
        
         for(int i = 0; i < checked.length; i++){
        	
         	String sql = "select * from cart, breadinfo where cart.breadID = breadinfo.breadID and cart.cartID = '"+checked[i]+"'";
         	ResultSet rs = stmt.executeQuery(sql);
         	 
         while(rs.next()){
        	 String breadID2 = rs.getString("breadID");
        	 String cartID = rs.getString("cartID");
        	 String breadname = rs.getString("breadname");
        	 int price = Integer.parseInt(rs.getString("price"));
        	 int count = Integer.parseInt(rs.getString("count"));
%>
                                    <tr class="cart_list_detail">
                                        <td>
                                        <input type = "hidden" value = <%= breadID2%> name = "_breadID">
                                            <p><%= breadname %></p>
                                        </td>
                                        <td><%= price%></td>
                                        <td class="cart_list_option">
                                            <input type = "number" class="cart_list_optionbtn" value=<%= count %> style = "text-align: right" disabled/>
                                        <input type = "hidden" name = "_count" value = <%= count %>>
                                        </td>
                                        <td><p><%= price*count %></p></td>
                                        <input type = "hidden" name = "_productprice" value = <%= price*count %>>
                                    </tr>
     <%    }
         rs.close();
         }
         stmt.close();
	  	 conn.close();%>
	 	        
                                </tbody>
                        </table>
                        <div class = "price">
                            <h3>전체금액</h3>
                            <% int Productprice = Integer.parseInt(request.getParameter("Productprice")); %>
                            <input id="one" type="text" value="<%= Productprice %>" style="width:300px;font-size:20px;"disabled>
                            <input name = "_total" value="<%= Productprice %>" type = "hidden">
                        </div>
                        <%	
	 } catch (Exception e) {
	     e.printStackTrace();
	 }

     %>        
     
                        <div class = "lastbtn">
                            <input class="but" type="reset" value="취소하기" onclick="resetorder()">
                            <input class="but" type="submit" value="픽업예약하기" onclick="goorder()">
                        </div>
                    </div>
                    </div>
            </form>
                </article>
            </section>
        </main>
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
</body>
</html>