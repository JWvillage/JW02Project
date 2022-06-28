<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${ requestScope.idDup }" var="idDupleCheck"/>
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
  <title>registration</title>
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
    input[type=password] {
    	font-family: '나눔고딕';
    }
    input[type=text] {
    	font-family: '나눔고딕';
    }
  </style>
  <script>
    function checkRegiForm(fm) {
      var id_check = document.getElementById('id_check01');
      var pw_check = document.getElementById('pw_check01');
      var name_check = document.getElementById('name_check');
      var email_check = document.getElementById('email_check');
      if(!fm.user_id.value) {
        id_check.innerHTML = "아이디를 입력하세요!"
        id_check.style.color = 'red'
        fm.user_id.focus();
        return false;
      } else {
        if (id_check.innerHTML != "사용 가능합니다") {
          alert("아이디를 확인하세요.");
          fm.user_id.focus();
          return false;
        } 
    	}
      if(!fm.pass1.value) {
        pw_check.style.color = 'red'
        pw_check.innerHTML = "비밀번호를 입력하세요!"
        fm.pass1.focus();
        return false;
      } else {
        if(pw_check.innerHTML != "사용 가능합니다") {
          alert("비밀번호를 확인하세요.");
          fm.pass1.focus();
          return false;
        }
      }
      if(!fm.name.value) {
        name_check.style.color = 'red'
        name_check.innerHTML = "이름을 입력하세요!"
        fm.name.focus();
        return false;
      }
      if(!fm.email.value) {
        email_check.style.color = 'red'
        email_check.innerHTML = "이메일을 입력하세요!"
        fm.email.focus();
        return false;
      }
    }

    // 비밀번호 입력 시 유효성 검사
    function passCheck(form) {
      if(form.pass1.value != null) {
        var u_pass = form.pass1.value;
        var check = document.getElementById("pw_check01");
        
        if(u_pass.length >= 8 && u_pass.length <= 16) {
          var num = 0;
          var upp_Alpha = 0;
          var low_Alpha = 0;
          var symbol = 0;
          for(var i = 0; i < u_pass.length; i++) {
            var ascii = u_pass.charCodeAt(i);
            if(ascii >= 48 && ascii <= 57) num++;
            if(ascii >= 65 && ascii <= 90) upp_Alpha++;
            if(ascii >= 97 && ascii <= 122) low_Alpha++;
            if((ascii >= 33 && ascii <= 47) || (ascii >= 58 && ascii <= 64)
                || (ascii >= 91 && ascii <= 96)
                || (ascii >= 123 && ascii <= 126)) symbol++;
          }
          if( num > 0 && upp_Alpha > 0 && low_Alpha > 0 && symbol > 0 ) {
              check.innerHTML = "사용 가능합니다";
            check.style.color = "skyblue";
              form.name.focus();
          } else {
            check.innerHTML = "영문(대소문자)/숫자/특수문자가 모두 포함되어야 합니다.";
            check.style.color = "red";
              /* form.pass1.focus(); */
          }
        } else {
          check.innerHTML = "8~16 자리로 입력하세요.";
        	check.style.color = "red";
          /* form.pass1.focus(); */
        }
      }
    }
  </script>
<script>
$(function(){
	
	$('#idDuple').click(function(){
		// form 전체 값을 가져온다
		/* var queryString = $('#registFrm').serialize(); */
		$.ajax({

			url : "./idDuple",
			type : "GET",
			cache: false,
			data : {
				"user_id" : $('#id').val(),
			},
			dataType : 'text',
			success : function(data) {
				
				if( data == "사용 가능합니다") {
					$('#id_check01').attr({'style': 'color: skyblue'})
					$('#id_check01').html(data)
				} else {
					$('#id_check01').attr({'style': 'color: red'})
					$('#id_check01').html(data)
				}
			},
				
			error : function(data){
				console.log("실패");
			}
		});
	});
});

</script>
<!-- 
<script>
var id_val = document.getElementById("id_check01");
if (id_val.innerTEXT == "사용 가능합니다") {
	id_val.style.color = "skyblue";
}
</script>
 -->
