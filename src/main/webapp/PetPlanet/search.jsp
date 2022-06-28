<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.2/font/bootstrap-icons.css" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/54b3b8eebf.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <title>Petsitters</title>
    <style>
      * {
        font-family: SpoqaHanSans,'BM JUA_TTF', sans-serif;
      }
      p {
        margin-bottom: 0
      }
      a {
        text-decoration: none;
      }
    </style>
    <script>

      $(function() {
	      $.datepicker.setDefaults({
	        dateFormat: 'yy-mm-dd',
	        prevText: '이전 달',
	        nextText: '다음 달',
	        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	        showMonthAfterYear: true,
	        changeMonth: true,
	        changeYear: true,
	        yearSuffix: '년',
	        minDate: 'D',
	      });
	      
        $('#startDate, #endDate').datepicker({
          numberOfMonths: [1,2],
        });
        
        $('#cal_img').datepicker({
          numberOfMonths: [1,2],
        });
      });
      /* option */
      function option_check01() {
        var no_pet = document.getElementById('no_pet');
        if (no_pet.style.borderColor == 'rgb(223, 227, 234)') {
          no_pet.style.borderColor = '#71A2FF';
          no_pet.style.color = '#71A2FF';
        } else {
          no_pet.style.borderColor = 'rgb(223, 227, 234)';
          no_pet.style.color = 'rgb(187, 193, 204)';
        }
      }
      function option_check02() {
        var pick_up = document.getElementById('pick_up');
        if (pick_up.style.borderColor == 'rgb(223, 227, 234)') {
          pick_up.style.borderColor = '#71A2FF';
          pick_up.style.color = '#71A2FF';
        } else {
          pick_up.style.borderColor = 'rgb(223, 227, 234)';
          pick_up.style.color = 'rgb(187, 193, 204)';
        }
      }
      function option_check03(){
        var big = document.getElementById('big');
        if (big.style.borderColor == 'rgb(223, 227, 234)') {
          big.style.borderColor = '#71A2FF';
          big.style.color = '#71A2FF';
        } else {
          big.style.borderColor = 'rgb(223, 227, 234)';
          big.style.color = 'rgb(187, 193, 204)';
        }
      }
      function option_check04(){
        var space = document.getElementById('space');
        if (space.style.borderColor == 'rgb(223, 227, 234)') {
          space.style.borderColor = '#71A2FF';
          space.style.color = '#71A2FF';
        } else {
          space.style.borderColor = 'rgb(223, 227, 234)';
          space.style.color = 'rgb(187, 193, 204)';
        }
      }
      function option_check05(){
        var old_care = document.getElementById('old_care');
        if (old_care.style.borderColor == 'rgb(223, 227, 234)') {
          old_care.style.borderColor = '#71A2FF';
          old_care.style.color = '#71A2FF';
        } else {
          old_care.style.borderColor = 'rgb(223, 227, 234)';
          old_care.style.color = 'rgb(187, 193, 204)';
        }
      }
    </script>
  </head>
  <body>
 <jsp:include page="./common/header.jsp" />
    <!-- main_menu -->
    <div style="display: flex; justify-content: center; flex-direction: column; padding-top: 180px; padding-bottom:85px; align-items: center; box-shadow: rgba(0, 0, 0, 0.05) 0px 2px 20px;">
      <div style="display: flex; justify-content: space-between; width: 1024px">
        <div style="margin-right: 48px;">
          어디에 사시나요?
          <div  style="width: 475px; height: 59px; display: flex; align-items: center; border: 1px solid #cccccc; padding: 0 24px 0 17px; margin-top:27px; padding: 0 24px 0 17px">
            <div>
              <i class="fa-solid fa-magnifying-glass"></i>
            </div>
            <div>
              <input
                id=""
                type="text"
                placeholder="동 이름을 검색하세요 (예. 논현동)"
                style="width: 350px; height: 52px; border: 0; margin: 0px 12px; padding: 1px 2px"
              />
            </div>
          </div>
        </div>
        <div>
          언제 맡기시나요?
          <div style="width: 475px; height: 59px; display: flex; align-items: center; border: 1px solid #cccccc; padding: 0 24px 0 17px; margin-top: 27px;">
            <!-- DatePicker -->
            <input id="cal_img" type="image" style="border: 0; background-color: white; width: 30px; height: 30px" src="./image/calendar.png"/>
              <!-- <img src="/image/calendar.png" style="width: 30px; height: 30px" /> -->
            <div style="display: flex; align-items: center">
              <input
                type="text"
                id="startDate"
                name="startDate"
                placeholder="체크인 날짜"
                autocomplete="off"
                aria-describedby="DateInput__screen-reader-message-startDate"
                style="border: 0; outline: 0; width: 150px; height: 46px; padding: 11px 11px 9px; margin: 0 0 0 20px"
              />
              <div style="width: 30px; padding-left: 15px">
                <img width="15" height="10" src="./image/arrow-calendar.png" />
              </div>
              <div>
                <input
                  type="text"
                  id="endDate"
                  name="endDate"
                  placeholder="체크아웃 날짜"
                  autocomplete="off"
                  aria-describedby="DateInput__screen-reader-message-endDate"
                  style="border: 0; outline: 0; width: 150px; height: 46px; padding: 11px 11px 9px; margin: 0 0 0 20px"
                />
              </div>
            </div>
          </div>
        </div>
      </div>
      <div style="display: flex; flex-direction: column; width:1024px; margin-top: 70px;">
        <p style="margin-bottom: 27px;">
          원하시는 조건을 선택하세요
        </p> 
        <div style="display: flex; justify-content: space-between; ">
          <div style="display: flex; justify-content: space-between; width: 712px;">
            <a href="javascript:option_check01();" id="no_pet" style="width: 150px; height: 55px; display: flex; align-items: center; justify-content: center; border: 1.5px solid rgb(223, 227, 234); border-radius: 28px; box-shadow: rgba(0, 0, 0, 0.03) 0px 2px 3px 0px; color: rgb(187, 193, 204)">
              <p style="font-size: 15px; font-weight: 600;">반려동물 없음</p>
            </a>
            <a href="javascript:option_check02();" id="pick_up" style="width: 122px; height: 55px; display: flex; align-items: center; justify-content: center; border: 1.5px solid rgb(223, 227, 234); border-radius: 28px; box-shadow: rgba(0, 0, 0, 0.03) 0px 2px 3px 0px; color: rgb(187, 193, 204);">
              <p style="font-size: 15px; font-weight: 600; ">픽업 가능</p>
            </a>
            <a href="javascript:option_check03();" id="big" style="width: 136px; height: 55px; display: flex; align-items: center; justify-content: center; border: 1.5px solid rgb(223, 227, 234); border-radius: 28px; box-shadow: rgba(0, 0, 0, 0.03) 0px 2px 3px 0px; color: rgb(187, 193, 204);">
              <p style="font-size: 15px; font-weight: 600; ">대형견 가능</p>
            </a>
            <a href="javascript:option_check04();" id="space" style="width: 122px; height: 55px; display: flex; align-items: center; justify-content: center; border: 1.5px solid rgb(223, 227, 234); border-radius: 28px; box-shadow: rgba(0, 0, 0, 0.03) 0px 2px 3px 0px; color: rgb(187, 193, 204);">
              <p style="font-size: 15px; font-weight: 600; ">마당 있음</p>
            </a>
            <a href="javascript:option_check05();" id="old_care" style="width: 122px; height: 55px; display: flex; align-items: center; justify-content: center; border: 1.5px solid rgb(223, 227, 234); border-radius: 28px; box-shadow: rgba(0, 0, 0, 0.03) 0px 2px 3px 0px; color: rgb(187, 193, 204);">
              <p style="font-size: 15px; font-weight: 600; ">노견 케어</p>
            </a>
          </div>
        </div>
      </div>
    </div>
    <!-- middle -->
    <div style="width: 100%; height: 2488px;"></div>
  <!-- app02 -->
  <div class="container-fluid" style="height: 430px; display: flex; align-items: flex-end; justify-content: center; background-color: #6C9CFB;">
    <div style="width: 1440px; display: flex; justify-content: space-between; padding-left: 210px; padding-right: 152px;">
      <div style="display: flex; align-items: center; justify-content: space-between; flex-grow: 1;">
        <!-- left -->
        <div style="display: flex; flex-direction: column; align-items: center; align-self: center;">
          <p style="font-size: 38px; line-height: 55px; font-weight: bold; color: white;">
            모바일 앱 다운받고
            <br>
            우리 동네 펫시터 찾기
          </p>
          <div style="display: flex; margin-bottom: 70px; margin-top: 38px;">
            <a href="https://play.google.com/store/apps/details?id=co.petpeople.petplanet">
              <div style="display: flex; align-items: center; justify-content: center; border: 1px solid white; width: 152px; height: 52px; border-radius: 7px; margin-right: 20px;">
                <p style="font-size: 15px; font-weight: 600; color: white; letter-spacing: 0.2px;">Google Play</p>
              </div>
            </a>
            <a href="https://apps.apple.com/us/app/%ED%8E%AB%ED%94%8C%EB%9E%98%EB%8B%9B/id1343097834?amp%3Bls=1&amp%3Bmt=8&l=ko">
              <div style="display: flex; align-items: center; justify-content: center; border: 1px solid white; width: 152px; height: 52px; border-radius: 7px;">
                <p style="font-size: 15px; font-weight: 600; color: white; letter-spacing: 0.2px;">App Store</p>
              </div>
            </a>
          </div>
        </div>
        <!-- right -->
        <div>
          <img src="./image/app-section2.png" alt="" style="width: 435px; height: 350px;">
        </div>
      </div>
    </div>
  </div>
<jsp:include page="./common/foot.jsp" />
  </body>
</html>
