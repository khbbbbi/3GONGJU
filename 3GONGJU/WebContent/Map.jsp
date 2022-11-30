<!-- 한비, 성은 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/Map.css" />
</head>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d61113d1380a06a01f67ed85eea5fe5d"></script>
<script>
function clickinha(){
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	mapOptionInha = { 
		center: new kakao.maps.LatLng(37.451819, 126.654972), // 지도의 중심좌표
	    level: 3
	};
		
	var map = new kakao.maps.Map(mapContainer, mapOptionInha); // 지도를 생성합니다
 
	// 마커를 표시할 위치와 title 객체 배열입니다 
	var positions = [
    {
        title: '인천인하대점', 
        latlng: new kakao.maps.LatLng(37.451819, 126.654972)
    },
    {
        title: '부천상동점', 
        latlng: new kakao.maps.LatLng(37.5050983, 126.7523393)
    },
    {
        title: '부평역점', 
        latlng: new kakao.maps.LatLng(37.491422, 126.722112)
    }
];

	// 마커 이미지의 이미지 주소입니다
	var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
    
	for (var i = 0; i < positions.length; i ++) {
    
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(24, 35); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage // 마커 이미지 
    });
	}
}

function clicksangdong(){
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	mapOptionInha = { 
		center: new kakao.maps.LatLng(37.5050983, 126.7523393), // 지도의 중심좌표
	    level: 3
	};

	var map = new kakao.maps.Map(mapContainer, mapOptionInha); // 지도를 생성합니다
 
	// 마커를 표시할 위치와 title 객체 배열입니다 
	var positions = [
    {
        title: '인천인하대점', 
        latlng: new kakao.maps.LatLng(37.451819, 126.654972)
    },
    {
        title: '부천상동점', 
        latlng: new kakao.maps.LatLng(37.5050983, 126.7523393)
    },
    {
        title: '부평역점', 
        latlng: new kakao.maps.LatLng(37.491422, 126.722112)
    }
];

	// 마커 이미지의 이미지 주소입니다
	var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
    
	for (var i = 0; i < positions.length; i ++) {
    
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(24, 35); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage // 마커 이미지 
    });
	}
}

function clickbupyeong(){
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	mapOptionInha = { 
		center: new kakao.maps.LatLng(37.491422, 126.722112), // 지도의 중심좌표
	    level: 3
	};

	var map = new kakao.maps.Map(mapContainer, mapOptionInha); // 지도를 생성합니다
 
	// 마커를 표시할 위치와 title 객체 배열입니다 
	var positions = [
    {
        title: '인천인하대점', 
        latlng: new kakao.maps.LatLng(37.451819, 126.654972)
    },
    {
        title: '부천상동점', 
        latlng: new kakao.maps.LatLng(37.5050983, 126.7523393)
    },
    {
        title: '부평역점', 
        latlng: new kakao.maps.LatLng(37.491422, 126.722112)
    }
];

	// 마커 이미지의 이미지 주소입니다
	var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
    
	for (var i = 0; i < positions.length; i ++) {
    
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(24, 35); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage // 마커 이미지 
    });
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
            <section class = "area_main">
                <h1 style="text-align: center; font-size: 30px; text-decoration: overline;">STORE</h1>
                <article>
                <div class = "area_map">
                    
                    <div class = "my">
                        <div class = "my_container">
                            <button  id = "Inha" onclick="clickinha()">인천인하대점</button>
                            <button  id = "Sangdong" onclick="clicksangdong()">부천상동점</button>
                            <button  id = "Bupyeong" onclick="clickbupyeong()">부평역점</button>
                        </div>
                    </div>
                    <div class = "sns">
                        <div id = "map"></div>
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
            <p>TM & Copyright 2022 로고. All Rights Reserved.</p> 
            </div>
        </footer>
        </div>
</body>
</html>