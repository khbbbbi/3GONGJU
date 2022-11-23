<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link rel="stylesheet" href="css/Signup.css" />
</head>
    <script type = "text/javascript">
	function logout(){
        if (confirm('정말 로그아웃하시겠습니까?')) {
        	// 네!
        	location.href="Login.jsp";
        } else {
        	//아니오ㅡ.ㅡ
        	location.href="#";
        }
	}
    //아이디 중복 체크
    function copycheck(){
    	if(document.getElementById('idcheck').value !=''){
        	var id = document.getElementById('idcheck').value;
		
			var _width = '400';
	    	var _height = '40';
			var _left = Math.ceil(( window.screen.width - _width )/2);
			
			window.name = "parentForm";
		
			window.open("idcheck.jsp?_id="+id,"", 'width='+ _width +', height='+ _height +', left=' + _left+',text-align=center' );
    		
    	}else{
    		alert('아이디를 입력해주세요');
    		document.getElementById("idcheck").focus();
    	}
    }

    
    //비번 확인 버튼 클릭
    function correctpw(){
    	if(document.getElementById('pw').value !='' && document.getElementById('pwcheck').value!=''){
            if(document.getElementById('pw').value==document.getElementById('pwcheck').value){
                // document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
                // document.getElementById('check').style.color='blue';
                alert('비밀번호가 일치합니다.');
            }
            else{
                // document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
                // document.getElementById('check').style.color='red';
                alert('비밀번호가 일치하지 않습니다.');
                document.getElementById('pwcheck').value='';
                document.getElementById("pwcheck").focus();
            }
        }else{
        	alert("비밀번호를 입력하세요");
        	
        }
    }
    
    //비번 기준안
    function check_pw(){
        var pw = document.getElementById('pw').value;
        var SC = ["!","@","#","$","%"];
        var check_SC  =  0;

        if(pw.length < 6 || pw.length > 16){
            window.alert('비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다.');
            document.getElementById('pw').value='';
            document.getElementById("pw").focus();
        }
        for(var i=0;i<SC.length;i++){
        if(pw.indexOf(SC[i]) != -1){
            check_SC = 1;
        }
        }
        if(check_SC == 0){
            window.alert('!,@,#,$,% 의 특수문자가 들어가 있지 않습니다.')
            document.getElementById('pw').value='';
            document.getElementById("pw").focus();
        }
        
    }
    
    </script>
<body>
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
    <!-- 메인부분 -->
    <div class = "area_all">
            <section class = "area_main">
                <h1 style="text-align: center; font-size: 30px;text-decoration: overline;">회원가입</h1>
                <article class="menu_container">
                	<!-- 원래 div였는데 form태그로 수정 (값 넘기기 위함) -->
                    <form action = "test.jsp" method = "post" >
                    <div class = "item">
                      <div>
							이름<br><input type="text" name="_name" maxlength="20" >
                      </div>
                      <div>
                           	 아이디<br><input type="text" id = "idcheck"  name="_id" maxlength="20">
                            <input type = "button" style="width: 126px; height: 30px;" value = "중복확인" onclick="copycheck()">
                      </div>
                      <div>
                           	 비밀번호<br><input type="password" id = "pw" name="_pw" onchange="check_pw()" maxlength="20">
                      </div>
                      <div>
                          	  비밀번호 확인<br><input type="password" id = "pwcheck" name="_pwcheck" maxlength="20">
                            <input type = "button" style="width: 126px; height: 30px;" value = "비밀번호확인" onclick="correctpw()">
                      </div> 
                    </div>
                    <button type="button" style="height: 40px;">취소</button>
                    <!-- 그냥 버튼 말고 input submit 버튼으로  -->
                    <!-- <button id = "btnjoin" style="height: 40px;">가입하기</button> -->
                    <input id = "btnjoin" type = "submit" style="height: 40px;" value = "가입하기">
                    </form>
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