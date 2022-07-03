<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- bootstrap CDN -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
  <!-- jQuery -->
  <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
  <!-- ajax -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
  <!-- icon -->
  <script src="https://kit.fontawesome.com/54b3b8eebf.js" crossorigin="anonymous"></script>
  <title>PetPlanet</title>
  <style>
    * {
      font-family: SpoqaHanSans,'BM JUA_TTF', sans-serif;
    }
    a {
      text-decoration: none;
    }
    p {
      margin-bottom: 0
    }
    /* 스크롤 움직이면 transform */
    .m1 {
      opacity: 0;
      transition: all 1s ease;
    }
    .m1-up {
      transform: translate(0, 100px);
    }
    .m1-down {
      transform: translate(0, -100px);
    }
    .m1-right {
      transform: translate(-100px, 0);
    }
    .show {
      opacity: 1;
      transform: none;
    }
    /* service_menu */
    .service_section {
      width: 365.5px;
    }
    .service_section ul li{
      display: inline-block;
      list-style: none;
      width: 64px;
      padding-top: 15px;
      margin: 10px;
    }
    .tabs {
      font-size: 17px;
      cursor: pointer;
      padding-left: 0;
    }
    .select-service {
      font-weight: bold;
      color: #81A3F0;
    }
    .select-service span{
      width: 64px;
      border-bottom: 2px solid #81A3F0;
      padding-bottom: 10px;
    }
    .tab_container {
      display: flex;
      justify-content: left;
      margin-left: 30px;
    }
    .tab_content{
      text-align: left;
      font-size: 17px;
      width: 365.5px;
      margin-top: 28px;
      line-height: 30px;
      color: #4D5055;
    }
    img.service_image {
      width: 420px;
      height: 700px;
    }
  </style>
  <script>
    /* 스크롤 내릴 때 클래스 삽입 */
    $(window).on('scroll',function(){
      if($(window).scrollTop()){
          $('#header_t').addClass('active');
      } else {
          $('#header_t').removeClass('active');
      }

      if($(window).scrollTop()) {
        if($(window).scrollTop() >= 300) {
          $('.m1').addClass('show');
        } else {
          $('.m1').removeClass('show');
        }
      }
    });

    $(function () {
    
      /*auto switch */
      var tabs = $('.tabs li');
      var tabs1 = $('.tabs li');
      var timerId = 0;  
      var timerId1 = 0;  
      
      timerId = setInterval(function() {
        var onTab = tabs.filter('.select-service');
        var nextTab = onTab.index() < tabs.length-1 ? onTab.next() : tabs.first();
        nextTab.click();
      }, 3000);      
        
      $(".tab_container").mouseleave(function () {
  
        timerId = setInterval(function() {
          var onTab = tabs.filter('.select-service');
          var nextTab = onTab.index() < tabs.length-1 ? onTab.next() : tabs.first();
          nextTab.click();
        }, 3000);
      });
  
      $(".tab_container").mouseenter(function () {
        clearInterval(timerId);
      });

      $(".tab_image").mouseleave(function () {
  
        timerId1 = setInterval(function() {
          var onTab1 = tabs1.filter('.select-service');
          var nextTab1 = onTab1.index() < tabs1.length-1 ? onTab1.next() : tabs1.first();
          nextTab1.click();
        }, 3000);
      });
  
      $(".tab_image").mouseenter(function () {
        clearInterval(timerId1);
      });
      
      /* tab 글귀 */
      $(".tab_content").hide();
      $(".tab_content:first").show();
      /* tab 이미지 */
      $(".service_image").hide();
      $(".service_image:first").show();
  
      $("ul.tabs li").click(function () {

        $("ul.tabs li").removeClass("select-service").css("color", "#81899B");
        $(this).addClass("select-service").css("color", "#81A3F0");

        $(".tab_content").hide()
          var activeTab = $(this).attr("rel");
        $("#" + activeTab).fadeIn()

        $(".service_image").hide()
          var activeTab = $(this).attr("rel1");
        $("#" + activeTab).fadeIn()
      });
    });
  </script>
