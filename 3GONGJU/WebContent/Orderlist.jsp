<!-- 주문내역 -->
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
    <title>주문내역</title>
    <link rel="stylesheet" href="css/Orderlist.css" />
</head>
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
                <h1 style="text-align: center; font-size: 30px;text-decoration: overline;">주문 내역</h1>
                <article class="check_container">
                    <table class="cart__list">
                    <form>
                        <thead>
                            <tr>
                            	<td>주문일자</td>
                                <td>상품정보</td>
                                <td>수량</td>
                                <td>픽업지점</td>
                                <td>픽업일</td>
                                <td>결제금액</td>
                            </tr>
                        </thead>
                        <tbody>
			<%
						request.setCharacterEncoding("UTF-8");
			
						//※추후주석제거 회원정보세션에서 유저번호를 가져와야함
						//String getUserIdx = request.getParameter("userIdx");
						
						//※추후주석 테스트용으로 임시 주문번호 선언, 1이라 가칭			
					   	//String getUserIdx = "1";
						
						try{
							
							System.out.println("====데이터베이스 연결시작 ====");
							// JDBC 참조 변수 준비
							// 1) JDBC 드라이버 로딩
							Class.forName("com.mysql.jdbc.Driver");
							//Class.forName("oracle.jdbc.driver.OracleDriver");
							// 2) 데이터베이스 연결
							Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/teampj","root","1234");
							
							Statement stmt = conn.createStatement();
			
						 	// 2) SQL문 실행, 회원번호 기준으로 주문내역을 조회한다.
							/* String sql = "";
							sql += 	"	SELECT		"; 
							sql +=	"		orderID 	";
							sql +=	"		, ( SELECT MAX(breadname) FROM breadinfo WHERE o.breadID = breadID) AS breadname ";
							sql +=	"		, ( SELECT MAX(price) FROM breadinfo WHERE o.breadID = breadID) AS price ";
							sql +=	"		, pickupDate	 	";
							sql +=	"		, tatalprice 		";
							//sql += 	"		, count			";
							sql +=	"	FROM orders o 		";
							sql +=	"	WHERE userIdx = "+getUserIdx;
							sql += 	"	ORDER BY orderID desc";				//주문번호 내림차순 정렬 */
						 	
							//String sql = "select * from user, orders, breadinfo where user.userIdx = orders.userIdx and orders.breadID = breadinfo.breadID and user.userID = '"+state+"';";
							String sql = "select * from user, orders, breadinfo where user.userIdx = orders.userIdx and breadinfo.breadID = orders.breadID and user.userID = '"+state+"';";
							
							// 4) 실행
							ResultSet rs = stmt.executeQuery(sql);
				
							// 5) 결과를 테이블에 출력
							while (rs.next()) {
								String orderdate = rs.getString("orders.orderdate");			//주문일자
								String breadname = rs.getString("breadinfo.breadname");			//메뉴명
								String price = rs.getString("breadinfo.price");							//가격
								String count = rs.getString("orders.count");						//수량 불가능, orders 테이블에 수량컬럼이 추가되어야 가져올 수 있음
								String pickstore = rs.getString("orders.pickupstore");
								String pickupDate = rs.getString("orders.pickupDate");			//픽업일
								String tatalprice = rs.getString("orders.tatalprice");				//결제금액
						%>
                            <tr class="cart_list_detail">
								<td><%= orderdate %></td>
                                <td><span class="cart_list_3GongJu">3GongJu</span>
                                    <p><%=breadname%></p>
                                    <sapn class="price"><%=price%>원</sapn>
                                </td>
                                <td class="cart_list_option">
                                    <input value = <%= count %> type = "number" class="cart_list_optionbtn" value="0" style = "text-align: right" disabled/>
                                </td>
                                 <td><%=pickstore%></td>
                                 <td><%=pickupDate%></td>
                                <td><span class="price"><%=tatalprice%>원</span>
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
                        </tbody>
                    </form>
                </table>
                        <div class="cart_mainbtns">
                            <button class="cart_bigorderbtn right" onclick = "location.href='Menu.jsp'">쇼핑하러가기</button>
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