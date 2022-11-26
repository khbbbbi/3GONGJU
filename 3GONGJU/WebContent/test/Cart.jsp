<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>장바구니</title>
    <link rel="stylesheet" href="Cart.css" />
</head>
<script language = "javascript">

	function order(){
        if (confirm('주문을 하러가시겠습니까?')) {
        	// 네!
        	location.href="Order.jsp";
        } else {
        	//아니오ㅡ.ㅡ
        	location.href="#";
        }
	}
	// 체크박스 중 하나라도 해제되면 전체선택 체크박스 체크해제
    function checkSelectAll()  {
        // 전체 체크박스
        const checkboxes = document.querySelectorAll('input[name="category"]');
        // 선택된 체크박스
        const checked = document.querySelectorAll('input[name="category"]:checked');
        // select all 체크박스
        const selectAll = document.querySelector('input[name="selectall"]');

        if(checkboxes.length === checked.length)  {
            selectAll.checked = true;
        }else {
            selectAll.checked = false;
        } 
    }
    //전체선택 체크박스 선택하면 나머지 체크박스 전체 선택 or 해제
    function selectAll(selectAll)  {
        const checkboxes = document.getElementsByName('category');
    	checkboxes.forEach(function(checkbox){checkbox.checked = selectAll.checked;})
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
                                    <td colspan="3">상품정보</td>
                                    <td>옵션</td>
                                    <td>상품금액</td>
                                </tr>
                            </thead>
                            <form action = "cartupdate.jsp" method = "post">
                            <tbody>
    	<%
    	//while(rs.next)가 반복되는 구간이니 반복할 구간에서 디비를 설정해야함! header밑에 넣었다가 안됐었음..주의!
		String breadID = request.getParameter("_breadID");
		String surrang = request.getParameter("_surrang");
		
		 try {      
	         Class.forName("com.mysql.jdbc.Driver");
	         Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/teampj","root","1234");
	         Statement stmt = conn.createStatement();
	         
			//cart,breadinfo,user 세개의 테이블을 외래키를 통해 연결시켜 세 테이블의 모든 정보 불러 올  수 있음. 조건문에  현재 로그인된 사용자의 장바구니정보를 가져올 수 있도록 userIdx를 받아온 userIdx와 비교
	         String sql = "select * from cart, breadinfo, user where cart.breadID = breadinfo.breadID and cart.userIdx = user.userIdx and user.userId = "+state+"";
	         ResultSet rs = stmt.executeQuery(sql);

	         while(rs.next()){
		        	String userId = rs.getString("userId");
		        	String breadname = rs.getString("breadname");
		        	//수량에 따른 상품가격을 측정하기위해 int로 받아옴.
		        	int  price = rs.getInt("price");
		        	int count = rs.getInt("count");

	     %>
                                <tr class="cart_list_detail">
                                    <td  style="width: 2%;"><input type="checkbox" name="category" onclick='checkSelectAll()'></td>
                                    <td  style="width: 13%;">
                                    	<img src="./images/딸기라떼.png" alt="magic keyboard" width="50" height="50">
                                    </td>
                                    <td>
                                    	<span class="cart_list_3GongJu">3GongJu</span>
                                        <p><%= breadname %></p>
                                        <input id = "breadname" type = "hidden" vaule = <%=breadname%>>
                                        <span id = "price"><%= price %></span>
                                    </td>
                                    <td class="cart_list_option">
                                        <p>상품명 : <%= breadname %></p>
                                        <input id = "count" type = "number" class="cart_list_optionbtn" value="<%= count %>">
                                    </td>
                                    <td>
                                    	<!-- int로 받아온 가격,수량을 곱해서 수량에 따른 상품가격 측정. 
                                    	여기서 문제...수량을 변경할때마다 결제금액을 바꾸고싶음...ㅜ
                                    	-->
                                    	<p id = "ddd" class="sangpumprice"><%= price*count %></p>
                                    </td>
                                </tr>
       <%
	         }
		  		rs.close();
		  		stmt.close();
		  		conn.close();
		 		
		       } catch (Exception e) {
		          e.printStackTrace();
		       }
	    %>
                            </tbody>
                            </form>
                            <tfoot>
                                <tr>
                                    <td colspan="5"><input type="checkbox" name = "selectall" onclick='selectAll(this)'> 
                                        <button class="cart_list_optionbtn" >선택상품 삭제</button>
                                    </td>
                                </tr>
                            </tfoot>
                        </form>
                    </table>
					<div class = "price">
                         <h3>전체금액</h3>
                         <input id="one" type="text" value="15000" style="width:300px;font-size:20px;"disabled>
                    </div>
                    <div class="cart_mainbtns">
                        <button class="cart_bigorderbtn left" onclick = "location.href='Menu.jsp'">쇼핑 계속하기</button>
                        <button class="cart_bigorderbtn right" onclick="order()">픽업예약하기</button>
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
        <script>

        </script>
</body>
</html>