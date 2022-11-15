<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 예약확인화면 (주문하기 누르면 주문한 목록이 뜨는 화면) -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문 완료 시 주문 확인</title>
    <link rel="stylesheet" href="Ordercheck.css" />
</head>
<body>
    <header>
        <!-- 상단에 이름, 로그아웃, 장바구니 -->
        <div class = "area_header">
            <div class = "gita">
                <a href="/" class="link_text">홍길동</a>님
                <a href="/" class="link_text">로그아웃</a>
                <a href="/" class="link_text"><img src = "images/mybag.png" width="24" height="21"></a>
            </div>
        
            <!-- 헤더에서 로고와 네비바 -->
                <!-- 로고 -->
                <div class = "logo">
                    <a href="/"><img src = "images/starbucks.png" width="80" height="75"></a>
                </div>
                <!-- 네비바 -->
                <div class = "nav">
                    <nav class = "navbar">
                        <ul id="main-menu">
                            <li><a href="#"><b>Menu</b></a>
                            <ul id="sub-menu">
                                <li><a href="#" >전체</a></li>
                                <li><a href="#" aria-label="subemnu">도넛</a></li>
                                <li><a href="#" aria-label="subemnu">빵</a></li>
                                <li><a href="#" aria-label="subemnu">쿠키</a></li>
                                <li><a href="#" aria-label="subemnu">케익</a></li>
                                <li><a href="#" aria-label="subemnu">음료</a></li>
                            </ul>
                            </li>
                            <li><a href="#"><b>Store</b></a>
                            <ul id="sub-menu">
                                <li><a href="#" aria-label="subemnu">매장찾기</a></li>
                            </ul>
                            </li>
                            <li><a href="#"><b>Community</b></a>
                            <ul id="sub-menu">
                                <li><a href="#" aria-label="subemnu">SNS</a></li>
                            </ul>
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
    <div class = "area_all">
        <main>
            <section class = "area_main">
                <h1 style="text-align: center; font-size: 30px;text-decoration: overline;">예약 확인</h1>
                <p style="text-align: center;">예약 해주셔서 감사합니다^^</p>
                <article class="check_container">
                    <div class = "check_th">
                        <div class = "item"><d>상품</d></div>
                        <div class = "item"><d>수량</d></div>
                        <div class = "item"><d>금액</d></div>
                        <div class = "item"><d>픽업일자</d></div>
                    </div>
                    <div class = "check_td">
                        <div class = "item_item">도넛</div>
                        <div class = "item_item">3</div>
                        <div class = "item_item">7500</div>
                        <div class = "item_item">2022.11.01 AM 10:00</div>
                    </div>
                    <div class = "check_td">
                        <div class = "item_item">도넛</div>
                        <div class = "item_item">3</div>
                        <div class = "item_item">7500</div>
                        <div class = "item_item">2022.11.01 AM 10:00</div>
                    </div>
                    <div class = "check_td">
                        <div class = "item_item">도넛</div>
                        <div class = "item_item">3</div>
                        <div class = "item_item">7500</div>
                        <div class = "item_item">2022.11.01 AM 10:00</div>
                    </div>

                    <button>주문 내역</button>
                    <button>메인</button>
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