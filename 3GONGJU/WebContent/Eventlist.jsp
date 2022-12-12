<!-- 이벤트리스트 -->
<!-- 한비 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
<!-- 예약확인화면 (주문하기 누르면 주문한 목록이 뜨는 화면) -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문내역</title>
    <link rel="stylesheet" href="css/Eventlist.css" />
</head>
<body>
    <header>
        <!-- 상단에 이름, 로그아웃, 장바구니 -->
        <div class = "area_header">
            <div class = "gita">
                <% 
            	String state = (String)session.getAttribute("__ID");
            	%>
                	<a href="Myinfo.jsp" class="link_text" style="color: darkslateblue"><%= state %></a>님
                	<a href="Logout.jsp" onclick="logout()" id = "logintf" class="link_text" style="color: darkslateblue">로그아웃</a>            		
                	<a href="Cart.jsp" class="link_text"><img src = "images/mybag.png" width="24" height="21"></a>
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
            <div class = "jemoc">
                <h2 style="text-align: center;">이벤트</h2>
            </div>
                <article class="check_container">
                    <table class="cart__list">
                        <thead>
                            <tr>
                            	<td width=10% >번호</td>
                            	<td width=70% >제목</td>
                                <td width=20% >기간</td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="cart_list_detail">
                            	<td>3</td>
								<td style = "font-size: 18px"><a href = "Event1.jsp">x-mas 쿠폰 왔다!</a></td>
								<td style = "font-size: 15px">2022.12.25</td>
                            </tr>
                            <tr class="cart_list_detail">
                            	<td>2</td>
								<td style = "font-size: 18px"><a href = "Event2.jsp">크리스마스 선물 이벤트</a></td>
								<td style = "font-size: 15px">2022.12.15~2022.12.24</td>
                            </tr>
                            <tr class="cart_list_detail">
                            	<td>1</td>
								<td style = "font-size: 18px"><a href = "Event3.jsp">2022 크리스마스 해시태그 Event</a></td>
								<td style = "font-size: 15px">2022.12.01~2022.12.30</td>
                            </tr>
                        </tbody>
                </table>
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