<jsp:include page="./common/header.jsp" />
<!-- registration -->
<form id="registFrm" action="/J03Project/PetPlanet/regist" method="POST" onsubmit="return checkRegiForm(this);">
  <div style="display: flex; flex-direction: column; align-items: center; ">
    <div style="border: 1px solid gray; width:1500px; height: 1300px; border-radius: 30px; margin-top: 180px; left: 40%; margin-bottom: 280px; box-shadow: rgba(0, 0, 0, 0.65) 0px 2px 20px;">
      <div style="display: flex; justify-content: space-between; align-items: center; ">
        <!-- left -->
        <div style="color: white; background-color: #81A3F0; width: 50%; height: 1300px; border-radius: 30px 0 0 30px; display: flex; justify-content: center; flex-direction: column; align-items: center;">
          
          <p style="font-size: 100px; line-height: 120px; font-weight: bold; color: white;">
            Let's Start!
            <br>
            펫 플래닛!
          </p>
          <p style="font-size: 30px; line-height: 40px; margin-top: 80px; font-weight: bold; color: white;">
            끝까지 완벽하게 케어하는
            <br>
            펫 플래닛에 맡겨 주세요!
          </p>
          <p>${ idDup }</p>
          <p style="font-size: 20px; margin-top: 300px; line-height: 30px; color: white;">
            <a href="main.html" style="color: white;">petplanet.co</a>
          </p>
        </div>
        <!-- right -->
        <div style="background-color: white; width: 50%; height: 1300px; border-radius: 0 30px 30px 0; display: flex; justify-content: center; flex-direction: column; align-items: center; box-shadow: rgba(0, 0, 0, 0.65) 0px 2px 20px;">
          <div>
            <img src="./image/Login_Main_logo03.png" alt="" style="width: 250px;">
          </div>
          <!-- Id -->
          <div>
            <p style="margin-left: 10px; font-size: 20px; font-weight: 600;">아이디</p>
            <div style="width: 475px; height: 59px; display: flex; align-items: center; border: 1px solid #cccccc; margin-top: 10px; padding: 0 24px 0 17px">
              <div>
                <img src="./image/id_icon01.png" alt="" style="width: 35px; height: 30px;">
              </div>
              <div>
                <input
                  id="id"
                  name="user_id"
                  type="text"
                  placeholder="아이디를 입력하세요!"
                  style="width: 350px; height: 52px; border: 0; margin: 0px 12px; padding: 1px 2px; outline: none;"
                />
              </div>
              <div>
                <button id="idDuple" type="button" style="width: 50px; height: 50px; border: 0; background: none;"><img src="./image/duplication.png" alt="" style="width: 40px; height: 40px;"></button>
              </div>
            </div>
            <div style="margin-top: 5px;">
              <p><span id="id_check01" style="color: skyblue"></span></p>
              <p>
                <li>아이디는 <span style="color: red;">8자리에서 12자리</span>로 입력해주세요</li>
              </p>
              <p>
                <li><span style="color: red;">영문과 숫자만</span> 입력해주세요</li>
              </p>
            </div>
          </div>
          <!-- Password -->
          <div style="margin-top: 50px;">
            <p style="margin-left: 10px; font-size: 20px; font-weight: 600;">비밀번호</p>
            <div style="width: 475px; height: 59px; display: flex; align-items: center; border: 1px solid #cccccc; padding: 0 24px 0 17px; margin-top: 10px;">
              <div>
                <img src="./image/id_icon01.png" alt="" style="width: 35px; height: 30px;">
              </div>
              <div>
                <input
                  id="pass1"
                  name="pass1"
                  type="password"
                  placeholder="비밀번호를 입력하세요!"
                  style="width: 350px; height: 52px; border: 0; margin: 0px 12px; padding: 1px 2px; outline: none;"
                  onblur="passCheck(this.form);"
                />
              </div>
              <div>
                <img src="./image/pw_icon_fail.png" alt="" style="width: 43px; height: 40px;">
              </div>
            </div>
            <div style="margin-top: 5px;">
              <p><span id="pw_check01" style="color: skyblue"></span></p>
              <p>
                <li>비밀번호는 <span style="color: red;">8자리에서 16자리</span>로 입력해주세요</li>
              </p>
              <p>
                <li><span style="color: red;">영문(대소문자), 숫자, 문자의 조합</span>으로 입력해주세요</li>
              </p>
            </div>
          </div>
          <!-- name -->
          <div style="margin-top: 50px;">
            <p style="margin-left: 10px; font-size: 20px; font-weight: 600;">이름</p>
            <div style="width: 475px; height: 59px; display: flex; align-items: center; border: 1px solid #cccccc; padding: 0 24px 0 17px; margin-top: 10px;">
              <div>
                <img src="./image/id_icon01.png" alt="" style="width: 35px; height: 30px;">
              </div>
              <div>
                <input
                  id="name"
                  name="name"
                  type="text"
                  placeholder="이름을 입력하세요!"
                  style="width: 350px; height: 52px; border: 0; margin: 0px 12px; padding: 1px 2px; outline: none;"
                />
              </div>
            </div>
            <div style="margin-top: 5px;">
              <p><span id="name_check" style="color: skyblue"></span></p>
            </div>
          </div>
          <!-- email -->
          <div style="margin-top: 50px;">
            <p style="margin-left: 10px; font-size: 20px; font-weight: 600;">이메일</p>
            <div style="width: 475px; height: 59px; display: flex; align-items: center; border: 1px solid #cccccc; padding: 0 24px 0 17px; margin-top: 10px;">
              <div>
                <img src="./image/id_icon01.png" alt="" style="width: 35px; height: 30px;">
              </div>
              <div>
                <input
                  id="email"
                  name="email"
                  type="text"
                  placeholder="이메일을 입력하세요!"
                  style="width: 350px; height: 52px; border: 0; margin: 0px 12px; padding: 1px 2px; outline: none;"
                />
              </div>
            </div>
            <div style="margin-top: 5px;">
              <p><span id="email_check" style="color: skyblue""></span></p>
              <p style="color: #4D505A">
                예) petplanet@petplanet.com
              </p>
            </div>
          </div>
          <!-- Login -->
          <div style="display: flex; align-items: center; justify-content: space-between; margin-top: 50px; width: 450px">
            <div>
              <p style="font-size: 30px; font-weight: bold;">회원 가입</p>
            </div>
            <button type="submit" style="width: 60px; height: 60px; background-color: #71A2FF; border-radius: 30px; color: white; display: flex; align-items: center; justify-content: center; border: 0">
              <i class="fa-solid fa-arrow-right-long"></i>
            </button>
          </div>
          <!-- search -->
          <div style="display: flex; justify-content: space-between; width: 450px; margin-top: 50px">
            <a href="javascript:login();" style="color: black;">로그인</a>
          </div>
        </div>
      </div>
    </div>
  </div>
</form>
<div style="margin-bottom: 100px;"></div>
<jsp:include page="./common/foot.jsp" />
</body>
</html>