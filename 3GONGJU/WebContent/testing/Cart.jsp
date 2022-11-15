<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>장바구니</title>
    <link rel="stylesheet" href="Cart.css" />
</head>
<body>
    <header>
        <!-- 상단에 이름, 로그아웃, 장바구니 -->
        <div class = "area_header">
            <div class = "gita">
                <a href="Myinfo.jsp" id = "_name" class="link_text" style="color: darkslateblue">홍길동</a>님
                <a href="#" onclick="logout()" id = "logintf" class="link_text" style="color: darkslateblue">로그아웃</a>
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
            <section class = "area_main">
                <article class="cart">
                        <ul>
                            <li>* 장바구니 상품은 최대 30일간 저장됩니다.</li>
                            <li>가격, 옵션 등 정보가 변경된 경우 주문이 불가할 수 있습니다.</li>
                            <li>오늘출발 상품은 판매자 설정 시점에 따라 오늘출발 여부가 변경될 수 있으니 주문 시 꼭 다시 확인해 주시기 바랍니다.</li>
                        </ul>
                </article>
                <article id="sec2">
                        <table class="cart__list">
                        <form>
                            <thead>
                                <tr>
                                    <td></td>
                                    <td colspan="2">상품정보</td>
                                    <td>옵션</td>
                                    <td>상품금액</td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="cart_list_detail">
                                    <td><input type="checkbox"></td>
                                    <td><img src="./images/딸기라떼.png" alt="magic keyboard" width="50" height="50"></td>
                                    <td><span class="cart_list_3GongJu">3GongJu</span>
                                        <p>딸기라떼</p>
                                        <sapn class="price">3,500원</sapn>
                                    </td>
                                    <td class="cart_list_option">
                                        <p>상품명 : 딸기라떼</p>
                                        <!-- <button class="cart_list_optionbtn">주문조건 추가/변경</button> -->
                                        <input type = "number" class="cart_list_optionbtn" value="2">
                                    </td>
                                    <td><span class="price">7,000원</span>
                                    </td>
                                </tr>
                                

            
                                <tr class="cart_list_detail">
                                    <td style="width: 2%;"><input type="checkbox"></td>
                                    <td style="width: 13%;">
                                        <img src="./images/녹차라떼.png" alt="녹차라떼" width="50" height="50">
                                    </td>
                                    <td></a><span class="cart_list_3GongJu">3GongJu</span>
                                        <p>녹차라떼</p>
                                        <span class=" price">3,500원</span>
                                    </td>
                                    <td class="cart_list_option" style="width: 27%;">
                                        <p>상품명 : 녹차라떼</p>
                                        <input type = "number" class="cart_list_optionbtn" value="1">
                                    </td>
                                    <td style="width: 15%;"><span class="price">3,500원</span>
                                    </td>
                                </tr>
                            </tbody>
            
            
            
            
                            <tfoot>
                                <tr>
                                    <td colspan="3"><input type="checkbox"> 
                                        <button class="cart_list_optionbtn">선택상품 삭제</button>
                                    </td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                            </tfoot>
                        </form>
                    </table>
   
                    <div class="cart_mainbtns">
                        <button class="cart_bigorderbtn left">쇼핑 계속하기</button>
                        <button class="cart_bigorderbtn right">픽업예약하기</button>
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