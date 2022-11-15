<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="Main3.css" />
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
                                <li><a href="#" aria-label="subemnu">전체</a></li>
                                <li><a href="#" aria-label="subemnu">도넛</a></li>
                                <li><a href="#" aria-label="subemnu">페스츄리&파이</a></li>
                                <li><a href="#" aria-label="subemnu">스낵</a></li>
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
                <h1 style="text-align: center; font-size: 30px;text-decoration: overline;">MENU</h1>
                <article class="menu_container">
                    <div class = "item">
                        <table>
                            <tr><td><img src ="images/BreadLogo.png" width="100px" height="100px"></td></tr>
                            <tr height = "60px"><td><button>전체</button></td></tr>
                        </table>
                    </div>
                    <div class = "item">
                        <table>
                            <tr><td><img src ="images/BreadLogo.png" width="100px" height="100px"></td></tr>
                            <tr height = "60px"><td><button>도넛</button></td></tr>
                        </table>
                    </div>
                    <div class = "item">
                        <table>
                            <tr><td><img src ="images/BreadLogo.png" width="100px" height="100px"></td></tr>
                            <tr height = "60px"><td><button>페스츄리&파이</button></td></tr>
                        </table>
                    </div>
                    <div class = "item">
                        <table>
                            <tr><td><img src ="images/BreadLogo.png" width="100px" height="100px"></td></tr>
                            <tr height = "60px"><td><button>식사용빵</button></td></tr>
                        </table>
                    </div>
                    <div class = "item">
                        <table>
                            <tr><td><img src ="images/BreadLogo.png" width="100px" height="100px"></td></tr>
                            <tr height = "60px"><td><button>스낵</button></td></tr>
                        </table>
                    </div>
                </article>
                <!--<h1 style="text-align: center; font-size: 30px; text-decoration: overline;">STORE</h1>
                <article class="second_container">
                    <div class = "item2">매장찾기</div>
                    <div class = "item2">SNS</div>
                    <div class = "item2">My</div>
                </article>
                <-->
                <h1 style="text-align:center; font-size:30px; text-decoration: overline;">픽업예약</h1>
                
                <article class="second_container">
                    <div>
                        <h1>픽업지점 <img src="./images/place.png" width="25" height="20"></h1>
                        <select id="pickup_spot">
                            <option>인천점</option>
                            <option>수원점</option>
                            <option>일산점</option>
                        </select>
                    </div>
                    <div>
                        <h1>픽업일<img src="./images/Cal.png" width="30" height="20"></h1>
                        <p>&#x261D; 시간을 정확히 입력해주세요 &#x261D;</p>
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
                            <option>01분</option>
                            <option>02분</option>
                            <option>03분</option>
                            <option>04분</option> 
                            <option>05분</option>
                            <option>06분</option>
                            <option>07분</option>
                            <option>08분</option>
                            <option>09분</option>
                            <option>10분</option>
                            <option>11분</option>
                            <option>12분</option>
                            <option>13분</option> 
                            <option>14분</option>
                            <option>15분</option>
                            <option>16분</option>
                            <option>17분</option>
                            <option>18분</option>
                            <option>19분</option>
                            <option>20분</option>
                            <option>21분</option>
                            <option>22분</option> 
                            <option>23분</option>
                            <option>24분</option>
                            <option>25분</option>
                            <option>26분</option>
                            <option>27분</option>
                            <option>28분</option>
                            <option>29분</option>
                            <option>30분</option>
                            <option>31분</option> 
                            <option>32분</option>
                            <option>33분</option>
                            <option>34분</option>
                            <option>35분</option>
                            <option>36분</option>
                            <option>37분</option>
                            <option>38분</option>
                            <option>39분</option>
                            <option>40분</option> 
                            <option>41분</option>
                            <option>42분</option>
                            <option>43분</option>
                            <option>44분</option>
                            <option>45분</option>
                            <option>46분</option>
                            <option>47분</option>
                            <option>48분</option>
                            <option>49분</option> 
                            <option>50분</option>
                            <option>51분</option>
                            <option>52분</option>
                            <option>53분</option>
                            <option>54분</option>
                            <option>55분</option>
                            <option>56분</option>
                            <option>57분</option>
                            <option>58분</option> 
                            <option>59분</option>
                        </select>
                    </div>
                    <div>
                        <h1>전체금액</h1>
                        <input id="one" type="text"> <span style="font-weight:bold";>원</span><br>
                    </div>
                    <div>
                        <input class="but" type="reset" value="취소하기">
                        <input class="but" type="submit" value="픽업예약하기">
                        
                    </div>

                    </div>
                </article>
                
                <article>
                <div class = "area_snsmy">
                    <div class = "sns">
                        <h1 style="text-align: center; font-size: 30px; text-decoration: overline;">SNS</h1>
                        <div class = "sns_container">
                            <div class = "item2">
                                <table>
                                    <tr height="90px">
                                        <td><a href="https://www.instagram.com/">
                                            <img src ="images/instargram.png" width="70px" height="70px"></a></td>
                                    </tr>
                                    <tr><td>INSTARGRAM</td></tr>
                                </table>
                            </div>
                            <div class = "item2">
                                <table>
                                    <tr height="90px">
                                        <td><a href="https://www.youtube.com/">
                                            <img src ="images/youtube.png" width="70px" height="70px"></a></td>
                                    </tr>
                                    <tr><td>YOUTUBE</td></tr>
                                </table>
                            </div>
                            <div class = "item2">
                                <table>
                                    <tr height="90px">
                                        <td><a href="https://www.facebook.com/">
                                            <img src ="images/facebook.png" width="70px" height="70px"></a></td>
                                    </tr>
                                    <tr><td>FACEBOOK</td></tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class = "my">
                        <h1 style="text-align: center; font-size: 30px; text-decoration: overline;">MY</h1>
                        <div class = "my_container">
                            <div class = "gomy"><button style="width: 400px; height: 40px;">주문내역</button></div>
                            <div class = "gomy"><button style="width: 400px;height: 40px;">장바구니</button></div>
                            <div class = "gomy"><button style="width: 400px;height: 40px;">내정보</button></div>
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