</head>
<body>
<jsp:include page="./common/header.jsp" />
  <!-- title -->
  <div class="container-fluid" style="display: flex; justify-content: center; height: 870px;">
    <div style="z-index: -1; position: absolute; width: 100%; height: 870px; left: 0;">
      <img src="./image/introduction00@2x.jpg" alt="" style="position: absolute; width: 100%; height: 870px; margin: auto; inset: 0px">
    </div>
    <div style="display: flex; flex-direction: column; align-items: center;">
      <img src="./image/title_logo.png" alt="" style="width: 250px; height: 90px; margin-top: 242px">
      <div style="display: flex; flex-direction: column; align-items: center; margin-top: 50px">
        <p style="display: flex; text-align: center; font-size: 55px; font-weight: bold;">엄선된 펫시터</p>
        <p style="display: flex; text-align: center; font-size: 55px; font-weight: bold;"><span style="color: #71A7FF;">펫플래닛</span>에서 만나요!</p>
      </div>
      <a href="./PetPlanet/search.jsp" style="width: 250px; height: 70px; background-color: #71A2FF; border-radius: 7px; margin-top: 90px; color: white; display: flex; align-items: center; justify-content: center;">
        <p style="font-size: 20px; margin-bottom: 0;">내 주변 펫시터 찾기</p>
      </a>
    </div>
  </div>
  <!-- site_guide -->
  <div class="container-fluid" style="display: flex; align-items: center;  flex-direction: column;">
    <div style="width: 1440px; height: 1020px; display: flex; justify-content: space-between;">
      <!-- left -->
      <div class="m1 m1-right" style="display: flex; flex-direction: column; align-items: center; align-self: center; margin-left: 210px">
        <p style="font-size: 50px; line-height: 70px; font-weight: bold;">
          행복한 하루를
          <br>
          선물하세요
        </p>
        <p style="font-size: 17px; margin-top: 55px; line-height: 30px;">
          <span style="font-weight: bold;">여행, 출장, 늦은 퇴근</span>
          에도 걱정마세요!
          <br>
          가족같은 펫시터가 내 아이와 함께합니다.
        </p>
      </div>
      <!-- right -->
      <div style="display: flex; width: 682px; height: 670px; margin-right: 160px; justify-content: center; align-items: center; ">
        <!-- No.1 menu-->
        <div class="m1 m1-up" style="display: flex; flex-direction: column; justify-content: center; border-radius: 12px; box-shadow: rgba(0, 0, 0, 0.08) 2px 3px 32px; margin-top: 400px; margin-right: 50px">
          <img src="./image/desktop_image1.png" alt="" style="width: 280px; height: 125px; border-radius: 12px 12px 0 0;">
          <div style="display: flex; flex-direction: column; justify-content: center; align-items: center; align-self: center;">
            <p style="text-align: center; margin-top: 50px">
              <span style="font-size: 21px; font-weight: bold; ">1박 돌봄</span>
            </p>
            <p style="color: #5E636D;">
              하룻밤 이상 장기간 맡길 때
            </p>
          </div>
          <div style="display: flex; border-top: 1.5px dashed lightgray; width: 200px; margin: 30px 0; align-self: center;"></div>
          <div style="display: flex; justify-content: center; align-items: center; align-self: center;">
            <p style="text-align: center;">
              <span style="font-size: 25px; font-weight: bold; line-height: 60px; color:#71A2FF">₩30,000</span>
            </p>
            <p style="color: #5E636D;">
              부터
            </p>
          </div>
          <div style="display: flex; justify-content: center;">
            <a href="" style="width: 150px; height: 52px; background-color: #71A2FF; border-radius: 26px; margin-bottom: 40px; color: white; display: flex; align-items: center; justify-content: center;">
              <p style="font-size: 20px; margin-bottom: 0;">예약하기</p>
            </a>
          </div>
        </div>
        <!-- No.2 menu -->
        <div class="m1 m1-down" style="display: flex; flex-direction: column; justify-content: center; border-radius: 12px; box-shadow: rgba(0, 0, 0, 0.08) 2px 3px 32px; margin-top: 200px;">
          <img src="./image/desktop_image2.png" alt="" style="width: 280px; height: 125px; border-radius: 12px 12px 0 0;">
          <div style="display: flex; flex-direction: column; justify-content: center; align-items: center; align-self: center;">
            <p style="text-align: center; margin-top: 50px">
              <span style="font-size: 21px; font-weight: bold; ">데이 케어</span>
            </p>
            <p style="color: #5E636D;">
              12시간 이내 장시간 외출시
            </p>
          </div>
          <div style="display: flex; border-top: 1.5px dashed lightgray; width: 200px; margin: 30px 0; align-self: center;"></div>
          <div style="display: flex; justify-content: center; align-items: center; align-self: center;">
            <p style="text-align: center;">
              <span style="font-size: 25px; font-weight: bold; line-height: 60px; color:#71A2FF">₩20,000</span>
            </p>
            <p style="color: #5E636D;">
              부터
            </p>
          </div>
          <div style="display: flex; justify-content: center;">
            <a href="" style="width: 150px; height: 52px; background-color: #71A2FF; border-radius: 26px; margin-bottom: 40px; color: white; display: flex; align-items: center; justify-content: center;">
              <p style="font-size: 20px; margin-bottom: 0;">예약하기</p>
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- latter_menu -->
  <div class="container-fluid" style="display: flex; justify-content: center; width:100%; flex-direction: column; align-items: center; align-self: center; background-color: #FCFCFD; padding-top: 158px; padding-bottom: 148px;">
    <p style="display: flex; text-align: center; font-size: 55px; font-weight: bold;">
      펫플래닛
      <br>
      가정집 펫시터 후기
    </p>
    <div style="display: flex; justify-content: space-between; width: 994px; margin: 116px auto 0px; ">
      <!-- No.1 -->
      <div style="display: flex; flex-direction: column; width: 310px; height: 462px; align-items: center; box-shadow: rgba(0, 0, 0, 0.08) 2px 3px 32px; padding-top: 5px">
        <div>
          <img src="./image/latter_img02.png" alt="" style="width: 298px; height: 168px; border-radius: 5px 5px 0 0; align-self: center;
          ">
        </div>
        <div style="display: flex; justify-content: space-between; width: 242px; margin-top: 35px">
          <p style="font-size: 20px; ">
            <span style=" font-weight: bold; ">라떼</span>보호자님
          </p>
          <div style="display: flex; flex-direction: row; justify-content: space-between; align-items: center; width: 53px;">
            <img width="9" height="9" src="./image/star_1.png">
            <img width="9" height="9" src="./image/star_1.png">
            <img width="9" height="9" src="./image/star_1.png">
            <img width="9" height="9" src="./image/star_1.png">
            <img width="9" height="9" src="./image/star_1.png">
          </div>
        </div>
        <div>
          <p style="margin-top: 24px; width: 246px; height: 126px; font-size: 15px; line-height: 26px; color: rgb(77, 80, 85); overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 5; -webkit-box-orient: vertical;">
            저는 집이 캐나다라 이번 여름에 장기적으로 12살 모카를 맡길 곳을 찾다가 펫플래닛이라는걸 알게 되어 처음으로 Jimmy 펫시터님에게 맡겼어요. 교육을 제대로 받지 못한 모카라 많이 힘드셨을텐데 이번 2박 3일동안 많은 신경써주셔서 너무 감사했어요! 모카는 노령견에다 심장이 약해 약까지 복용하고 있는데 약먹는 시간마다 사진을 보내주시고 너무 마음이 놓였어요. 특히나 원래 호텔링에 맡기고 데리러 가면 아주 오랜 시간동안 우는데 이번엔 아예 그런게 없어서 살짝 당황스러웠네요? ㅋㅋㅋㅋ 시터님 너무 감사해요, 8월에도 잘 부탁드려요!!
          </p>
        </div>
        <div style="width: 246px; height: 40px; margin-top: 10px">
          <a href="" style="color: rgb(188, 188, 188); font-size: 15px; font-weight: bold; width: 80px; height: 40px; display: flex; align-items: center;">
            전체보기 &gt;
          </a>
        </div>
      </div>
      <!-- No.2 -->
      <div style="display: flex; flex-direction: column; width: 310px; height: 462px; align-items: center; box-shadow: rgba(0, 0, 0, 0.08) 2px 3px 32px; padding-top: 5px">
        <div>
          <img src="./image/latter_img03.jpeg" alt="" style="width: 298px; height: 168px; border-radius: 5px 5px 0 0; align-self: center;">
        </div>
        <div style="display: flex; justify-content: space-between; width: 242px; margin-top: 35px">
          <p style="font-size: 20px; ">
            <span style=" font-weight: bold; ">콩이</span>보호자님
          </p>
          <div style="display: flex; flex-direction: row; justify-content: space-between; align-items: center; width: 53px;">
            <img width="9" height="9" src="./image/star_1.png">
            <img width="9" height="9" src="./image/star_1.png">
            <img width="9" height="9" src="./image/star_1.png">
            <img width="9" height="9" src="./image/star_1.png">
            <img width="9" height="9" src="./image/star_1.png">
          </div>
        </div>
        <div>
          <p style="margin-top: 24px; width: 246px; height: 126px; font-size: 15px; line-height: 26px; color: rgb(77, 80, 85); overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 5; -webkit-box-orient: vertical;">
            급하게 부탁드렸는데 우리 콩이 너무 예쁘게 잘 보살펴주셔서 감사합니다!!!!! 차에서 딱 내리자마자 공기도 너무 좋고 환경이 너무 좋아 하나가 좋아하겠다 싶었어요 ㅎㅎ 
			사료에도 맛있는 닭가슴살도 뿌려서 주시고 하나한텐 휴가가 아니었을까 싶습니다 ㅎ
			산책도 계속 시켜주시고 집에선 공놀이와 이쁨 듬뿍 주셔서 감사합니다! 일지보면 하나가 편~해 하는게 눈에 보여요 ㅎ 다음에 만나게 되도 좋아할것 같아요!
          </p>
        </div>
        <div style="width: 246px; height: 40px; margin-top: 10px">
          <a href="" style="color: rgb(188, 188, 188); font-size: 15px; font-weight: bold; width: 80px; height: 40px; display: flex; align-items: center;">
            전체보기 &gt;
          </a>
        </div>
      </div>
      <!-- No.3 -->
      <div style="display: flex; flex-direction: column; width: 310px; height: 462px; align-items: center; box-shadow: rgba(0, 0, 0, 0.08) 2px 3px 32px; padding-top: 5px">
        <div>
          <img src="./image/latter_img05.jpg" alt="" style="width: 298px; height: 168px; border-radius: 5px 5px 0 0; align-self: center;">
        </div>
        <div style="display: flex; justify-content: space-between; width: 242px; margin-top: 35px">
          <p style="font-size: 20px; ">
            <span style=" font-weight: bold; ">달이</span>보호자님
          </p>
          <div style="display: flex; flex-direction: row; justify-content: space-between; align-items: center; width: 53px;">
            <img width="9" height="9" src="./image/star_1.png">
            <img width="9" height="9" src="./image/star_1.png">
            <img width="9" height="9" src="./image/star_1.png">
            <img width="9" height="9" src="./image/star_1.png">
            <img width="9" height="9" src="./image/star_1.png">
          </div>
        </div>
        <div>
          <p style="margin-top: 24px; width: 246px; height: 126px; font-size: 15px; line-height: 26px; color: rgb(77, 80, 85); overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 5; -webkit-box-orient: vertical;">
            돌보기 만만치 않은 저희 달이를 가족처럼 돌봐주신 펫시터님과 가족분들께 진심으로 감사드립니다. 덕분에 부모님 모시고 마음놓고 여행다녀 올 수 있었어요. 
			종종 올려주시는 찰스 사진 보면서 마음 편하게 여행 다녀올수 있었습니다. 찰스 데리러 간날 만나뵜던 남편분과 따님을 보고, 허락만 하신다면 다음에 또 맡길일 있을때 주저없이 연락드리고 싶다는 생각도 들었어요.. 가족분들이 저희 찰스를 너무 예뻐하시는게 눈에 선합니다. 돌보기 쉽지 않으셨을텐데 3일간 너무 고생들하셨구요.. 다음에 또 연락드릴때에도 꼭 봐주세요~~~^^; 부탁드립니다... 감사합니다.!!!
          </p>
        </div>
        <div style="width: 246px; height: 40px; margin-top: 10px">
          <a href="" style="color: rgb(188, 188, 188); font-size: 15px; font-weight: bold; width: 80px; height: 40px; display: flex; align-items: center;">
            전체보기 &gt;
          </a>
        </div>
      </div>
      <!-- <div style="display: flex; width: 310px; height: 462px;  justify-content: center; align-items: center;">
        <div style="display: flex; flex-direction: column; justify-content: center; border-radius: 5px; box-shadow: rgba(0, 0, 0, 0.08) 2px 3px 32px; margin-top: 100px; width: 280px;">
          <img src="./image/201601201383025084_1.jpg" alt="" style="width: 270px; height: 150px; border-radius: 5px 5px 0 0; align-self: center;
          margin-top:5px">
          <div style="display: flex; flex-direction: column; justify-content: space-between; align-items: center; align-self: center;">
            <p style="text-align: center; margin-top: 35px; font-size: 21px; ">
              <span style=" font-weight: bold; ">모카</span>보호자님
            </p>
          </div>
          <div style="display: flex; justify-content: center;">
            <p style="margin-top: 24px; width: 246px; height: 126px; font-size: 15px; line-height: 26px; color: rgb(77, 80, 85); overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 5; -webkit-box-orient: vertical;">저는 집이 캐나다라 이번 여름에 장기적으로 12살 모카를 맡길 곳을 찾다가 펫플래닛이라는걸 알게 되어 처음으로 Jimmy 펫시터님에게 맡겼어요. 교육을 제대로 받지 못한 모카라 많이 힘드셨을텐데 이번 2박 3일동안 많은 신경써주셔서 너무 감사했어요! 모카는 노령견에다 심장이 약해 약까지 복용하고 있는데 약먹는 시간마다 사진을 보내주시고 너무 마음이 놓였어요. 특히나 원래 호텔링에 맡기고 데리러 가면 아주 오랜 시간동안 우는데 이번엔 아예 그런게 없어서 살짝 당황스러웠네요? ㅋㅋㅋㅋ 시터님 너무 감사해요, 8월에도 잘 부탁드려요!! </p>
          </div>
          <div style="margin-top: 10px; width: 246px;">
            <a href="" style="color: rgb(188, 188, 188); font-size: 15px; font-weight: bold; width: 80px; height: 40px; display: flex; align-self: center; >전체보기 &gt;</a>
          </div>
        </div>
      </div> -->
    </div>
    <a href="" style="width: 300px; height: 60px; margin-top: 50px; background-color: #71A2FF; border-radius: 26px; margin-bottom: 40px; color: white; display: flex; align-items: center; justify-content: center;">
      <p style="font-size: 18px; margin-bottom: 0; font-weight: bold;"> + 후기 더보기</p>
    </a>
  </div>
  <!-- service_menu -->
  <div class="container-fluid" style="height: 1020px; display: flex; align-items: center; justify-content: center;">
    <div style="width: 1440px; display: flex; justify-content: space-between; padding-left: 210px; padding-right: 152px;">
      <div style="display: flex; align-items: center; justify-content: space-between; flex-grow: 1;">
        <!-- left -->
        <div class="service_section" style="display: flex; flex-direction: column; align-items: center; align-self: center;">
          <p style="font-size: 50px; line-height: 70px; font-weight: bold;">
            앱으로 간편하게
            <br>
            펫시터를 만나요
          </p>
          <ul class="tabs">
            <li class="select-service" rel="tab1" rel1="im1">
              <span>검색하기</span>
            </li>
            <li rel="tab2" rel1="im2">
              <span>예약하기</span>
            </li>
            <li rel="tab3" rel1="im3">
              <span>돌봄일지</span>
            </li>
            <li rel="tab4" rel1="im4">
              <span>대화하기</span>
            </li>
          </ul>
          <div class="tab_container">
            <!-- #tab1 -->
            <p id="tab1" class="tab_content">
              내가 사는 지역과 원하는 날짜를 검색하시면
              <br>
              집 근처에 엄선된 펫시터를 만나볼 수 있어요!
            </p>
            <!-- #tab2 -->
            <p id="tab2" class="tab_content">
              펫시터님의 프로필에서 돌봄 환경 사진과
              <br>
              교육 및 자격증 등을 확인하고 예약해 보세요!
            </p>
            <!-- #tab3 -->
            <p id="tab3" class="tab_content">
              돌봄이 시작되면, 펫시터님이 시간별로 기록한
              <br>
              일지를 사진, 동영상과 함께 실시간으로 받아보세요!
            </p>
            <!-- #tab4 -->
            <p id="tab4" class="tab_content">
              언제든지 돌봄과 관련하여 궁금한 점이 있다면,
              <br>
              앱에서 1:1 채팅으로 펫시터와 대화할 수 있어요!
            </p>
          </div>
        </div>
        <!-- right -->
        <div class="tab_image">
          <img id="im1" class="service_image" src="./image/service-image01.png" alt="">
          <img id="im2" class="service_image" src="./image/service-image02.png" alt="">
          <img id="im3" class="service_image" src="./image/service-image03.png" alt="">
          <img id="im4" class="service_image" src="./image/service-image04.png" alt="">
        </div>
      </div>
    </div>
  </div>
  <!-- diary -->
  <div class="container-fluid" style="height: 1020px; display: flex; align-items: center; justify-content: center; background-color: #5483EC;">
    <div style="width: 1440px; display: flex; justify-content: space-between; padding-left: 210px; padding-right: 152px;">
      <div style="display: flex; align-items: center; justify-content: space-between; flex-grow: 1;">
        <!-- left -->
        <div class="service_section" style="display: flex; flex-direction: column; align-items: center; align-self: center;">
          <p style="font-size: 50px; line-height: 70px; font-weight: bold; color: white;">
            사진·영상으로
            <br>
            생생한 돌봄일지
          </p>
          <p style="font-size: 17px; margin-top: 32px; line-height: 30px; color: white;">
            돌봄이 시작되면 시간별로 아이의 상태와 모습을
            <br>
            사진, 동영상과 함께 기록하여 보내드려요!
          </p>
        </div>
        <!-- right -->
        <div>
          <img src="./image/foot-image01.png" alt="" style="width: 603px; height: 700px;">
        </div>
      </div>
    </div>
  </div>
  <!-- trust -->
  <div class="container-fluid" style="height: 1020px; display: flex; align-items: center; justify-content: center;">
    <div style="width: 1440px; display: flex; justify-content: center; ">
      <div style="display: flex; align-items: center; justify-content: center; flex-direction: column; ">
        <div>
          <p style="display: flex; text-align: center; font-size: 55px; font-weight: bold; color: #555555">
            믿을 수 있고,
            <br>
            안심할 수 있어요
          </p>
        </div>
        <div style="width: 1050px; margin-top: 100px; display: flex; justify-content: space-between;">
          <!-- No.1 -->
          <div style="display: flex; flex-direction: column; align-items: center;">
            <img src="./image/trust_reason_1.png" alt="" style="width: 135px; height: 135px;">
            <p style="line-height: 70px; font-weight: 600; font-size: 20px; text-align: center; margin-top: 50px">
              4단계 신원 및 환경 검증
            </p>
            <p style="text-align: center; line-height: 25px; font-size: 17px;">
              신원 확인과 함께 직접 집에 방문하여
              <br>
              <span style="font-weight: 600;">돌봄 환경의 안정성</span>을 검증합니다.
            </p>
          </div>
          <!-- No.2 -->
          <div style="display: flex; flex-direction: column; align-items: center;">
            <img src="./image/trust_reason_2.png" alt="" style="width: 135px; height: 135px;">
            <p style="line-height: 70px; font-weight: 600; font-size: 20px; text-align: center; margin-top: 50px">
              최고 전문진의 교육 수료
            </p>
            <p style="text-align: center; line-height: 25px; font-size: 17px;">
              TV 동물농장의 <span style="font-weight: 600;">이찬종 훈련사님과</span>
              <br>
              이론 및 실습 교육을 함께합니다.
            </p>
          </div>
          <!-- No.3 -->
          <div style="display: flex; flex-direction: column; align-items: center;">
            <img src="./image/trust_reason_3.png" alt="" style="width: 135px; height: 135px;">
            <p style="line-height: 70px; font-weight: 600; font-size: 20px; text-align: center; margin-top: 50px">
              펫 안전 보험
            </p>
            <p style="text-align: center; line-height: 25px; font-size: 17px;">
              산책 진행 중, 불의의 사고로 반려동물이
              <br>
              다치는 경우, 최대 1000만원까지 보장합니다.
            </p>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- apply -->
  <div class="container-fluid" style="height: 620px; display: flex; align-items: center; justify-content: center; background-color: #FCFCFD;">
    <div style="width: 1440px; display: flex; justify-content: space-between; padding-left: 210px; padding-right: 152px;">
      <div style="display: flex; align-items: center; justify-content: space-between; flex-grow: 1;">
        <!-- left -->
        <div>
          <p style="font-size: 50px; line-height: 70px; font-weight: bold;">
            펫시터 지원해보세요!
          </p>
          <p style="font-size: 17px; margin-top: 32px; line-height: 30px;">
            편안한 우리집에서 원하는 날만 자유롭게
            <br>
            반려동물 돌보며 부수입을 벌어보세요
          </p>
          <a href="" style="width: 170px; height: 60px; background-color: #71A2FF; border-radius: 30px; margin-top: 50px; color: white; display: flex; align-items: center; justify-content: center;">
            <p style="font-size: 18px; margin-bottom: 0;">자세히 보기</p>
          </a>
        </div>
        <!-- right -->
        <div>
          <img src="./image/apply.png" alt="" style="width: 542px; height: 480px;">
        </div>
      </div>
    </div>
  </div>
  <!-- app01 -->
  <div class="container-fluid" style="height: 430px; display: flex; align-items: flex-end; justify-content: center; background-color: #6C9CFB;">
    <div style="display: flex; flex-direction: column; align-items: center;">
      <p style="font-weight: 550; font-size: 35px; text-align: center; color: white; margin-bottom: 0">
        <span style="font-weight: 400; ">방문 펫시터</span>가 필요할 땐?
      </p>
      <a href="" target="_blank">
        <div style="display: flex; align-items: center; margin-top: 50px; padding-bottom: 0;">
          <p style="text-align: center; font-size: 17px; margin-bottom: 0">
            <img src="./image/wayo-logo.png" alt="" style="width: 62px; height: 17px; margin-top: 6px">
            <p style="margin-left: 9px; font-weight: 600; color: white; font-size: 17px; margin-bottom: 0">자세히 보기 ></p>
          </p>
        </div>
      </a>
      <img src="./image/app-section.png" alt="" style="width: 321px;">
    </div>
  </div>
<jsp:include page="./common/foot.jsp" />
</body>
</html>