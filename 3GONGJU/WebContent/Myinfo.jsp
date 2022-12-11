<!-- Menu페이지에서 홍기동 값을 받아와 이름 부분에 표시 -->
<!--현희 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="EUC-KR">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내정보</title>
    <link rel="stylesheet" href="css/Myinfo.css" />
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

        function pwcheck(){
        	if(document.getElementById('_pw2').value !='' && document.getElementById('_pw2check').value!=''){
                if(document.getElementById('_pw2').value==document.getElementById('_pw2check').value){
                    // document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
                    // document.getElementById('check').style.color='blue';
                    alert('비밀번호가 일치합니다.');
                }
                else{
                    // document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
                    // document.getElementById('check').style.color='red';
                    alert('비밀번호가 일치하지 않습니다.');
                    document.getElementById('_pw2check').value='';
                    document.getElementById("_pw2check").focus();
                }
            }
        }
        //변경 비밀번호 체크
        function check_pw(){
            var pw = document.getElementById('_pw2').value;
            //var SC = ["!","@","#","$","%"];
            //var check_SC = 0;

            if(pw.length < 6 || pw.length > 16){
                window.alert('비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다.');
                document.getElementById('_pw2').value='';
                document.getElementById("_pw2").focus();
            }
            /* for(var i=0;i<SC.length;i++){
            if(pw.indexOf(SC[i]) != -1){
                check_SC = 1;
            }
            }
            if(check_SC == 0){
                window.alert('!,@,#,$,% 의 특수문자가 들어가 있지 않습니다.')
                document.getElementById('_pw2').value='';
                document.getElementById("_pw2").focus();
            } */
        }
        
        //탈퇴하기
        function deleteinfo(){
        	if (confirm('정말 탈퇴하시겠습니까?')) {
        		  // 네!
        		  location.href="Login.jsp";
        		  
        		} else {
        		  //아니오ㅡ.ㅡ
        		  location.href="Myinfo.jsp";
        		}
        }
        //수정하기
        function updateInfo(){
        	
        	if (confirm('정말 수정하시겠습니까?')) {
        		
        		let getUserPassword = document.getElementById("_pw2").value;
        		let getUserIdx = document.getElementById("userIdx").value;
        		
        		// 네!
        		location.href="MyinfoUpdate.jsp?userPassword="+getUserPassword+"&userIdx="+getUserIdx;
        	} else {
        		//아니오ㅡ.ㅡ
        		location.href="Myinfo.jsp";
        	}
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
                                <li><a href="Menu.jsp" aria-label="subemnu">쿠키&파이</a></li>
                                <li><a href="Menu.jsp" aria-label="subemnu">케익</a></li>
                                <li><a href="Menu.jsp" aria-label="subemnu">베이커리</a></li>
                                <li><a href="Menu.jsp" aria-label="subemnu">마카롱&오믈렛</a></li>
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
    <!-- 메인부분 -->
    <div class = "area_all">
            <section class = "area_main">
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
				
				// 2) 데이터베이스 연결
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/teampj","root","1234");
				Statement stmt = conn.createStatement();

			 	// 2) SQL문 실행, 회원번호 기준으로 정보를 조회한다.
			   	String sql = "select * from user where userId = "+state+"";
				// 4) 실행
			   	ResultSet rs = stmt.executeQuery(sql);
	
				// 5) 결과를 테이블에 출력
				if(rs.next()) {
					int userIdx = rs.getInt("userIdx");	//유저번호
					String userName = rs.getString("userName");		//이름
					String userId = rs.getString("userId");			//아이디
					String userPassword = rs.getString("userPassword");		//비밀번호
			%>
                <h1 style="text-align: center; font-size: 30px;text-decoration: overline;">내정보</h1>
                <article class="menu_container">
                    <div class = "item">
                    	<input type="hidden" name="userIdx" id="userIdx" value="<%=userIdx%>"/>
                        <div>
                           	 이름<br><input type="text" name="userName" value="<%=userName%>"	maxlength="20" disabled>
                            <!-- disabled는 비활성화와 함께 form으로 전송하여도 절대 전송 되지 않습니다. -->
                        </div>
                        <div>
                            	아이디<br><input type="text" name="userId" maxlength="20" value = "<%=userId%>" disabled>
                            <!-- readonly는 disabled처럼 입력은 비활성화 되지만 폼으로 전송 가능합니다. -->
                        </div>
                        <div>
                            	변경 비밀번호<br><input type="password" name="userpw2" id = "_pw2" onchange="check_pw()" maxlength="20">
                        </div>
                        <div>
                            	변경 비밀번호 확인<br><input type="password" name="userpw2check" id ="_pw2check" maxlength="20">
                            <button type="button" style="width: 126px; height: 30px;" onclick = "pwcheck()">비밀번호확인</button>
                        </div>
                    </div>
                    <div class = "bottom_btn">
                        <button type="button" style="height: 40px;">취소</button>
                        <button type="button" style="height: 40px;" onclick="updateInfo();">수정하기</button>
                    </div>
                    <br><a href="#" onclick="deleteinfo()">탈퇴하기</a>
                </article>
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