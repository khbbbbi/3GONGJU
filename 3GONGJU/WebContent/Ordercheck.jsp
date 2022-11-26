<!-- 현희 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
<!-- 예약확인화면 (주문하기 누르면 주문한 목록이 뜨는 화면) -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문확인</title>
    <link rel="stylesheet" href="css/Ordercheck.css" />
</head>
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
                <h1 style="text-align: center; font-size: 30px;text-decoration: overline;">예약 확인</h1>
                <p style="text-align: center;">예약 해주셔서 감사합니다^^</p>
                <article class="check_container">
                    <table rules="rows" class="cart__list" >
                    <form>
					<%
					
						request.setCharacterEncoding("UTF-8");
	
						//※추후주석제거		이전화면에서 오더아이디를 받아야함 추후 주석제거
						//String getOrderID = request.getParameter("orderID");
						//※추후주석	테스트용으로 임시 주문번호 선언, 1이라 가칭			
					   	String getOrderID = "1";
						
						try{
							
							System.out.println("====데이터베이스 연결시작 ====");
							// JDBC 참조 변수 준비
							// 1) JDBC 드라이버 로딩
							Class.forName("com.mysql.jdbc.Driver");
							
							// 2) 데이터베이스 연결
							Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/teampj","root","1234");
							Statement stmt = conn.createStatement();

						 	// 2) SQL문 실행 , 주문번호 기준으로 정보를 조회한다.
    					   	String sql = "select * from orders where orderID = "+getOrderID;
							// 4) 실행
						   	ResultSet rs = stmt.executeQuery(sql);
				
							// 5) 결과를 테이블에 출력
							if(rs.next()) {
								String pickupstore = rs.getString("pickupstore");	//매장명
								String pickupDate = rs.getString("pickupDate");		//주문일
								int tatalprice = rs.getInt("tatalprice");		//주문금액
						%>
                            <tr>
                                <td width = "40%">
                                    <p class = "thead">픽업지점</p>
                                </td>
                                <td>
                                	<p><%=pickupstore%><p>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p class = "thead">픽업일</p>
                                </td>
                                <td>
                                	<p><%=pickupDate%><p>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p class = "thead">결제 금액</p>
                                </td>
                                <td>
                                	<p><%=tatalprice%><p>
                                </td>
                            </tr>
						<%
							}
							// 6) 데이터베이스 연결 종료
			            	rs.close();
			            	stmt.close();
			            	conn.close();
			            	
							System.out.println("====데이터베이스 연결종료 ====");
			            	
			             } catch (Exception e) {
			                e.printStackTrace();
							System.out.println("====데이터베이스 오류발생 ====");
			             }
					%>
                    </form>
                </table>
                        <div class="cart_mainbtns">
                            <button class="cart_bigorderbtn left" onclick = "location.href='Menu.jsp'">쇼핑하러가기</button>
                            <button class="cart_bigorderbtn right" onclick = "location.href='Orderlist.jsp'">주문 내역</button>
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