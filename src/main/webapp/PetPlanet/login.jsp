<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%@page import="utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
// loginId 라는 이름의 쿠키를 읽어온다.
String loginId = CookieManager.readCookie(request, "loginId");

// 앞에서 읽어온 쿠키값이 있다면 checked 속성값을 변수에 설정한다.
String cookieCheck = "";
if(!loginId.equals("")) {
	cookieCheck = "checked";
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <!-- bootstrap CDN -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
  <!-- jQuery -->
  <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
  <!-- ajax -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
  <!-- icon -->
  <script src="https://kit.fontawesome.com/54b3b8eebf.js" crossorigin="anonymous"></script>
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

  function checkLogForm(fm) {
    var id_check = document.getElementById('id_check');
    var pw_check = document.getElementById('pw_check');
    if(!fm.id.value) {
      id_check.style.color = 'red'
      id_check.innerHTML = "아이디를 입력하세요!"
      fm.id.focus();
      return false;
    } 
    if(!fm.password.value) {
      pw_check.style.color = 'red'
      pw_check.innerHTML = "비밀번호를 입력하세요!"
      fm.password.focus();
      return false;
    }
  }
  
	function idMessage(fm) {
	    var id_check = document.getElementById('id_check');
	  	if(fm.id.value != '') {
			id_check.innerHTML = '';
		}
	}
	
	function pwMessage(fm) {
	    var pw_check = document.getElementById('pw_check');
	  	if(fm.password.value != '') {
	  		pw_check.innerHTML = '';
	  	}
	}
</script>
<!-- 네이버 스크립트 -->
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<!-- Login Form -->
<form action="/J03Project/PetPlanet/Login" method="post" onsubmit="return checkLogForm(this);">
  <div class="Login_Form" id="Login_Form" style="display: flex; flex-direction: column; align-items: center;">
    <div id="Login_Form01" style="border: 1px solid gray; width:1500px; height: 850px; border-radius: 30px; z-index: 99999999; position: absolute; top: 30px; left: 14.5%; box-shadow: rgba(0, 0, 0, 0.65) 0px 2px 20px;">
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
          <!-- Id -->
          <div>
            <p style="margin-left: 10px; font-size: 20px; font-weight: 600;">아이디</p>
            <div style="width: 475px; height: 59px; display: flex; align-items: center; border: 1px solid #cccccc; margin-top: 10px; padding: 0 0 0 17px">
              <div>
                <img src="/J03Project/PetPlanet/image/id_icon01.png" alt="" style="width: 35px; height: 30px;">
              </div>
              <div>
                <input
                  id="user_id"
                  name="id"
                  type="text"
                  placeholder="아이디를 입력하세요!"
                  style="width: 320px; height: 52px; border: 0; margin: 0px 12px; padding: 1px 2px; outline: none;"
                  onblur="idMessage(this.form);"
                  value="<%= loginId %>"
                />
              </div>
              <input type="checkbox" name="save_check" value="Y" <%= cookieCheck %> tabindex="3" style="margin-right: 5px"/>
              <p style="font-size: 12px; margin: 0">ID 기억</p>
            </div>
            <div style="margin-top: 5px;">
              <p><span id="id_check" style="color: skyblue"></span></p>
            </div>
          </div>
          <!-- Password -->
          <div style="margin-top: 30px;">
            <p style="margin-left: 10px; font-size: 20px; font-weight: 600;">비밀번호</p>
            <div  style="width: 475px; height: 59px; display: flex; align-items: center; border: 1px solid #cccccc; padding: 0 24px 0 17px; margin-top: 10px;">
              <div>
                <img src="/J03Project/PetPlanet/image/id_icon01.png" alt="" style="width: 35px; height: 30px;">
              </div>
              <div>
                <input
                	id="pass2"
                	name="password"
	                type="password"
	                placeholder="비밀번호를 입력하세요!"
	                style="width: 350px; height: 52px; border: 0; margin: 0px 12px; padding: 1px 2px; outline: none;"
	                onblur="pwMessage(this.form);"
                />
              </div>
              <div>
                <img src="/J03Project/PetPlanet/image/pw_icon_fail.png" alt="" style="width: 43px; height: 40px;">
              </div>
            </div>
            <div style="margin-top: 5px;">
              <p><span id="pw_check" style="color: skyblue"></span></p>
            </div>
          </div>
			<div style="margin-top: 5px;">
				<p><span id="login_check" style="color: red"></span></p>
			</div>

		    <div style="display: flex; align-items: center; justify-content: space-between; margin-top: 30px; width: 450px">
		    
		    <%
			    String clientId = "U9I7zy8HU6FYjYNSOeBV";//애플리케이션 클라이언트 아이디값";
			    String redirectURI = URLEncoder.encode("http://localhost:8088/J03Project/PetPlanet/Login", "UTF-8");
			    SecureRandom random = new SecureRandom();
			    String state = new BigInteger(130, random).toString();
			    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
			    apiURL += "&client_id=" + clientId;
			    apiURL += "&redirect_uri=" + redirectURI;
			    apiURL += "&state=" + state;
			    session.setAttribute("state", state);
			%>
			  	<a href="<%=apiURL%>"><img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>
	            <a id="naverIdLogin_loginButton" href="javascript:void(0)" style="width: 200px; height: 60px; background-color: #71A2FF; border-radius: 30px; color: white; display: flex; align-items: center; justify-content: center; border: 0">
	              네이버 로그인
	            </a>
	            
	            <button type="submit" style="width: 200px; height: 60px; background-color: #71A2FF; border-radius: 30px; color: white; display: flex; align-items: center; justify-content: center; border: 0">
	              구글 로그인
	            </button>
            </div>
            <!-- 네이버 로그인 스크립트 -->
<!--    			<script>
	   		//네이버 로그인
   			$(function(){
   			    var naverLogin = new naver.LoginWithNaverId({
   			        clientId: "U9I7zy8HU6FYjYNSOeBV",
   			        callbackUrl: "http://localhost:8088/J03Project/PetPlanet/Login",
   					naver_name : naverLogin,
   			        isPopup: false,
   			        callbackHandle: true
   			    });
   			    naverLogin.init();
   				
   				naverLogin.getLoginStatus(function(status) {
   					if (status) {
						var email = naverLogin.user.getEmail(); // 필수로 설정할것을 받아와 아래처럼 조건문을 줍니다.
						var name = naverLogin.user.getName(); // 필수로 설정할것을 받아와 아래처럼 조건문을 줍니다.
			    		
						console.log(naverLogin.user.name, naverLogin.user.email);
						$('#naver_name').val(name);
						$('#naver_email').val(email);
					
						console.log($('#naver_name').val());
						
			            if( email == undefined || email == null) {
							alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
							naverLogin.reprompt();
							return;
						}
			            if( name == undefined || name == null) {
							alert("이름은 필수정보입니다. 정보제공을 동의해주세요.");
							naverLogin.reprompt();
							return;
						}
					} else {
						console.log("callback 처리에 실패하였습니다.");
					}
   				})
   			})//e.o.naver

			</script> -->
          <!-- Login -->
          	<input type="hid-den" id="naver_name" name="naver_name" />
        	<input type="hid-den" id="naver_email" name="naver_email" />
		  <div style="display: flex; align-items: center; justify-content: space-between; margin-top: 30px; width: 450px">
            <div>
              <p style="font-size: 30px; font-weight: bold;">로그인</p>
            </div>
            <button type="submit" style="width: 60px; height: 60px; background-color: #71A2FF; border-radius: 30px; color: white; display: flex; align-items: center; justify-content: center; border: 0">
              <i class="fa-solid fa-arrow-right-long"></i>
            </button>
          </div>
          <!-- search -->
          <div style="display: flex; justify-content: space-between; width: 450px; margin-top: 50px">
            <a href="/J03Project/PetPlanet/regist" style="color: black;">회원가입</a>
            <a href="/J03Project/PetPlanet/id_Search.jsp" style="color: red;">아이디 찾기</a>
            <a href="/J03Project/PetPlanet/pw_Search.jsp" style="color: red;">비밀번호 찾기</a>
          </div>
        </div>
      </div>
    </div>
  </div>
</form>
</body>
</html>