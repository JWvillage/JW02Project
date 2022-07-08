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
  <script src="./common/jquery/jquery-3.6.0.js"></script>
  <!-- ajax -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
  <!-- icon -->
  <script src="https://kit.fontawesome.com/54b3b8eebf.js" crossorigin="anonymous"></script>
  <title>PetSitterApply</title>
</head>
<body>
<style>
	* {
		font-family: SpoqaHanSans;
	}
	a {
		text-decoration: none;
	}
	p {
		margin-bottom: 0
	}
	input[type='text'] {
		font-family: 'BM JUA_TTF';
	}
	textarea {
		font-size: 1.2em; 
		width: 100%; 
		height: 350px;
		border: 1px solid #cccccc;
		font-family: 'BM JUA_TTF'; 
		resize:none;
		min-height: 18rem;
    	overflow-y: hidden;
	}
</style>
<script>
    function emailCheck(form) {
    	var email_check = document.getElementById("email_check");
    	var email_val = form.email.value;
    	var symbol01 = 0;
    	var symbol02 = 0;
    	for (var i = 0; i < email_val.length; i++) {
			if(email_val[i] == '@') {
				symbol01++;
				console.log("symbol01 : " + symbol01);
			}
			if(email_val[i] == '.') {
				symbol02++;
				console.log("symbol02 : " + symbol02);
			}
    	}
    	
    	if(symbol01 != 1 || symbol02 != 1) {
    		email_check.innerHTML = "이메일 형식을 지켜주세요"
    		email_check.style.color = "red"
    	} else {
    		email_check.innerHTML = '';
    	}
    }
    
    /* textarea 높이 자동조절 */
    function resize(obj) {
        obj.style.height = '1px';
        obj.style.height = (12 + obj.scrollHeight) + 'px';
    }
</script>
<jsp:include page="./common/header.jsp" />
<!-- petsitter_applyform -->
<form id="applyFrm" action="/J03Project/PetPlanet/apply" method="POST" onsubmit="">
  <div style="display: flex; flex-direction: column; align-items: center; ">
    <div style="border: 1px solid gray; width:1500px; height: 1300px; border-radius: 30px; margin-top: 180px; left: 40%; margin-bottom: 280px; box-shadow: rgba(0, 0, 0, 0.65) 0px 2px 20px;">
      <div style="display: flex; justify-content: space-between; align-items: center; ">
        <!-- left -->
        <div style="color: white; background-color: #81A3F0; width: 50%; height: 1300px; border-radius: 30px 0 0 30px; display: flex; justify-content: center; flex-direction: column; align-items: center;">
          
          <p style="font-size: 100px; line-height: 120px; font-weight: bold; color: white;">
            Let's Apply!
            <br>
            펫 시터!
          </p>
          <p style="font-size: 30px; line-height: 50px; margin-top: 150px; font-weight: bold; color: white;">
            좋은 시터가 되어 주실 분들
            <br>
            언제든지 지원 해주세요!
          </p>
          <p>${ idDup }</p>
          <p style="font-size: 20px; margin-top: 300px; line-height: 30px; color: white;">
            <a href="main.html" style="color: white;">petplanet.co</a>
          </p>
        </div>
        <!-- right -->
        <div style="background-color: white; width: 50%; height: 1300px; border-radius: 0 30px 30px 0; display: flex; justify-content: center; flex-direction: column; align-items: center; box-shadow: rgba(0, 0, 0, 0.65) 0px 2px 20px;">
          <div style="margin-bottom: 30px">
            <img src="./image/Login_Main_logo03.png" alt="" style="width: 250px;">
          </div>
          <!-- send -->
          <div>
            <p style="margin-left: 10px; font-size: 20px; font-weight: 600;">보내는 사람</p>
            <div style="width: 475px; height: 59px; display: flex; align-items: center; border: 1px solid #cccccc; margin-top: 10px; padding: 0 24px 0 17px">
              <div>
                <img src="./image/id_icon01.png" alt="" style="width: 35px; height: 30px;">
              </div>
              <div>
                <input
                  id="from"
                  name="from"
                  type="text"
                  style="width: 350px; height: 52px; border: 0; margin: 0px 12px; padding: 1px 2px; outline: none; font-family: 'BM JUA_TTF'"
                  value="gnsl0127@naver.com"
                  readonly
                />
              </div>
            </div>
          </div>
          <!-- receive -->
          <div style="margin-top: 20px;">
            <p style="margin-left: 10px; font-size: 20px; font-weight: 600;">받는 사람</p>
            <div style="width: 475px; height: 59px; display: flex; align-items: center; border: 1px solid #cccccc; padding: 0 24px 0 17px; margin-top: 10px;">
              <div>
                <img src="./image/id_icon01.png" alt="" style="width: 35px; height: 30px;">
              </div>
              <div>
                <input
                  id="to"
                  name="to"
                  type="text"
                  style="width: 350px; height: 52px; border: 0; margin: 0px 12px; padding: 1px 2px; outline: none; font-family: 'BM JUA_TTF'"
                />
              </div>
            </div>
          </div>
          <!-- subject -->
          <div style="margin-top: 20px;">
            <p style="margin-left: 10px; font-size: 20px; font-weight: 600;">제목</p>
            <div style="width: 475px; height: 59px; display: flex; align-items: center; border: 1px solid #cccccc; padding: 0 24px 0 17px; margin-top: 10px;">
              <div>
                <img src="./image/id_icon01.png" alt="" style="width: 35px; height: 30px;">
              </div>
              <div>
                <input
                  id="subject"
                  name="subject"
                  type="text"
                  style="width: 350px; height: 52px; border: 0; margin: 0px 12px; padding: 1px 2px; outline: none; font-family: 'BM JUA_TTF'"
                />
              </div>
            </div>
          </div>
          <!-- apply -->
          <div style="margin-top: 20px; width: 475px">
            <p style="margin-left: 10px; font-size: 20px; font-weight: 600;">답변</p>
          	<input type="radio" name="format" value="html" style="margin-left: 10px" checked /> HTML
          	<input type="radio" name="format" value="text" style="margin-left: 10px" /> TEXT
            <div style="margin-top: 10px;">
            	<textarea id="content" name="content" style="padding: 0 12px" onkeydown="resize(this)"></textarea>
            </div>
          </div>
          <!-- Login -->
          <div style="display: flex; align-items: center; justify-content: space-between; margin-top: 20px; width: 450px">
            <div>
              <p style="font-size: 30px; font-weight: bold;">지원하기</p>
            </div>
            <button type="submit" style="width: 60px; height: 60px; background-color: #71A2FF; border-radius: 30px; color: white; display: flex; align-items: center; justify-content: center; border: 0">
              <i class="fa-solid fa-arrow-right-long"></i>
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</form>
<jsp:include page="./common/foot.jsp" />
</body>
</html>