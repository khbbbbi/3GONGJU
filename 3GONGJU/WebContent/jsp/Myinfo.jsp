<!-- Menu페이지에서 홍기동 값을 받아와 이름 부분에 표시 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            var SC = ["!","@","#","$","%"];
            var check_SC = 0;

            if(pw.length < 6 || pw.length > 16){
                window.alert('비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다.');
                document.getElementById('_pw2').value='';
                document.getElementById("_pw2").focus();
            }
            for(var i=0;i<SC.length;i++){
            if(pw.indexOf(SC[i]) != -1){
                check_SC = 1;
            }
            }
            if(check_SC == 0){
                window.alert('!,@,#,$,% 의 특수문자가 들어가 있지 않습니다.')
                document.getElementById('_pw2').value='';
                document.getElementById("_pw2").focus();
            }
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
    </script>
<body>
<%
	String name = request.getParameter("_name");
%>
    <header>
        <!-- 상단에 이름, 로그아웃, 장바구니 -->
        <div class = "area_header">
            <div class = "gita">
                <a href="Myinfo.jsp?_name=홍길동" class="link_text" style="color: darkslateblue">홍길동</a>님
                <a href="#" onclick="logout()" class="link_text" style="color: darkslateblue">로그아웃</a>
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
                                <li><a href="#" >전체</a></li>
                                <li><a href="#" aria-label="subemnu">도넛</a></li>
                                <li><a href="#" aria-label="subemnu">빵</a></li>
                                <li><a href="#" aria-label="subemnu">쿠키</a></li>
                                <li><a href="#" aria-label="subemnu">케익</a></li>
                                <li><a href="#" aria-label="subemnu">음료</a></li>
                            </ul>
                            </li>
                            <li><a href="#"><b>Store</b></a>
                            <ul id="sub-menu">
                                <li><a href="#" aria-label="subemnu">매장찾기</a></li>
                            </ul>
                            </li>
                            <li><a href="#"><b>Mypage</b></a>
                            <ul id="sub-menu">
                                <li><a href="#" aria-label="subemnu">주문내역</a></li>
                                <li><a href="#" aria-label="subemnu">장바구니</a></li>
                                <li><a href="#" aria-label="subemnu">내정보</a></li>
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
                <h1 style="text-align: center; font-size: 30px;text-decoration: overline;">내정보</h1>
                <article class="menu_container">
                    <div class = "item">
                        <div>
                           	 이름<br><input type="text" name="username" maxlength="20" value =<%=name %> disabled>
                            <!-- disabled는 비활성화와 함께 form으로 전송하여도 절대 전송 되지 않습니다. -->
                        </div>
                        <div>
                            	아이디<br><input type="text" name="userID" maxlength="20" value = "hong" disabled>
                            <!-- readonly는 disabled처럼 입력은 비활성화 되지만 폼으로 전송 가능합니다. -->
                        </div>
                        <div>
                            	현재 비밀번호<br><input type="password" name="userpw" maxlength="20">
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
                        <button type="button" style="height: 40px;">수정하기</button>
                    </div>
                    <br><a href="#" onclick="deleteinfo()">탈퇴하기</a>
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