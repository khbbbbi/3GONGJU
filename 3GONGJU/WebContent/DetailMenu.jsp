<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!-- 예약확인화면 (주문하기 누르면 주문한 목록이 뜨는 화면) -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="EUC-KR">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상세 메뉴</title>
    <link rel="stylesheet" href="css/DetailMenu.css" />
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
		if (confirm('주문하러 가시겠어요?')) {
        	// 네!
        	location.href="Order.jsp";
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
                <a href="Cart.jsp" class="link_text"><img src = "images/mybag.png" width="24" height="21"></a>
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
    <form action = "menuinfocheck.jsp" method = "post">
    <div class = "area_all">
            <section class = "area_main">
                <article class="container">
  <%
	request.setCharacterEncoding("UTF-8");

	String breadID = request.getParameter("_breadID");

      try {      
         Class.forName("com.mysql.jdbc.Driver");
         Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/teampj","root","1234");
         Statement stmt = conn.createStatement();

         String sql = "select * from breadinfo where breadID='"+breadID+"'";
         ResultSet rs = stmt.executeQuery(sql);

         while(rs.next()){
        	 String category = rs.getString("category");
        	 String breadname = rs.getString("breadname");
        	 String price = rs.getString("price");
        	 String kcal = rs.getString("kcal");
        	 String sugar = rs.getString("sugar");
        	 String fats = rs.getString("fats");
        	 String protein = rs.getString("protein");
        	 %>
         		<input type = "hidden" name = "_breadID" value = <%= rs.getString("breadID") %>>
         		<p>Menu > <%= category %></p>
                    <h1 style="font-size: 30px;"><%= breadname %></h1>
                    <div class = "menu">
                    <div class="menuimg">
                        <img src="images/greentea.png">
                    </div>
                    <div class="menulist">
                        <table class="menutable">
                            <tr>
                            <td class="price"><b><%= price %></b></td>
                                <td><input type="number" placeholder="1" class="menunumber" name = "_surrang"></td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <table class="menuinfo">
                                        <tr>
                                            <td colspan="4">제품 영양 정보 (100g)</td>
                                        </tr>
                                        <tr>
                                            <td>1회제공량(kal)</td>
                                            <td><%= kcal %></td>
                                            <td>당류(g)</td>
                                            <td><%= sugar %></td>
                                        </tr> 
                                        <tr>
                                            <td>포화지방(g)</td>
                                            <td><%=fats %></td>
                                            <td>단백질(g)</td>
                                            <td><%= protein%></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class = "menubtn">
                                	<!-- <button onclick="incart()">장바구니에 담기</button>
                                    <button onclick="goorder()">주문하기</button> -->
                                    <input type = "submit" value = "장바구니에 담기" style=" width: 240px; height: 50px; border-radius: 20px;"onclick="">
                                    <input type = "submit" value = "주문하기" style=" width: 240px; height: 50px; border-radius: 20px;">
                                </td>
 
                            </tr>
                        </table>
                        
                    </div>
                </div>
                </article>
            </section>  
		</div>
		</form>
<%
          }
  		rs.close();
  		stmt.close();
  		conn.close();
 		
       } catch (Exception e) {
          e.printStackTrace();
       }
    %>
                     
                                
        <footer>
            <p>Company/CEO : SMC INTERNATIONAL CO., LTD. / Minchang Shin, Hanna Choi<br>
            Address : 321, Eonju-ro, Gangnam-gu, Seoul, Republic of Korea [Zip Code: 06226]<br>
            Customer Service : 1644 - 2927<br>
            Registration Number : 719 - 86 - 00092<br></p>
            <div class = "endline">
            <p>TM & Copyright 2022 로고. All Rights Reserved.</p> 
            </div>
        </footer>
</body>
</html>