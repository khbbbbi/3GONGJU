<!-- 헤더 홍길동님 누르면 홍길동이 Myinfo로 전달되며 페이지 이동 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!-- 메뉴 -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="EUC-KR">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메뉴</title>
    <link rel="stylesheet" href="css/Menu.css" />
</head>
<script language = "javascript">
	/* 로그아웃 화면 */
	function logout(){
        if (confirm('정말 로그아웃하시겠습니까?')) {
        	// 네!
        	location.href="Login.jsp";
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
            <section class = "container">
                <article class = "item">
                <div class = "item_img">
                <img src = "images/starbucks.png" width="100" height="100">
                </div>
    
                    <div class = "top_menu2">
                    <ul>
                        <li class="li_gap">
                            Order
                            <select style="width: 100px;">
                                <option>기본순</option>
                                <option>가격높은순</option>
                                <option>가격낮은순</option>
                            </select>
                        </li>
                        <li class="li_gap">|</li>
                        <li class="li_gap"><input type="checkbox" name="selectall" onclick='selectAll(this)'>전체</li>
                        <li class="li_gap">|</li>
                        <li class="li_gap"><input type="checkbox" name="category" onclick='checkSelectAll()'>도넛</li>
                        <li class="li_gap">|</li>
                        <li class="li_gap"><input type="checkbox" name="category" onclick='checkSelectAll()'>빵</li>
                        <li class="li_gap">|</li>
                        <li class="li_gap"><input type="checkbox" name="category" onclick='checkSelectAll()'>쿠키</li>
                        <li class="li_gap">|</li>
                        <li class="li_gap"><input type="checkbox" name="category" onclick='checkSelectAll()'>케익</li>
                        <li class="li_gap">|</li>
                        <li class="li_gap"><input type="checkbox" name="category" onclick='checkSelectAll()'>음료</li>
                        <li class="li_gap">|</li>
                    </ul>
                    <div class="search">
                        <input type="text" placeholder="검색" style="height: 30px; width: 300px">
                        <button class = "searchbtn">검색</button>
                    </div>
                    </div>
                </article>
                <p></p>
                <article>
                    <div id ="sec3">
                        <h1 style="text-align: center; font-size: 30px; text-decoration: none">전체 상품</h1><br>
                        <ul id="header_navi">
                            <li><a href="DetailMenu.jsp?_breadID=2"><img src="images/초코소보로.png"><span>초코소보로</span></a></li>
                            <li><a href="DetailMenu.jsp?_name=plainpie"><img src="images/맘모스빵.png"><span>맘모스빵</span></a></li>
                            <li><a href="#"><img src="images/마늘빵.png"><span>마늘빵</span></a></li>
                            <li><a href="#"><img src="images/레드벨벳티라미수.png"><span>레드벨벳티라미수</span></a></li>
                            <li><a href="#"><img src="images/슈크림빵.png"><span>슈크림빵</span></a></li>
                            <li><a href="#"><img src="images/메론빵.png"><span>메론빵</span></a></li>
                            <li><a href="#"><img src="images/모카빵.png"><span>모카빵</span></a></li>
                            <li><a href="#"><img src="images/구리볼.png"><span>구리볼</span></a></li>
                            <li><a href="#"><img src="images/단팥빵.jpg"><span>단팥빵</span></a></li>
                            <li><a href="#"><img src="images/옥수수빵.png"><span>옥수수빵</span></a></li>
                            <li><a href="#"><img src="images/카스테라.png"><span>카스테라</span></a></li>
                            <li><a href="#"><img src="images/쁘띠티라미수크레이프.png"><span>쁘띠티라미수</span></a></li>
                            <li><a href="#"><img src="images/머핀.png"><span>머핀</span></a></li>
                            <li><a href="#"><img src="images/쁘띠쿠키앤크림크레이프.png"><span>쁘띠쿠키앤크림</span></a></li>
                            <li><a href="#"><img src="images/우유식빵.png"><span>우유식빵</span></a></li>
                            <li><a href="#"><img src="images/패스츄리.jpg"><span>패스츄리</span></a></li>
                            <li><a href="#"><img src="images/크루아상.jpg"><span>크루아상</span></a></li>
                            <li><a href="#"><img src="images/치즈브레드.jpg"><span>치즈브레드</span></a></li>
                            <li><a href="#"><img src="images/크런치초코크림빵.jpg"><span>크런치초코크림빵</span></a></li>
                            <li><a href="#"><img src="images/연유브레드.jpg"><span>연유브레드</span></a></li>
                            <li><a href="#"><img src="images/피자빵.jpg"><span>피자빵</span></a></li>
                            <li><a href="#"><img src="images/땅콩쿠키.jpg"><span>땅콩쿠키</span></a></li>
                            <li><a href="#"><img src="images/초코쿠키.jpg"><span>초코쿠키</span></a></li>
                            <li><a href="#"><img src="images/라엠브라우니쿠키.jpg"><span>라엠브라우니</span></a></li>
                            <li><a href="#"><img src="images/시나몬피넛쿠키.jpg"><span>시나몬피넛</span></a></li>
                            <li><a href="#"><img src="images/초코칩라운드쿠키.jpg"><span>초코칩라운드</span></a></li>
                            <li><a href="#"><img src="images/피터레비버터쿠키.jpg"><span>피터레빗</span></a></li>
                            <li><a href="#"><img src="images/타르트.jpg"><span>타르트</span></a></li>
                            <li><a href="#"><img src="images/까망베르밀크치즈홀케이크.png"><span>까망베르밀크치즈</span></a></li>
                            <li><a href="#"><img src="images/크로플.jpg"><span>크로플</span></a></li>
                            <li><a href="#"><img src="images/그래인스쿠키.jpg"><span>그래인스쿠키</span></a></li>
                            <li><a href="#"><img src="images/몽슈슈.jpg"><span>몽슈슈</span></a></li>
                            <li><a href="#"><img src="images/초코케익.jpg"><span>초코케익</span></a></li>
                            <li><a href="#"><img src="images/생크림케익.jpg"><span>생크림케익</span></a></li>
                            <li><a href="#"><img src="images/당근케익.png"><span>당근케익</span></a></li>
                            <li><a href="#"><img src="images/로얄밀크티홀케익.png"><span>로얄밀크티케익</span></a></li>
                            <li><a href="#"><img src="images/리얼생녹차크레이프.png"><span>리얼생녹차</span></a></li>
                            <li><a href="#"><img src="images/쁘띠밀크크레이프.png"><span>쁘띠밀크</span></a></li>
                            <li><a href="#"><img src="images/핑크스프링클도넛.jpg"><span>핑크스프링클</span></a></li>
                            <li><a href="#"><img src="images/라즈베리.jpg"><span>라즈베리</span></a></li>
                            <li><a href="#"><img src="images/믹스베리츄이스티.png"><span>믹스베리</span></a></li>
                            <li><a href="#"><img src="images/스윗듀얼하트.png"><span>스윗듀얼하트</span></a></li>
                            <li><a href="#"><img src="images/후로스티드.png"><span>후로스티드</span></a></li>
                            <li><a href="#"><img src="images/소금우유도넛.png"><span>소금우유도넛</span></a></li>
                            <li><a href="#"><img src="images/허니후리터.png"><span>허니후리터</span></a></li>
                            <li><a href="#"><img src="images/딸기먼치킨.png"><span>딸기먼치킨</span></a></li>
                            <li><a href="#"><img src="images/피치핑크.png"><span>피치핑크도넛</span></a></li>
                            <li><a href="#"><img src="images/맘모스듀얼필드.png"><span>맘모스듀얼필드</span></a></li>
                            <li><a href="#"><img src="images/딸기쿠키프라페.png"><span>딸기쿠키프라페</span></a></li>
                            <li><a href="#"><img src="images/쿠키프라페.png"><span>쿠키프라페</span></a></li>
                            <li><a href="#"><img src="images/딸기라떼.png"><span>딸기라떼</span></a></li>
                            <li><a href="#"><img src="images/녹차라떼.png"><span>녹차라떼</span></a></li>
                            <li><a href="#"><img src="images/아이스초코.png"><span>아이스초코</span></a></li>
                            <li><a href="#"><img src="images/흑당버블라떼.png"><span>흑당버블라떼</span></a></li>
                            <li><a href="#"><img src="images/민트카페모카.png"><span>민트카페모카</span></a></li>
                            <li><a href="#"><img src="images/바닐라라떼.png"><span>바닐라라떼</span></a></li>  
                        
                          <%--  <%
      try {
         
         
         Class.forName("com.mysql.jdbc.Driver");
         Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/bread","root","1234");
         Statement stmt = conn.createStatement();

         //ResultSet rs = stmt.executeQuery("select breadname, category from bread");
         String category_ = "pie";
         String sql = "select breadname from bread where category like 'pie'  ";
            ResultSet rs = stmt.executeQuery(sql);
   %>
   <table border="1">
      <tr>
      <th>빵이름</th>
      <th>카테고리</th>
      </tr>
      <%
         while (rs.next()) {
               String breadname = rs.getString("breadname");
               /* String category = rs.getString("category"); */
               out.println("<tr>");
               out.println("<td width='100'>" + breadname + "</td>");
               /* out.println("<td width='100'>" + category + "</td>"); */
               out.println("</tr>");

            }
      %>
   </table>

   <%
      } catch (Exception e) {
         e.printStackTrace();
      }
   %> --%>
                        </ul>
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