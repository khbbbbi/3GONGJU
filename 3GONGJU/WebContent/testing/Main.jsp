<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>메인</title>
	<link rel="stylesheet" href="Main.css" />
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
                <a href="Myinfo.jsp" class="link_text" style="color: darkslateblue">홍길동</a>님
                <a href="#" onclick="logout()" id = "logintf" class="link_text" style="color: darkslateblue">로그아웃</a>
                <a href="" class="link_text"><img src = "images/mybag.png" width="24" height="21"></a>
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
                                <li><a href="#" aria-label="subemnu">도넛</a></li>
                                <li><a href="#" aria-label="subemnu">빵</a></li>
                                <li><a href="#" aria-label="subemnu">쿠키</a></li>
                                <li><a href="#" aria-label="subemnu">케이크</a></li>
                                <li><a href="#" aria-label="subemnu">음료</a></li>
                            </ul>
                            </li>
                            <li><a href="#"><b>Store</b></a>
                            <ul id="sub-menu">
                                <li><a href="#" aria-label="subemnu">매장찾기</a></li>
                            </ul>
                            </li>
                            </li>
                            <li><a href="#"><b>Mypage</b></a>
                            <ul id="sub-menu">
                                <li><a href="Orderlist.jsp" aria-label="subemnu">주문내역</a></li>
                                <li><a href="#" aria-label="subemnu">장바구니</a></li>
                                <li><a href="Myinfo.jsp" aria-label="subemnu">내정보</a></li>
                            </ul>
                            </li>
                        </ul>
                    </nav>
                </div>
        </div>
    </header>
    <div class = "area_all">
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
                            <tr height = "60px"><td><button>빵</button></td></tr>
                        </table>
                    </div>
                    <div class = "item">
                        <table>
                            <tr><td><img src ="images/BreadLogo.png" width="100px" height="100px"></td></tr>
                            <tr height = "60px"><td><button>쿠키</button></td></tr>
                        </table>
                    </div>
                    <div class = "item">
                        <table>
                            <tr><td><img src ="images/BreadLogo.png" width="100px" height="100px"></td></tr>
                            <tr height = "60px"><td><button>케이크</button></td></tr>
                        </table>
                    </div>
                    <div class = "item">
                        <table>
                            <tr><td><img src ="images/BreadLogo.png" width="100px" height="100px"></td></tr>
                            <tr height = "60px"><td><button>음료</button></td></tr>
                        </table>
                    </div>
                </article>
                <h1 style="text-align: center; font-size: 30px; text-decoration: overline;">STORE</h1>
                <article class="second_container">
                    <div class = "item2">매장찾기</div>
                    <div class = "item2">SNS</div>
                    <div class = "item2">My</div>
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