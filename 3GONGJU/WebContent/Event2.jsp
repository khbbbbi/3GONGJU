<!-- 이벤트 상세 : 크리스마스 2022 -->
<!-- 한비 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
    <%@ page import="java.io.PrintWriter" %>
<!-- 메뉴 -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="EUC-KR">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메뉴</title>
    <link rel="stylesheet" href="css/Event.css" />
</head>
<script language = "javascript">
   /* 로그아웃 화면 */
   function logout(){
        if (confirm('정말 로그아웃하시겠습니까?')) {
           // 네!
           location.href="Login.jsp";
        } else {
           //아니오ㅡ.ㅡ
           location.href="#";
        }
   }
   function selectAll(selectAll)  {
	   location.href="MenuAction.jsp?catagory=";
      /* 
      위에꺼랑 이거랑 똑같은데 vscode에서는 =>가 먹고 이클립스에선 =>가 안됨. 이유 모름.
      checkboxes.forEach( (checkbox) => {checkbox.checked = selectAll.checked; } ) 
      */
   }
</script>
<body>
    <header>
        <!-- 상단에 이름, 로그아웃, 장바구니 -->
        <div class = "area_header">
            <div class = "gita">
            <% 
            	String state = (String)session.getAttribute("__ID");
            	if(state ==null){%>
            		<a href="Login.jsp" class="link_text" style="color: darkslateblue">로그인해주세요</a>
            	<%}else{%>
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
            <section class = "container">
                <article class = "item">
                    <div class = "top_menu2">
                        <h2 class="li_gap">이벤트 </h2>
                        <p>2022 크리스마스 이벤트</p>
                    </div>
                </article>
                    <form action="MenuAction.jsp" method="post">
                <p></p>
                <article>
                    <div id ="sec3">
               				<img src="images/pop1.jpg" style = "margin-bottom: 50px;  width:100%;">
               				<p style ="font-size: 20px; text-align: center">[3GONGJU에서 구매하고 선물받자!]</p>
               				<br>
               				<p style ="font-size: 14px; text-align: center">크리스마스가 다가와 준비한 선물이벤트!</p>
               				<p style ="font-size: 14px; text-align: center"
               				>삼공주에서 여러분께 크리스마스 선물을 드려요! <br> 픽업예약을 해주신 고객님들 중</p> 
               				<p style ="font-size: 20px; text-align: center; font-weight: bold;">랜덤 추첨을 통해 푸짐한 선물을 드립니다!</p>
               				<p style ="font-size: 14px; text-align: center; ">이벤트 당첨자는 
							인스타그램 @3GONGJU's bakery / 공식 홈페이지 '3GONGJU'
							에 업데이트 됩니다.</p><br>
							<p  style ="font-size: 20px; text-align: center; margin-bottom: 50px;">2022.12.15~2022.12.24</p>
							<div class = "btn">
							<input type = "button" value = "목록으로" onclick="location.href='Eventlist.jsp'">
							</div>
                    </div>
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
</body>
</html>