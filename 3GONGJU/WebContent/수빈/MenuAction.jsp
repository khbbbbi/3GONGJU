<!-- 헤더 홍길동님 누르면 홍길동이 Myinfo로 전달되며 페이지 이동 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
    <%@ page import="java.io.PrintWriter" %>
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
   function selectAll(selectAll)  {
	   location.href="menu2Action.jsp?catagory=";
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
                        <li class="li_gap"><input type="radio" name="category" onclick='selectAll(this)'>전체</li>
                        <li class="li_gap">|</li>
                        <li class="li_gap"><input type="radio" name="category" onclick='checkSelectAll()'>도넛</li>
                        <li class="li_gap">|</li>
                        <li class="li_gap"><input type="radio" name="category" onclick='checkSelectAll()'>빵</li>
                        <li class="li_gap">|</li>
                        <li class="li_gap"><input type="radio" name="category" onclick='checkSelectAll()'>쿠키</li>
                        <li class="li_gap">|</li>
                        <li class="li_gap"><input type="radio" name="category" onclick='checkSelectAll()'>케익</li>
                        <li class="li_gap">|</li>
                        <li class="li_gap"><input type="radio" name="category" onclick='checkSelectAll()'>음료</li>
                        <li class="li_gap">|</li>
                    </ul>
                    <form action="MenuAction.jsp" method="post">
                    <div class="search">
                        <input type="text" placeholder="검색" style="height: 30px; width: 300px" name ="_search">
                        <button class = "searchbtn">검색</button>
                        </form>
                    </div>
                    </div>
                </article>
                <p></p>
                <article>
                    <div id ="sec3">
                        <h1 style="text-align: center; font-size: 30px; text-decoration: none">전체 상품</h1><br>
                        <ul id="header_navi">
                           <%
      try {
         
         
    	  Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/teampj","root","1234");
			Statement stmt = conn.createStatement();
			
			
			String search = request.getParameter("_search");
		      System.out.println("카테고리 :" + search);
		      PrintWriter scp = response.getWriter();
		      if(  search == null ||  search.equals("")){
		    	  scp.println("<script>");
		    	  scp.println("alert('입력된 내용이 없습니다.')");
		    	  scp.println( "location.href = 'Menu2.jsp' ");
		    	  scp.println("</script>");
				}
         //ResultSet rs = stmt.executeQuery("select breadname, category from bread");
         String category_ = "pie";
         String sql = "select breadname from breadinfo where breadname like '%"+search+"%'";
            ResultSet rs = stmt.executeQuery(sql);
   %>
   <table border="1" >
     <tr>
      <%
      
         while (rs.next()) {
       
               String breadname = rs.getString("breadname");
               /* String category = rs.getString("category"); */
               out.println("<th width =300>");
               out.println("<td width ='300'>" + breadname + "</td>");
               /* out.println("<td width='100'>" + category + "</td>"); */
               out.println("</th>");
              
         } 
      %>
      </tr>
   </table>

   <%
      } catch (Exception e) {
         e.printStackTrace();
      }
   %>
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