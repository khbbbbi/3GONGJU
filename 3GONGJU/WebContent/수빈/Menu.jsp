<!-- 헤더 홍길동님 누르면 홍길동이 Myinfo로 전달되며 페이지 이동 -->
<!-- 수빈 -->
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
	   location.href="MenuAction.jsp?catagory=";
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
                                <li><a href="Menu.jsp" aria-label="subemnu">식사용</a></li>
                                <li><a href="Menu.jsp" aria-label="subemnu">파이</a></li>
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
                          
                        <!-- 전체일때 -->
                        <li class="li_gap">
                        <a href =" Menu.jsp">전체
                        </a>
                        </li>
                        
                        
                        <!-- pie일때 -->
                        <% String pie_ = "pie"; %> 
                        <li class="li_gap">
                        <a href =" Menu.jsp?cate_=<%=pie_%>" >쿠키&파이
                        </a>
                        </li>
                        
                        <!-- 케이크일때 -->
                        <% String cake_ = "cake"; %>
                        <li class="li_gap">
                        <a href =" Menu.jsp?cate_=<%=cake_%>">케익
                        </a>
                        </li>
                        
                           <!-- 도넛일때 -->
                        <% String donut_ = "donut"; %>
                        <li class="li_gap">
                        <a href =" Menu.jsp?cate_=<%=donut_%>">도넛
                        </a>
                        </li>
                        
                        <!-- 음료일때 -->
                        <% String drink_ = "drink"; %>
                        <li class="li_gap">
                        <a href =" Menu.jsp?cate_=<%=drink_%>">음료
                        </a>
                        </li>
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
    	  String url = "jdbc:mysql://localhost:3307/teampj";
    	  
    	  
         
    	  Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(url, "root", "1234");
			Statement stmt = conn.createStatement();
         //ResultSet rs = stmt.executeQuery("select breadname, category from bread");
         String sql =null;
           String cate = null;
           ResultSet rs = null;
           
          if(request.getParameter("cate_") != null){
        		   cate = request.getParameter("cate_");
        		   sql = "select * from breadinfo where category like '"+cate+"' ";
        		    rs = stmt.executeQuery(sql);
        		   
          }else if(request.getParameter("cate_") == null || request.getParameter("cate_").equals("")){
        	   sql = "select * from breadinfo";
        	    rs = stmt.executeQuery(sql);
          }
           System.out.print("cate :" +cate);

         while (rs.next()) {
        	 	String sr = rs.getString("imgsrc");
         		String name = rs.getString("breadname");
               %>
               <li><a href="DetailMenu.jsp?_breadID=4"><img src="<%= sr %>">
               <p><%= name %></p></a></li>
               <%
         } 
      rs.close();
      
      stmt.close();
      conn.close();

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