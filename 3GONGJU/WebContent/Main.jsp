
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>메인</title>
	<link rel="stylesheet" href="css/Main.css" />
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
<jsp:include page="popup.jsp"/>
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
    <aside class = "aside1"><a href = "Event3.jsp"><img src ="images/guanggo.png" width="100%" height="100%"></a></aside>
    <div class = "area_all">
            <section class = "area_main">
            	<article>
            		<img src ="images/img1.png" width="100%" height="100%">
            	</article>
            	<div class = "top_menu2">
                        <h2 class="li_gap">Menu </h2>
                </div>
                <article class="area_top">
                    <div class = "area_intext">
       				<h2>Cookie&pie</h2>
       				</div>
                <div class = "area_inmenu">
                    <%
		 try {     
	         Class.forName("com.mysql.jdbc.Driver");
	         Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/teampj","root","1234");
	         Statement stmt = conn.createStatement();
	         
			//cart,breadinfo,user 세개의 테이블을 외래키를 통해 연결시켜 세 테이블의 모든 정보 불러 올  수 있음. 조건문에  현재 로그인된 사용자의 장바구니정보를 가져올 수 있도록 userIdx를 받아온 userIdx와 비교
	         String sql = "select * from breadinfo where category = 'cookie' limit 5";
	         ResultSet rs = stmt.executeQuery(sql);

	         while(rs.next()){
	        	 	String imgsrc = rs.getString("imgsrc");
		        	String breadname = rs.getString("breadname");
	     %>
           			<div class = "item">
                            <img src ="<%= imgsrc %>" width="80px" height="80px">
                            <p style= " font-size: 12px;"><%= breadname %></p>
                    </div>
         <%
	         }
		  		rs.close();
		  		stmt.close();
		  		conn.close();
		 		
		       } catch (Exception e) {
		          e.printStackTrace();
		       }
	    %>          <div class = "gume">
	    				<a href="Menu.jsp?cate_=cookie"><img src ="images/next.png" width="50px" height="50px"></a>
	    			</div>
	    			</div>
                </article>
                <article class="area">
                    <div class = "area_intext">
       				<h2>Cake</h2>
       				</div>
                <div class = "area_inmenu">
                    <%
		 try {     
	         Class.forName("com.mysql.jdbc.Driver");
	         Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/teampj","root","1234");
	         Statement stmt = conn.createStatement();
	         
			//cart,breadinfo,user 세개의 테이블을 외래키를 통해 연결시켜 세 테이블의 모든 정보 불러 올  수 있음. 조건문에  현재 로그인된 사용자의 장바구니정보를 가져올 수 있도록 userIdx를 받아온 userIdx와 비교
	         String sql = "select * from breadinfo where category = 'cake' limit 5";
	         ResultSet rs = stmt.executeQuery(sql);

	         while(rs.next()){
	        	 	String imgsrc = rs.getString("imgsrc");
		        	String breadname = rs.getString("breadname");
	     %>
           			<div class = "item">
                            <img src ="<%= imgsrc %>" width="80px" height="80px">
                            <p style= " font-size: 12px;"><%= breadname %></p>
                    </div>
         <%
	         }
		  		rs.close();
		  		stmt.close();
		  		conn.close();
		 		
		       } catch (Exception e) {
		          e.printStackTrace();
		       }
	    %>          <div class = "gume">
	    				<a href="Menu.jsp?cate_=cake"><img src ="images/next.png" width="50px" height="50px"></a>
	    			</div>
	    			</div>

                </article>
                <article class="area">
                    <div class = "area_intext">
       				<h2>Bakery</h2>
       				</div>
                <div class = "area_inmenu">
                    <%
		 try {     
	         Class.forName("com.mysql.jdbc.Driver");
	         Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/teampj","root","1234");
	         Statement stmt = conn.createStatement();
	         
			//cart,breadinfo,user 세개의 테이블을 외래키를 통해 연결시켜 세 테이블의 모든 정보 불러 올  수 있음. 조건문에  현재 로그인된 사용자의 장바구니정보를 가져올 수 있도록 userIdx를 받아온 userIdx와 비교
	         String sql = "select * from breadinfo where category = 'bakery' limit 5";
	         ResultSet rs = stmt.executeQuery(sql);

	         while(rs.next()){
	        	 	String imgsrc = rs.getString("imgsrc");
		        	String breadname = rs.getString("breadname");
	     %>
           			<div class = "item">
                            <img src ="<%= imgsrc %>" width="80px" height="80px">
                            <p style= " font-size: 12px;"><%= breadname %></p>
                    </div>
         <%
	         }
		  		rs.close();
		  		stmt.close();
		  		conn.close();
		 		
		       } catch (Exception e) {
		          e.printStackTrace();
		       }
	    %>          <div class = "gume">
	    				<a href="Menu.jsp?cate_=bakery"><img src ="images/next.png" width="50px" height="50px"></a>
	    			</div>
	    			</div>

                </article>
                <article class="area">
                    <div class = "area_intext_m">
       				<h2>Macaroon<br>&<br>Omelet</h2>
       				</div>
                <div class = "area_inmenu">
                    <%
		 try {     
	         Class.forName("com.mysql.jdbc.Driver");
	         Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/teampj","root","1234");
	         Statement stmt = conn.createStatement();
	         
			//cart,breadinfo,user 세개의 테이블을 외래키를 통해 연결시켜 세 테이블의 모든 정보 불러 올  수 있음. 조건문에  현재 로그인된 사용자의 장바구니정보를 가져올 수 있도록 userIdx를 받아온 userIdx와 비교
	         String sql = "select * from breadinfo where category = 'macaroon' limit 5";
	         ResultSet rs = stmt.executeQuery(sql);

	         while(rs.next()){
	        	 	String imgsrc = rs.getString("imgsrc");
		        	String breadname = rs.getString("breadname");
	     %>
           			<div class = "item">
                            <img src ="<%= imgsrc %>" width="80px" height="80px">
                            <p style= " font-size: 12px;"><%= breadname %></p>
                    </div>
         <%
	         }
		  		rs.close();
		  		stmt.close();
		  		conn.close();
		 		
		       } catch (Exception e) {
		          e.printStackTrace();
		       }
	    %>          <div class = "gume">
	    				<a href="Menu.jsp?cate_=macaroon"><img src ="images/next.png" width="50px" height="50px"></a>
	    			</div>
	    			</div>

                </article>
                <article class="area_bottom">
                    <div class = "area_intext">
       				<h2>Drink</h2>
       				</div>
                <div class = "area_inmenu">
                    <%
		 try {     
	         Class.forName("com.mysql.jdbc.Driver");
	         Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/teampj","root","1234");
	         Statement stmt = conn.createStatement();
	         
			//cart,breadinfo,user 세개의 테이블을 외래키를 통해 연결시켜 세 테이블의 모든 정보 불러 올  수 있음. 조건문에  현재 로그인된 사용자의 장바구니정보를 가져올 수 있도록 userIdx를 받아온 userIdx와 비교
	         String sql = "select * from breadinfo where category = 'drink' limit 5";
	         ResultSet rs = stmt.executeQuery(sql);

	         while(rs.next()){
	        	 	String imgsrc = rs.getString("imgsrc");
		        	String breadname = rs.getString("breadname");
	     %>
           			<div class = "item">
                            <img src ="<%= imgsrc %>" width="80px" height="80px">
                            <p style= " font-size: 12px;"><%= breadname %></p>
                    </div>
         <%
	         }
		  		rs.close();
		  		stmt.close();
		  		conn.close();
		 		
		       } catch (Exception e) {
		          e.printStackTrace();
		       }
	    %>          <div class = "gume">
	    				<a href="Menu.jsp?cate_=drink"><img src ="images/next.png" width="50px" height="50px"></a>
	    			</div>
	    			</div>

                </article>
                <div class = "top_menu2">
                        <h2 class="li_gap">Store</h2>
                </div>
                <article class="second_container">
                	<div>
                		<br>
	                   	<p>매장별 위치를 확인하여 <br>고객님과 가장 가까운 매장을 찾아보세요!</p>
                		<button onclick="location.href='Map.jsp'">매장찾기</button>
                	</div>
                </article>
                <article>
                <div class = "area_snsmy">
                    <div class = "sns">
                        <h2 class = "top_menu2" >SNS</h2>
                        <div class = "sns_container">
                            <div class = "item3">
                                <table>
                                    <tr height="90px">
                                        <td><a href="https://www.instagram.com/">
                                            <img src ="images/instargram.png" width="70px" height="70px"></a></td>
                                    </tr>
                                    <tr><td>INSTARGRAM</td></tr>
                                </table>
                            </div>
                            <div class = "item3">
                                <table>
                                    <tr height="90px">
                                        <td><a href="https://www.youtube.com/">
                                            <img src ="images/youtube.png" width="70px" height="70px"></a></td>
                                    </tr>
                                    <tr><td>YOUTUBE</td></tr>
                                </table>
                            </div>
                            <div class = "item3">
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
                        <h2 class = "top_menu2" >MY</h2>
                        <div class = "my_container">
                            <div class = "gomy"><button onclick="location.href='Orderlist.jsp'" style="width: 400px; height: 40px;">주문내역</button></div>
                            <div class = "gomy"><button onclick="location.href='Cart.jsp'" style="width: 400px;height: 40px;">장바구니</button></div>
                            <div class = "gomy"><button onclick="location.href='Myinfo.jsp'" style="width: 400px;height: 40px;">내정보</button></div>
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
            <p>TM & Copyright 2022 3GONGJU. All Rights Reserved.</p> 
            </div>
        </footer>
        </div>

</body>
</html>