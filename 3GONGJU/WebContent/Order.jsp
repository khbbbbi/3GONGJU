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
        	location.href="Menu.jsp";
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
	
	function goorder(){
		if (confirm('주문을 확정하시겠어요?')) {
        	// 네!
        	location.href="Ordercheck.jsp";
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
                    <a href="Main.jsp"><img src = "images/starbucks.png" width="80" height="75"></a>
                </div>
                <!-- 네비바 -->
                <div class = "nav">
                    <nav class = "navbar">
                        <ul id="main-menu">
                            <li><a href="#"><b>Menu</b></a>
                            <ul id="sub-menu">
                                <li><a href="Menu.jsp" >전체</a></li>
                                <li><a href="Menu.jsp" aria-label="subemnu">도넛</a></li>
                                <li><a href="Menu.jsp" aria-label="subemnu">빵</a></li>
                                <li><a href="Menu.jsp" aria-label="subemnu">쿠키</a></li>
                                <li><a href="Menu.jsp" aria-label="subemnu">케이크</a></li>
                                <li><a href="Menu.jsp" aria-label="subemnu">음료</a></li>     
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
                        </ul>
                    </nav>
                </div>
        </div>
    </header>
    <div class = "area_all">
        <main>
            <section class = "area_main">
                <h1 style="text-align: center; font-size: 30px;text-decoration: overline;">픽업 예약하기</h1>
                <article class="container">
                    <div class = "date">
                        <p style="text-align: left;">Pickup_Info</p>
                        <div class = "date_grid">
                            <p><img src="./images/place.png" width="25" height="20">픽업지점 </p>
                            <div class = "item">
                            <select id="pickup_spot">
                                <option>인천점</option>
                                <option>수원점</option>
                                <option>일산점</option>
                            </select>
                            </div>
                        <p><img src="./images/Cal.png" width="30" height="20">픽업일</p>
                        <div class = "item">
                            <p style="font-size: 8px;">&#x261D; 시간을 정확히 입력해주세요 &#x261D;</p>
                            <select>
                                <option>01월</option>
                                <option>02월</option>
                                <option>03월</option>
                                <option>04월</option>
                                <option>05월</option>
                                <option>06월</option>
                                <option>07월</option>
                                <option>08월</option>
                                <option>09월</option>
                                <option>10월</option>
                                <option>11월</option>
                                <option>12월</option>
                            </select>
    
                            <select>
                                <option>01일</option>
                                <option>02일</option>
                                <option>03일</option>
                                <option>04일</option>
                                <option>05일</option>
                                <option>06일</option>
                                <option>07일</option>
                                <option>08일</option>
                                <option>09일</option>
                                <option>10일</option>
                                <option>11일</option>
                                <option>12일</option>
                                <option>13일</option>
                                <option>14일</option>
                                <option>15일</option>
                                <option>16일</option>
                                <option>17일</option>
                                <option>18일</option>
                                <option>19일</option>
                                <option>20일</option>
                                <option>21일</option>
                                <option>22일</option>
                                <option>23일</option>
                                <option>24일</option>
                                <option>25일</option>
                                <option>26일</option>
                                <option>27일</option>
                                <option>28일</option>
                                <option>29일</option>
                                <option>30일</option>
                                <option>31일</option>
                            </select>
                            <select>
                                <option>01시</option>
                                <option>02시</option>
                                <option>03시</option>
                                <option>04시</option>
                                <option>05시</option>
                                <option>06시</option>
                                <option>07시</option>
                                <option>08시</option>
                                <option>09시</option>
                                <option>10시</option>
                                <option>11시</option>
                                <option>12시</option>
                                <option>13시</option>
                                <option>14시</option>
                                <option>15시</option>
                                <option>16시</option>
                                <option>17시</option>
                                <option>18시</option>
                                <option>19시</option>
                                <option>20시</option>
                                <option>21시</option>
                                <option>22시</option>
                                <option>23시</option>
                                <option>24시</option>
                            </select>
                            <select>
                                <option>00분</option>
                                <option>30분</option>
                            </select>
                        </div>
                        </div>
                    </div>
                    <div class="check_container">
                        <p  style="text-align: left;">Product_Info</p>
                        <table class="cart__list">
                            <form>
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
	
	 try {      
         Class.forName("com.mysql.jdbc.Driver");
         Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/teampj","root","1234");
         Statement stmt = conn.createStatement();

         for(int i = 0; i < checked.length; i++){
         	String sql = "select * from cart, breadinfo where cart.breadID = breadinfo.breadID and cart.cartID = '"+checked[i]+"'";
         	ResultSet rs = stmt.executeQuery(sql);
        	 
         while(rs.next()){
        	 String cartID = rs.getString("cartID");
        	 String breadname = rs.getString("breadname");
        	 int price = Integer.parseInt(rs.getString("price"));
        	 int count = Integer.parseInt(rs.getString("count"));
%>
                        
                                    <tr class="cart_list_detail">
                                        <td>
                                            <p><%= breadname %></p>
                                        </td>
                                        <td><%= price%></td>
                                        <td class="cart_list_option">
                                            <input type = "number" class="cart_list_optionbtn" value=<%= count %> style = "text-align: right" disabled/>
                                        </td>
                                        <td><p><%= price*count %></p></td>
                                        <input type = "hidden" id = "total" value = <%= price*count %>>
                                    </tr>
     <%    }
         rs.close();
         }
         stmt.close();
	  	 conn.close();%>
	 	        
                                </tbody>
                            </form>     
                        </table>
                        <div class = "price">
                            <h3>전체금액</h3>
                            <% int Productprice = Integer.parseInt(request.getParameter("Productprice")); %>
                            <input id="one" type="text" value="<%= Productprice %>" style="width:300px;font-size:20px;"disabled>
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