<!-- 로그인 -->
<!-- 한비 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="EUC-KR">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link rel="stylesheet" href="css/Login.css" />
</head>
<script language = "javascript">
	function logout(){
        if (confirm('정말 로그아웃하시겠습니까?')) {
        	// 네!
        	location.href="Login.jsp";
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
                                <li><a href="Menu.jsp" aria-label="subemnu">쿠키&파이</a></li>
                                <li><a href="Menu.jsp" aria-label="subemnu">케익</a></li>
                                <li><a href="Menu.jsp" aria-label="subemnu">베이커리</a></li>
                                <li><a href="Menu.jsp" aria-label="subemnu">마카롱&오믈렛</a></li>
                                <li><a href="Menu.jsp" aria-label="subemnu">음료</a></li>
                            </ul>
                            </li>
                            <li><a href="#"><b>Store</b></a>
                            <ul id="sub-menu">
                                <li><a href="Map.jsp" aria-label="subemnu">매장찾기</a></li>
                            </ul>
                            </li>
                            </li>
                            <li><a href="#"><b>Mypage</b></a>
                            <ul id="sub-menu">
                                <li><a href="#" aria-label="subemnu">주문내역</a></li>
                                <li><a href="#" aria-label="subemnu">장바구니</a></li>
                                <li><a href="#" aria-label="subemnu">내정보</a></li>
                            </ul>
                            </li>
                        </ul>
                    </nav>
                </div>
        </div>
    </header>
    <!-- 메인부분 -->
    <div class = "area_all">
            <section class = "area_main">
                <h1 style="text-align: center; font-size: 30px;text-decoration: overline;">Login</h1>
                <article class="menu_container">
                <form action = "Logincheck.jsp" method = "post">
                    <div class = "item">
                        <input type="text" style="width: 300px; height: 30px;" placeholder="아이디" 
                        name="_id" maxlength="20">
                        <input type="password" style="width: 300px; height: 30px;" placeholder="비밀번호" 
                        name="_pw" maxlength="20">
                        <input type="submit" value = "로그인" style="width: 310px; height: 40px;">
                        <p style="font-size: 12px;"><a href="Signup.jsp">회원가입</a></p>
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
</body>
</html>