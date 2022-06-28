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
    <!-- middle(소스 가져옴) -->
    <div style="width: 100%; display: flex; flex-direction: column; align-items: center; padding-top: 130px">
                    <div style="width: 100%; display: flex; flex-direction: column; align-items: center; margin-bottom: 120px">
                      <div style="width: 1024px; display: flex; justify-content: space-between; align-items: center">
                        <p style="font-size: 23px; color: #393c47; letter-spacing: -0.2px; font-weight: 600">모든 펫시터를 만나보세요</p>
                        <a href="/petsitters/list?s_d=1" style="
                            border: 1px solid #81899b;
                            border-radius: 5px;
                            width: 94px;
                            height: 34px;
                            display: flex;
                            align-items: center;
                            justify-content: center;
                          "><p style="font-size: 15px; color: #81899b; display: flex; align-items: center">
                            전체 보기<img src="./image/arrow_right_gray.png" style="width: 7px; height: 11px; margin-left: 6px"></p></a>
                      </div>
                      <div style="width: 1024px; margin-top: 50px; display: flex; justify-content: space-between">
                        <a href="/petsitters/details/z399mb" target="_blank" style="margin-right: 14px"><div>
                            <div style="width: 245px; height: 170px; border-radius: 3px">
                              <img src="https://d1cd60iwvuzqnn.cloudfront.net/page/fd37e21adee1436c8b9341758eafe5d5.jpg" style="width: 245px; height: 170px; border-radius: 3px">
                            </div>
                            <p style="font-size: 13px; letter-spacing: -0.2px; line-height: 20px; color: #383c48; margin-top: 20px">
                              서울 서초구 서초1동
                            </p>
                            <p style="font-size: 16px; letter-spacing: -0.2px; line-height: 20px; color: #383c48; margin-top: 5px">
                              정성을 다해 사랑으로 돌봐드려요
                            </p>
                            <div style="display: flex; margin-top: 10px; width: 80px; justify-content: space-between; align-items: center">
                              <div style="width: 60px; display: flex; justify-content: space-between">
                                <div style="display: flex; flex: 1; justify-content: space-between">
                                  <img src="./image/star_1.png" style="width: 10px; height: 10px"><img src="./image/star_1.png" style="width: 10px; height: 10px"><img src="./image/star_1.png" style="width: 10px; height: 10px"><img src="./image/star_1.png" style="width: 10px; height: 10px"><img src="./image/star_1.png" style="width: 10px; height: 10px">
                                </div>
                              </div>
                              <p style="font-size: 11px; color: #5e636d; letter-spacing: -0.2px; margin-left: 4px">(<!-- -->100<!-- -->)</p>
                            </div>
                          </div></a><a href="/petsitters/details/jaie9x" target="_blank" style="margin-right: 14px"><div>
                            <div style="width: 245px; height: 170px; border-radius: 3px">
                              <img src="https://d1cd60iwvuzqnn.cloudfront.net/resized/page/54052e49d9ee482c9a4b4ae3ac6dac56.jpeg" style="width: 245px; height: 170px; border-radius: 3px">
                            </div>
                            <p style="font-size: 13px; letter-spacing: -0.2px; line-height: 20px; color: #383c48; margin-top: 20px">
                              서울 서초구 반포동
                            </p>
                            <p style="font-size: 16px; letter-spacing: -0.2px; line-height: 20px; color: #383c48; margin-top: 5px">
                              사랑으로 돌봐드리겠습니다❤️
                            </p>
                            <div style="display: flex; margin-top: 10px; width: 80px; justify-content: space-between; align-items: center">
                              <div style="width: 60px; display: flex; justify-content: space-between">
                                <div style="display: flex; flex: 1; justify-content: space-between">
                                  <img src="./image/star_1.png" style="width: 10px; height: 10px"><img src="./image/star_1.png" style="width: 10px; height: 10px"><img src="./image/star_1.png" style="width: 10px; height: 10px"><img src="./image/star_1.png" style="width: 10px; height: 10px"><img src="./image/star_1.png" style="width: 10px; height: 10px">
                                </div>
                              </div>
                              <p style="font-size: 11px; color: #5e636d; letter-spacing: -0.2px; margin-left: 4px">(<!-- -->4<!-- -->)</p>
                            </div>
                          </div></a><a href="/petsitters/details/cgnvdg" target="_blank" style="margin-right: 14px"><div>
                            <div style="width: 245px; height: 170px; border-radius: 3px">
                              <img src="https://d1cd60iwvuzqnn.cloudfront.net/resized/page/ede014a198634e058c55cab16fa36387.jpg" style="width: 245px; height: 170px; border-radius: 3px">
                            </div>
                            <p style="font-size: 13px; letter-spacing: -0.2px; line-height: 20px; color: #383c48; margin-top: 20px">
                              서울 강남구 도곡동
                            </p>
                            <p style="font-size: 16px; letter-spacing: -0.2px; line-height: 20px; color: #383c48; margin-top: 5px">
                              순둥이 동구네로 놀러오세요~~❤
                            </p>
                            <div style="display: flex; margin-top: 10px; width: 80px; justify-content: space-between; align-items: center">
                              <div style="width: 60px; display: flex; justify-content: space-between">
                                <div style="display: flex; flex: 1; justify-content: space-between">
                                  <img src="./image/star_1.png" style="width: 10px; height: 10px"><img src="./image/star_1.png" style="width: 10px; height: 10px"><img src="./image/star_1.png" style="width: 10px; height: 10px"><img src="./image/star_1.png" style="width: 10px; height: 10px"><img src="./image/star_1.png" style="width: 10px; height: 10px">
                                </div>
                              </div>
                              <p style="font-size: 11px; color: #5e636d; letter-spacing: -0.2px; margin-left: 4px">(<!-- -->8<!-- -->)</p>
                            </div>
                          </div></a><a href="/petsitters/details/3lx1bl" target="_blank" style="margin-right: 0"><div>
                            <div style="width: 245px; height: 170px; border-radius: 3px">
                              <img src="https://d1cd60iwvuzqnn.cloudfront.net/resized/page/a27d4fa7302241eda45f17ee4cce96f5.jpg" style="width: 245px; height: 170px; border-radius: 3px">
                            </div>
                            <p style="font-size: 13px; letter-spacing: -0.2px; line-height: 20px; color: #383c48; margin-top: 20px">
                              서울 강남구 논현동
                            </p>
                            <p style="font-size: 16px; letter-spacing: -0.2px; line-height: 20px; color: #383c48; margin-top: 5px">
                              경험과 노하우로 안전한 시팅😉
                            </p>
                            <div style="display: flex; margin-top: 10px; width: 80px; justify-content: space-between; align-items: center">
                              <div style="width: 60px; display: flex; justify-content: space-between">
                                <div style="display: flex; flex: 1; justify-content: space-between">
                                  <img src="./image/star_1.png" style="width: 10px; height: 10px"><img src="./image/star_1.png" style="width: 10px; height: 10px"><img src="./image/star_1.png" style="width: 10px; height: 10px"><img src="./image/star_1.png" style="width: 10px; height: 10px"><img src="./image/star_1.png" style="width: 10px; height: 10px">
                                </div>
                              </div>
                              <p style="font-size: 11px; color: #5e636d; letter-spacing: -0.2px; margin-left: 4px">(<!-- -->4<!-- -->)</p>
                            </div>
                          </div></a>
                      </div>
                    </div>
                    <div style="width: 100%; display: flex; flex-direction: column; align-items: center; margin-bottom: 120px">
                      <div style="width: 1024px; display: flex; justify-content: space-between; align-items: center">
                        <p style="font-size: 23px; color: #393c47; letter-spacing: -0.2px; font-weight: 600">프로 펫시터를 만나보세요</p>
                        <a href="/petsitters/list?s_pp=1" style="
                            border: 1px solid #81899b;
                            border-radius: 5px;
                            width: 94px;
                            height: 34px;
                            display: flex;
                            align-items: center;
                            justify-content: center;
                          "><p style="font-size: 15px; color: #81899b; display: flex; align-items: center">
                            전체 보기<img src="./image/arrow_right_gray.png" style="width: 7px; height: 11px; margin-left: 6px"></p></a>
                      </div>
                      <div style="width: 1024px; margin-top: 50px; display: flex; justify-content: space-between">
                        <a href="/petsitters/details/z399mb" target="_blank" style="margin-right: 14px"><div>
                            <div style="width: 245px; height: 170px; border-radius: 3px">
                              <img src="https://d1cd60iwvuzqnn.cloudfront.net/page/fd37e21adee1436c8b9341758eafe5d5.jpg" style="width: 245px; height: 170px; border-radius: 3px">
                            </div>
                            <p style="font-size: 13px; letter-spacing: -0.2px; line-height: 20px; color: #383c48; margin-top: 20px">
                              서울 서초구 서초1동
                            </p>
                            <p style="font-size: 16px; letter-spacing: -0.2px; line-height: 20px; color: #383c48; margin-top: 5px">
                              정성을 다해 사랑으로 돌봐드려요
                            </p>
                            <div style="display: flex; margin-top: 10px; width: 80px; justify-content: space-between; align-items: center">
                              <div style="width: 60px; display: flex; justify-content: space-between">
                                <div style="display: flex; flex: 1; justify-content: space-between">
                                  <img src="./image/star_1.png" style="width: 10px; height: 10px"><img src="./image/star_1.png" style="width: 10px; height: 10px"><img src="./image/star_1.png" style="width: 10px; height: 10px"><img src="./image/star_1.png" style="width: 10px; height: 10px"><img src="./image/star_1.png" style="width: 10px; height: 10px">
                                </div>
                              </div>
                              <p style="font-size: 11px; color: #5e636d; letter-spacing: -0.2px; margin-left: 4px">(<!-- -->100<!-- -->)</p>
                            </div>
                          </div></a><a href="/petsitters/details/5q2ves" target="_blank" style="margin-right: 14px"><div>
                            <div style="width: 245px; height: 170px; border-radius: 3px">
                              <img src="https://d1cd60iwvuzqnn.cloudfront.net/page/1cb8a755dcff4d5f96b46cb92a1a228e.jpg" style="width: 245px; height: 170px; border-radius: 3px">
                            </div>
                            <p style="font-size: 13px; letter-spacing: -0.2px; line-height: 20px; color: #383c48; margin-top: 20px">
                              서울 강남구 청담동
                            </p>
                            <p style="font-size: 16px; letter-spacing: -0.2px; line-height: 20px; color: #383c48; margin-top: 5px">
                              한강산책 프리미엄 펫시터🐶
                            </p>
                            <div style="display: flex; margin-top: 10px; width: 80px; justify-content: space-between; align-items: center">
                              <div style="width: 60px; display: flex; justify-content: space-between">
                                <div style="display: flex; flex: 1; justify-content: space-between">
                                  <img src="./image/star_1.png" style="width: 10px; height: 10px"><img src="./image/star_1.png" style="width: 10px; height: 10px"><img src="./image/star_1.png" style="width: 10px; height: 10px"><img src="./image/star_1.png" style="width: 10px; height: 10px"><img src="./image/star_1.png" style="width: 10px; height: 10px">
                                </div>
                              </div>
                              <p style="font-size: 11px; color: #5e636d; letter-spacing: -0.2px; margin-left: 4px">(<!-- -->11<!-- -->)</p>
                            </div>
                          </div></a><a href="/petsitters/details/3kz4hi" target="_blank" style="margin-right: 14px"><div>
                            <div style="width: 245px; height: 170px; border-radius: 3px">
                              <img src="https://d1cd60iwvuzqnn.cloudfront.net/page/40fcf70675d74462bbc95e650ef27729.jpg" style="width: 245px; height: 170px; border-radius: 3px">
                            </div>
                            <p style="font-size: 13px; letter-spacing: -0.2px; line-height: 20px; color: #383c48; margin-top: 20px">
                              서울 서초구 반포동
                            </p>
                            <p style="font-size: 16px; letter-spacing: -0.2px; line-height: 20px; color: #383c48; margin-top: 5px">
                              내 아이를 돌보듯 따뜻하고 편안하게
                            </p>
                            <div style="display: flex; margin-top: 10px; width: 80px; justify-content: space-between; align-items: center">
                              <div style="width: 60px; display: flex; justify-content: space-between">
                                <div style="display: flex; flex: 1; justify-content: space-between">
                                  <img src="./image/star_1.png" style="width: 10px; height: 10px"><img src="./image/star_1.png" style="width: 10px; height: 10px"><img src="./image/star_1.png" style="width: 10px; height: 10px"><img src="./image/star_1.png" style="width: 10px; height: 10px"><img src="./image/star_1.png" style="width: 10px; height: 10px">
                                </div>
                              </div>
                              <p style="font-size: 11px; color: #5e636d; letter-spacing: -0.2px; margin-left: 4px">(<!-- -->16<!-- -->)</p>
                            </div>
                          </div></a><a href="/petsitters/details/c8iehy" target="_blank" style="margin-right: 0"><div>
                            <div style="width: 245px; height: 170px; border-radius: 3px">
                              <img src="https://d1cd60iwvuzqnn.cloudfront.net/page/c040fd2fc4c5414ab6a4b93ed2fa6aeb.jpg" style="width: 245px; height: 170px; border-radius: 3px">
                            </div>
                            <p style="font-size: 13px; letter-spacing: -0.2px; line-height: 20px; color: #383c48; margin-top: 20px">
                              서울 강남구 개포동
                            </p>
                            <p style="font-size: 16px; letter-spacing: -0.2px; line-height: 20px; color: #383c48; margin-top: 5px">
                              다양한 노하우로 안전하게!
                            </p>
                            <div style="display: flex; margin-top: 10px; width: 80px; justify-content: space-between; align-items: center">
                              <div style="width: 60px; display: flex; justify-content: space-between">
                                <div style="display: flex; flex: 1; justify-content: space-between">
                                  <img src="./image/star_1.png" style="width: 10px; height: 10px"><img src="./image/star_1.png" style="width: 10px; height: 10px"><img src="./image/star_1.png" style="width: 10px; height: 10px"><img src="./image/star_1.png" style="width: 10px; height: 10px"><img src="./image/star_1.png" style="width: 10px; height: 10px">
                                </div>
                              </div>
                              <p style="font-size: 11px; color: #5e636d; letter-spacing: -0.2px; margin-left: 4px">(<!-- -->39<!-- -->)</p>
                            </div>
                          </div></a>
                      </div>
                    </div>
                    <div style="width: 100%; display: flex; flex-direction: column; align-items: center; margin-bottom: 180px">
                      <div style="width: 1024px; display: flex; justify-content: space-between; align-items: center">
                        <p style="font-size: 23px; color: #393c47; letter-spacing: -0.2px; font-weight: 600">신규 펫시터 10% 할인!</p>
                        <a href="/petsitters/list?s_sp=1" style="
                            border: 1px solid #81899b;
                            border-radius: 5px;
                            width: 94px;
                            height: 34px;
                            display: flex;
                            align-items: center;
                            justify-content: center;
                          "><p style="font-size: 15px; color: #81899b; display: flex; align-items: center">
                            전체 보기<img src="./image/arrow_right_gray.png" style="width: 7px; height: 11px; margin-left: 6px"></p></a>
                      </div>
                      <div style="width: 1024px; margin-top: 50px; display: flex">
                        <a href="/petsitters/details/qlg5kj" target="_blank" style="margin-right: 14px"><div>
                            <div style="width: 245px; height: 170px; border-radius: 3px">
                              <img src="https://d1cd60iwvuzqnn.cloudfront.net/resized/page/8c995eb9f1e4468d81e0404cf1db93cb.jpeg" style="width: 245px; height: 170px; border-radius: 3px">
                            </div>
                            <p style="font-size: 13px; letter-spacing: -0.2px; line-height: 20px; color: #383c48; margin-top: 20px">
                              서울 강남구 압구정동
                            </p>
                            <p style="font-size: 16px; letter-spacing: -0.2px; line-height: 20px; color: #383c48; margin-top: 5px">
                              사랑과 안락함이 넘치는💕
                            </p>
                            <div style="display: flex; margin-top: 10px; width: 80px; justify-content: space-between; align-items: center">
                              <div style="width: 60px; display: flex; justify-content: space-between">
                                <div style="display: flex; flex: 1; justify-content: space-between">
                                  <img src="./image/star_1.png" style="width: 10px; height: 10px"><img src="./image/star_1.png" style="width: 10px; height: 10px"><img src="./image/star_1.png" style="width: 10px; height: 10px"><img src="./image/star_1.png" style="width: 10px; height: 10px"><img src="./image/star_1.png" style="width: 10px; height: 10px">
                                </div>
                              </div>
                              <p style="font-size: 11px; color: #5e636d; letter-spacing: -0.2px; margin-left: 4px">(<!-- -->1<!-- -->)</p>
                            </div>
                          </div></a><a href="/petsitters/details/naw6nv" target="_blank" style="margin-right: 14px"><div>
                            <div style="width: 245px; height: 170px; border-radius: 3px">
                              <img src="https://d1cd60iwvuzqnn.cloudfront.net/resized/page/4d0c63c6b18140058367a4e57a38497a.jpg" style="width: 245px; height: 170px; border-radius: 3px">
                            </div>
                            <p style="font-size: 13px; letter-spacing: -0.2px; line-height: 20px; color: #383c48; margin-top: 20px">
                              서울 동작구 상도동
                            </p>
                            <p style="font-size: 16px; letter-spacing: -0.2px; line-height: 20px; color: #383c48; margin-top: 5px">
                              편안한 가족처럼❤
                            </p>
                            <div style="display: flex; margin-top: 10px; width: 80px; justify-content: space-between; align-items: center">
                              <div style="width: 60px; display: flex; justify-content: space-between">
                                <div style="display: flex; flex: 1; justify-content: space-between">
                                  <img src="./image/star_1.png" style="width: 10px; height: 10px"><img src="./image/star_1.png" style="width: 10px; height: 10px"><img src="./image/star_1.png" style="width: 10px; height: 10px"><img src="./image/star_1.png" style="width: 10px; height: 10px"><img src="./image/star_1.png" style="width: 10px; height: 10px">
                                </div>
                              </div>
                              <p style="font-size: 11px; color: #5e636d; letter-spacing: -0.2px; margin-left: 4px">(<!-- -->0<!-- -->)</p>
                            </div>
                          </div></a><a href="/petsitters/details/dlhnze" target="_blank" style="margin-right: 14px"><div>
                            <div style="width: 245px; height: 170px; border-radius: 3px">
                              <img src="https://d1cd60iwvuzqnn.cloudfront.net/resized/page/97ea143c5da94e0b8c0f542b13c148d1.jpg" style="width: 245px; height: 170px; border-radius: 3px">
                            </div>
                            <p style="font-size: 13px; letter-spacing: -0.2px; line-height: 20px; color: #383c48; margin-top: 20px">
                              서울 마포구 도화동
                            </p>
                            <p style="font-size: 16px; letter-spacing: -0.2px; line-height: 20px; color: #383c48; margin-top: 5px">
                              포근하고 다정한 펫시팅❤
                            </p>
                            <div style="display: flex; margin-top: 10px; width: 80px; justify-content: space-between; align-items: center">
                              <div style="width: 60px; display: flex; justify-content: space-between">
                                <div style="display: flex; flex: 1; justify-content: space-between">
                                  <img src="./image/star_1.png" style="width: 10px; height: 10px"><img src="./image/star_1.png" style="width: 10px; height: 10px"><img src="./image/star_1.png" style="width: 10px; height: 10px"><img src="./image/star_1.png" style="width: 10px; height: 10px"><img src="./image/star_1.png" style="width: 10px; height: 10px">
                                </div>
                              </div>
                              <p style="font-size: 11px; color: #5e636d; letter-spacing: -0.2px; margin-left: 4px">(<!-- -->0<!-- -->)</p>
                            </div>
                          </div></a><a href="/petsitters/details/e8dphm" target="_blank" style="margin-right: 0"><div>
                            <div style="width: 245px; height: 170px; border-radius: 3px">
                              <img src="https://d1cd60iwvuzqnn.cloudfront.net/resized/page/de0e82c5810146c980687890866adfa4.jpeg" style="width: 245px; height: 170px; border-radius: 3px">
                            </div>
                            <p style="font-size: 13px; letter-spacing: -0.2px; line-height: 20px; color: #383c48; margin-top: 20px">
                              서울 송파구 가락동
                            </p>
                            <p style="font-size: 16px; letter-spacing: -0.2px; line-height: 20px; color: #383c48; margin-top: 5px">
                              보리와 함께 생활하는 공간❤
                            </p>
                            <div style="display: flex; margin-top: 10px; width: 80px; justify-content: space-between; align-items: center">
                              <div style="width: 60px; display: flex; justify-content: space-between">
                                <div style="display: flex; flex: 1; justify-content: space-between">
                                  <img src="./image/star_1.png" style="width: 10px; height: 10px"><img src="./image/star_1.png" style="width: 10px; height: 10px"><img src="./image/star_1.png" style="width: 10px; height: 10px"><img src="./image/star_1.png" style="width: 10px; height: 10px"><img src="./image/star_1.png" style="width: 10px; height: 10px">
                                </div>
                              </div>
                              <p style="font-size: 11px; color: #5e636d; letter-spacing: -0.2px; margin-left: 4px">(<!-- -->0<!-- -->)</p>
                            </div>
                          </div></a>
                      </div>
                    </div>
                  </div>
<!-- <div style="width: 100%; height: 2488px;"></div> -->
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
