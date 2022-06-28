<%@page import="utils.CookieManager"%>
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
<title>Pw_Search</title>
</head>
<body>
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
	/* header */
	.top{
	  width: 100%;
	  height: 85px;
	  position: fixed;
	  display: flex;
	  justify-content: center;
	  align-items: center;
	}
	#header_t.active{
	  background-color: white;
	  opacity: 90%;
	}
	.top .layout{
	  margin-left: 214px;
	  margin-right: 220px;
	  width: 2000px;
	  height: 100px;
	  /* background-color: white; */
	  display: flex; 
	  justify-content: space-between;
	  align-items: center;
	}
	a.header_link{
	  color: #4D505A;
	  padding: 0 10px;
	  width: 100px;
	  text-align: center;
	  text-decoration: none;
	  margin: 10px;
	  opacity: 100%;
	}
	input[type=password] {
   		font-family: '나눔고딕';
   	}
   	input[type=text] {
   		font-family: '나눔고딕';
   	}
</style>
<script>
  function checkSearchForm(fm) {
    var email_ch = document.getElementById('email_ch');
    var name_ch = document.getElementById('name_ch');
    if(!fm.search_email.value) {
      email_ch.style.color = 'red'
      email_ch.innerHTML = "이메일을 입력하세요!"
      fm.search_email.focus();
      return false;
    } 
    if(fm.search_name.value == '') {
      name_ch.style.color = 'red'
      name_ch.innerHTML = "이름을 입력하세요!"
      fm.search_name.focus();
      return false;
    }
  }
  
	function email_SearchMessage(fm) {
	    var email_ch = document.getElementById('email_ch');
	  	if(fm.search_email.value != '') {
			email_ch.innerHTML = '';
		}
	}
	
	function nameMessage(fm) {
	    var name_ch = document.getElementById('name_ch');
	  	if(fm.search_name.value != '') {
	  		name_ch.innerHTML = '';
	  	}
	}
</script>
<jsp:include page="./common/header.jsp" />
<!-- pw_Search Form -->
<form action="/J03Project/PetPlanet/IdSearch" method="post" onsubmit="return checkSearchForm(this);">
  <div class="Search_Form" id="Search_Form" style="display: flex; flex-direction: column; padding-top: 100px; align-items: center;">
    <div id="Search_Form01" style="border: 1px solid gray; width:1500px; height: 850px; border-radius: 30px; box-shadow: rgba(0, 0, 0, 0.65) 0px 2px 20px;">
      <div style="display: flex; justify-content: space-between; align-items: center; ">
        <!-- left -->
        <div style="color: white; background-color: #81A3F0; width: 50%; height: 850px; border-radius: 30px 0 0 30px; display: flex; justify-content: center; flex-direction: column; align-items: center;">
          
          <p style="font-size: 100px; line-height: 120px; font-weight: bold; color: white;">
            WELCOME
            <br>
            펫 플래닛!
          </p>
          <p style="font-size: 30px; line-height: 40px; margin-top: 80px; font-weight: bold; color: white;">
            끝까지 완벽하게 케어하는
            <br>
            펫 플래닛에 맡겨 주세요!
          </p>
          <p style="font-size: 20px; margin-top: 80px; line-height: 30px; color: white;">
            <a href="/J03Project/petplanet.do" style="color: white;">petplanet.do</a>
          </p>
        </div>
        <!-- right -->
        <div style="background-color: white; width: 50%; height: 850px; border-radius: 0 30px 30px 0; display: flex; justify-content: center; flex-direction: column; align-items: center; box-shadow: rgba(0, 0, 0, 0.65) 0px 2px 20px;">
          <div>
            <img src="/J03Project/PetPlanet/image/Login_Main_logo03.png" alt="" style="width: 250px;">
          </div>
          <!-- email -->
          <div>
            <p style="margin-left: 10px; font-size: 20px; font-weight: 600;">아이디</p>
            <div style="width: 475px; height: 59px; display: flex; align-items: center; border: 1px solid #cccccc; margin-top: 10px; padding: 0 0 0 17px">
              <div>
                <img src="/J03Project/PetPlanet/image/id_icon01.png" alt="" style="width: 35px; height: 30px;">
              </div>
              <div>
                <input
                  id="search_email"
                  name="search_email"
                  type="text"
                  placeholder="이메일을 입력하세요!"
                  style="width: 320px; height: 52px; border: 0; margin: 0px 12px; padding: 1px 2px; outline: none;"
                  onblur="email_SearchMessage(this.form);"
                />
              </div>
            </div>
            <div style="margin-top: 5px;">
              <p><span id="email_ch" style="color: skyblue"></span></p>
            </div>
          </div>
          <!-- name -->
          <div style="margin-top: 50px;">
            <p style="margin-left: 10px; font-size: 20px; font-weight: 600;">이름</p>
            <div  style="width: 475px; height: 59px; display: flex; align-items: center; border: 1px solid #cccccc; padding: 0 0 0 17px; margin-top: 10px;">
              <div>
                <img src="/J03Project/PetPlanet/image/id_icon01.png" alt="" style="width: 35px; height: 30px;">
              </div>
              <div>
                <input
                	id="search_name"
                	name="search_name"
	                type="text"
	                placeholder="이름을 입력하세요!"
	                style="width: 350px; height: 52px; border: 0; margin: 0px 12px; padding: 1px 2px; outline: none;"
	                onblur="nameMessage(this.form);"
                />
              </div>
              <div>
                <img src="/J03Project/PetPlanet/image/pw_icon_fail.png" alt="" style="width: 43px; height: 40px;">
              </div>
            </div>
            <div style="margin-top: 5px;">
              <p><span id="name_ch" style="color: skyblue"></span></p>
            </div>
          </div>
			<div style="margin-top: 5px;">
				<p><span id="login_check" style="color: red"></span></p>
			</div>
          <!-- Search -->
          <div style="display: flex; align-items: center; justify-content: space-between; margin-top: 50px; width: 450px">
            <div>
              <p style="font-size: 30px; font-weight: bold;">아이디 찾기</p>
            </div>
            <button type="submit" style="width: 60px; height: 60px; background-color: #71A2FF; border-radius: 30px; color: white; display: flex; align-items: center; justify-content: center; border: 0">
              <i class="fa-solid fa-arrow-right-long"></i>
            </button>
          </div>
          <!-- search -->
          <div style="display: flex; justify-content: space-between; width: 450px; margin-top: 50px">
            <a href="/J03Project/PetPlanet/regist" style="color: black;">회원가입</a>
            <a href="/J03Project/PetPlanet/pw_Search.jsp" style="color: red;">비밀번호 찾기</a>
          </div>
        </div>
      </div>
    </div>
  </div>
</form>
<jsp:include page="./common/foot.jsp" />
</body>
</html>