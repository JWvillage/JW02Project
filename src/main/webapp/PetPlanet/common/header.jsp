<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  /* Login_Form */
  window.onload = function() {
    var con = document.getElementById("Login_Form");
    var con01 = document.getElementById("Login_Form01");
    var s_height = window.screen.height;
    if(document.documentElement.scrollTop > s_height + 280 | document.documentElement.scrollTop < s_height - 280) {
      con.style.display = 'none';
    }
  }

  var clickCheck = true;
  function login(){
    var con = document.getElementById("Login_Form");
    var con01 = document.getElementById("Login_Form01");
    var s_height = window.screen.height;
    if(con.style.display=='none') {
      con01.style.top = document.documentElement.scrollTop + s_height / 2 - parseInt(con01.style.height) / 1.8 + 'px'
      con.style.display = 'flex';
    } else {
      con.style.display = 'none';
    }
  }

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
<!-- Login Form -->
<form action="/J03Project/PetPlanet/Login" method="post" onsubmit="return checkLogForm(this);">
  <div class="Login_Form" id="Login_Form" style="display: none; flex-direction: column; align-items: center;">
    <div id="Login_Form01" style="border: 1px solid gray; width:1500px; height: 850px; border-radius: 30px; z-index: 99999999; position: absolute; top: 280px; left: 14.5%; box-shadow: rgba(0, 0, 0, 0.65) 0px 2px 20px;">
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
            <div style="width: 475px; height: 59px; display: flex; align-items: center; border: 1px solid #cccccc; margin-top: 10px; padding: 0 24px 0 17px">
              <div>
                <img src="/J03Project/PetPlanet/image/id_icon01.png" alt="" style="width: 35px; height: 30px;">
              </div>
              <div>
                <input
                  id="user_id"
                  name="id"
                  type="text"
                  placeholder="아이디를 입력하세요!"
                  style="width: 350px; height: 52px; border: 0; margin: 0px 12px; padding: 1px 2px; outline: none;"
                  onblur="idMessage(this.form);"
                />
              </div>
            </div>
            <div style="margin-top: 5px;">
              <p><span id="id_check" style="color: skyblue"></span></p>
            </div>
          </div>
          <!-- Password -->
          <div style="margin-top: 50px;">
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
          <!-- Login -->
          <div style="display: flex; align-items: center; justify-content: space-between; margin-top: 50px; width: 450px">
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
            <a href="" style="color: red;">아이디 찾기</a>
            <a href="" style="color: red;">비밀번호 찾기</a>
          </div>
        </div>
      </div>
    </div>
  </div>
</form>
  <!-- main_header -->
  <div class="top" id="header_t">
    <div class="layout">
      <div class="logo">
        <a class="header_link" href="/J03Project/petplanet.do">
          <img src="/J03Project/PetPlanet/image/Logo1.png" alt="">
        </a>
      </div>
      <div class="container-fluid" style="display: flex; justify-content: end; align-items: center;">
        <div style="border-right: 1px solid rgb(215, 219, 226);">
          <a class="header_link" href="/J03Project/PetPlanet/search.jsp">펫시터 찾기</a>
        </div>
        <div style="border-right: 1px solid rgb(215, 219, 226);">
          <a class="header_link" href="">이용 후기</a>
        </div>
        <div style="border-right: 1px solid rgb(215, 219, 226);">
          <a class="header_link" href="">채팅 문의</a>
        </div>
		<%
		if (session.getAttribute("u_id") != null) {
			if(!session.getAttribute("u_id").equals("masterratte")) {
		%>
        <div style="display: flex; align-items: center;">
        	<p style="padding-left: 20px; color: #81A3F0; font-weight: bold"><%=session.getAttribute("u_name")%>님</p>
        	<a id="logout" name="logout" class="header_link" href="/J03Project/PetPlanet/Logout.jsp">로그아웃</a>
        </div>
		<%
			} else {
		%>
		<div style="display: flex; align-items: center;">
        	<p style="padding-left: 20px; color: #81A3F0; font-weight: bold"><%=session.getAttribute("u_name")%>&nbsp;&nbsp;관리자님</p>
        	<a id="logout" name="logout" class="header_link" href="/J03Project/PetPlanet/Logout.jsp">로그아웃</a>
        </div>
        <div style="border-right: 1px solid rgb(215, 219, 226);">
          <a id="registration" name="registration" class="header_link" href="/J03Project/admin/admin.jsp">Admin Page</a>
        </div>
		<%
			}
		} else {
		%>
        <div style="border-right: 1px solid rgb(215, 219, 226);">
          <a id="registration" name="registration" class="header_link" href="/J03Project/PetPlanet/regist">회원가입</a>
        </div>
        <div>
          <a id="Login" name="Login" class="header_link" href="javascript:login();">로그인</a>
        </div>
   		<%
		}
		%>
        <div style=" border: 1px solid #81A3F0; border-radius: 25px; width: 120px; height: 50px; justify-content: center; display: flex; align-items: center;">
          <a class="header_link" href="" style="color: #81A3F0; font-size: 14px; font-weight: bold" >펫시터 지원</a>
        </div>
      </div>
    </div>
  </div>