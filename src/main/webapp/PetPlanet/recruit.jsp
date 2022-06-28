<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- UIkit JS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/css/uikit.min.css" />
<script src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit-icons.min.js"></script>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- ajax -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
  <!-- icon -->
  <script src="https://kit.fontawesome.com/54b3b8eebf.js" crossorigin="anonymous"></script>
<title>Recruit</title>
</head>
<body>
<jsp:include page="./common/header.jsp" />

<div style="padding-top: 100px; display: flex; justify-content: center">
	<img src="./image/Login_Main_logo03.png" alt="" style="width: 300px; height:360px"/>
</div>
<div style="display: flex; justify-content: center; padding-top: 50px">
	<p style="justify-content: center; text-align: center">
	<span style="font-size: 1.2em; font-weight: 600">| 펫피플은 반려동물과 함께하는 행복한 일상에 필요한 서비스를 만들어가는 팀입니다.</span><br />
	<br />
	전세계 모든 반려인들의 가장 큰 고민거리는 무엇일까요? <br />
	여행, 외출시 혼자 남겨진 반려동물에 대한 걱정과 믿고 맡길 곳이 없다는 점입니다 <br />
	반려동물을 가족처럼 정성스럽게 돌봐줄 ‘누군가’가 있다면, <br />
	반려동물과 떨어져 있어도 함께하는 듯한 기분을 느끼게 하는 ‘기술’이 존재한다면, <br />
	반려인들이 더 행복한 삶을 지낼 수 있을 것이라는 믿음에서 펫피플이 탄생하였습니다. <br />
	<br />
	펫시터 플랫폼을 시작으로, 펫 교육, 펫 액티비티 등의 다양한 서비스를 연구하고, <br />
	LIVE 스트리밍과 같은 고도화된 기술이 접목된 프로덕트(앱)을 개발하여 <br />
	온오프라인을 통합한 대한민국의 펫 서비스 시장을 선도하고자 합니다. <br />
	<br />
	<br />
	<span style="font-size: 1.2em; font-weight: 600">| 2018년 3월 첫 서비스 시작 이후로 매년 엄청난 성장을 이뤄내고 있습니다.</span><br />
	<br />
	2019년 8월에는 전년도 동기간 대비 활성 사용자 수가 1578% 성장하였고, <br />
	한달 거래액은 2018년 전체 거래액을 이미 돌파했습니다. <br />
	‘와요’의 방문 펫시터 서비스를 경험한 고객 3명 중 2명(약 70%)는 <br />
	재구매를 할 정도로 만족할만한 서비스 경험을 제공하고 있습니다. <br />
	이러한 가치를 인정받아 올해 2019년 네이버 계열 투자 회사, <br />
	스프링 캠프(Spring Camp)로부터 투자를 유치하며 본격적인 성장을 이뤄내고 있습니다. <br />
	<br />
	<br />
	<span style="font-size: 1.2em; font-weight: 600">| 펫피플과 함께 대한민국 펫 시장을 치열하게 고민하고 선도할 역량있는 팀원을 모십니다.</span><br />
	<br />
	• 방문 펫시터 '와요' 사이트 <a href="http://wayopet.com">http://wayopet.com</a> <br />
	• 방문 펫시터 '와요' 앱 <a href="https://apps.apple.com/kr/app/와요-펫시터가-집으로-와요/id1454485087">https://apps.apple.com/kr/app/와요-펫시터가-집으로-와요/id1454485087</a> <br />
	• 방문 펫시터 '와요' 인스타그램 <a href="https://www.instagram.com/wayopet">https://www.instagram.com/wayopet</a> <br />
	• 위탁 펫시터 '펫플래닛' 사이트 <a href="http://petplanet.do">http://petplanet.do</a> <br />
	• 위탁 펫시터 '펫플래닛' 앱 <a href="https://apps.apple.com/kr/app/펫플래닛-엄선된-펫시터/id1343097834">https://apps.apple.com/kr/app/펫플래닛-엄선된-펫시터/id1343097834</a> <br />
	• 위탁 펫시터 '펫플래닛' 인스타그램 <a href="https://www.instagram.com/petplanet.co">https://www.instagram.com/petplanet.co</a> <br />
	</p>
</div>
<div style="display: flex; justify-content: center; margin-top: 100px; align-items: center; margin-bottom: 20px">
	<img src="./image/id_icon01.png" alt="" style="width: 40px; height: 40px"/>
	<p style="justify-content: center; font-size: 3em; font-weight: bold;">기업 위치</p>
</div>
<div style="display: flex; justify-content: center;">
	<p style="justify-content: center; font-size: 1.2em;">주소 : 서울시 강남구 논현동 20-2 세정빌딩 3층</p>
</div>
<!-- * 카카오맵 - 지도퍼가기 -->
<!-- 1. 지도 노드 -->
<div id="daumRoughmapContainer1656412466606" class="root_daum_roughmap root_daum_roughmap_landing" style="top: 50px; left: 30%; margin-bottom: 100px;"></div>

<!--
   2. 설치 스크립트
   * 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
-->
<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

<!-- 3. 실행 스크립트 -->
<script charset="UTF-8">
   new daum.roughmap.Lander({
      "timestamp" : "1656412466606",
      "key" : "2arxr",
      "mapWidth" : "800",
      "mapHeight" : "450"
   }).render();
</script>

<jsp:include page="./common/foot.jsp" />
</body>
</html>
