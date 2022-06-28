<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
  /* foot */
  .foot a {
    text-decoration: none;
    color: #383C38
  }
  p {
    margin-bottom: 0
  }
</style>
<!-- foot -->
<div class="container foot" style="height: 550px; display: flex; align-items: center; justify-content: center;">
  <div style="display: flex; justify-content: space-between; align-items: center; width: 1090px; height: 360px; border-top: 1px solid #E7E9EB;">
    <!-- left -->
    <div style="display: flex; flex-direction: column; height: 304px; justify-content: space-between; margin-top: 55px; margin-left: 28px; margin-right: 28px;">
      <p style="font-size: 15px; font-weight: 600; color: #383C38;">주식회사 펫피플</p>
      <p style="font-size: 13px; color: #383C38; line-height: 24px;">
        서울시 강남구 논현동 20-2 세정빌딩 3층<br>
        사업자 등록번호 : 347-87-00837<br>
        통신판매업 신고번호 : 제 2017-서울강남-03319<br>
        대표 : 이원복 | 개인정보책임자 : 김태호<brs>
        대표전화 : 070-4756-2223<br>
        업무시간 : 평일 10:00-18:00 (점심 13:00-14:00)<br>
        이메일 : help@petplanet.co
      </p>
      <p style="font-size: 13px; color: #9DA4B4;">© PET PEOPLE Inc. All Rights Reserved</p>
    </div>
    <!-- right -->
    <div style="display: flex; justify-content: space-between; flex-direction: column; align-items: flex-end; height: 360px;">
      <div style="display: flex; justify-content: space-between;">
        <div style="display: flex; flex-direction: column; margin-top: 55px; margin-right: 100px">
          <p style="font-size: 15px; color: #383C38; font-weight: 600;">펫플래닛 서비스</p>
          <p style="font-size: 13px; margin-top: 32px;">서비스 소개</p>
          <a href="/J03Project/PetPlanet/board" style="font-size: 13px; margin-top: 19px; ">질문과 답변</a>
          <p style="font-size: 13px; margin-top: 19px;">채팅 상담</p>
          <a href="" style="font-size: 13px; margin-top: 19px;">안전 보상 제도</a>
          <a href="" style="font-size: 13px; margin-top: 19px;">이용 약관</a>
        </div>
        <div style="display: flex; flex-direction: column; margin-top: 55px; margin-right: 100px; height: 228px;">
          <p style="font-size: 15px; color: #383C38; font-weight: 600;">회사에 대하여</p>
          <a href="" style="font-size: 13px; margin-top: 32px;">펫피플 컴퍼니</a>
          <a href="recruit.jsp" style="font-size: 13px; margin-top: 19px;">채용 공고</a>
          <a href="" style="font-size: 13px; margin-top: 19px;">비즈니스 제휴</a>
        </div>
        <div style="display: flex; flex-direction: column; margin-top: 55px; margin-right: 28px; height: 228px;">
          <p style="font-size: 15px; color: #383C38; font-weight: 600;">팻플래닛 계정</p>
          <c:if test="${ sessionScope.u_id eq null }" var="result">
          <a href="/J03Project/PetPlanet/regist" style="font-size: 13px; margin-top: 32px;">회원가입</a>
          <a id="Login" href="javascript:login();" style="font-size: 13px; margin-top: 19px;">로그인</a>
          </c:if>
          <c:if test="${ not result }">
          <p style="font-size: 13px; margin-top: 32px;">회원가입</p>
          <p style="font-size: 13px; margin-top: 19px;">로그인</p>
          </c:if>
        </div>
      </div>
      <div>
        <a href="https://www.instagram.com/petplanet.co">
          <img src="/J03Project/PetPlanet/image/icon_insta.png" alt="펫플래닛 인스타그램" style="width: 40px; height: 40px; margin-right: 10px;">
        </a>
        <a href="https://www.facebook.com/petplanet.co">
          <img src="/J03Project/PetPlanet/image/icon_facebook.png" alt="펫플래닛 페이스북" style="width: 40px; height: 40px; margin-right: 10px;">
        </a>
        <a href="https://blog.naver.com/petplanet_kr">
          <img src="/J03Project/PetPlanet/image/icon_blog.png" alt="펫플래닛 블로그" style="width: 40px; height: 40px; margin-right: 10px;">
        </a>
        <a href="https://www.youtube.com/channel/UCWfbYQA0PSdU5up5s9_ySmA">
          <img src="/J03Project/PetPlanet/image/icon_youtube.png" alt="펫플래닛 유튜브" style="width: 40px; height: 40px; margin-right: 20px;">
        </a>
      </div>
    </div>
  </div>
</div>
<style>
#on_top {
	position: fixed;
    right: 24px;
    bottom: 50px;
    z-index: 100;
}
#on_top:before {
	display: inline-block;
    width: 51px;
    height: 51px;
    background-position: -150px -212px;
    background-repeat: no-repeat;
    vertical-align: top;
    content: '';
}
#on_bottom {
	position: fixed;
    right: 24px;
    bottom: 20px;
    z-index: 100;
}
#on_bottom:before {
	display: inline-block;
    width: 51px;
    height: 51px;
    background-position: -150px -212px;
    background-repeat: no-repeat;
    vertical-align: top;
    content: '';
}
</style>
<script>
$(document).ready(function() {

	$(window).scroll(function() {
	    // top button controll
	    if ($(this).scrollTop() > 500) {
	        $('#on_top').fadeIn();
	    } else {
	        $('#on_top').fadeOut();
	    }
	    
	    //bottom button controll
	    var innerHeight = $(this).innerHeight();
	    var scrollHeight = $('body').prop('scrollHeight');
	    if ($(this).scrollTop() + innerHeight < scrollHeight - 300 ) {
	        $('#on_bottom').fadeIn();
	    } else {
	        $('#on_bottom').fadeOut();
	    }
	});

	$("#on_top").click(function() {
		$('html, body').animate({scrollTop:0}, '300');
	});
	var scrollHeight = $('body').prop('scrollHeight');
	$("#on_bottom").click(function() {
		$('html, body').animate({scrollTop: scrollHeight}, '300');
	});

});
</script>
<div>
	<a id="on_top" > 
		<img src="/J03Project/PetPlanet/image/on_top.png" width="30px"/>
	</a>
	<a id="on_bottom" > 
		<img src="/J03Project/PetPlanet/image/on_bottom.png" width="30px"/>
	</a>
</div>