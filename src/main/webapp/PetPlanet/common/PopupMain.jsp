<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String popupMode = "on"; 

Cookie[] cookies = request.getCookies();
if (cookies != null) {
    for (Cookie c : cookies) {
        String cookieName = c.getName();
        String cookieValue = c.getValue();
        if (cookieName.equals("PopupClose")) {
            popupMode = cookieValue; 
        }
    }
} 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키를 이용한 팝업 관리</title>
<style>
    div#popup{
        position: absolute; top:100px; left:100px; color:yellow;  
        width:500px; height:500px; background-color:gray;
    }
    div#popup>div{
        position: relative; background-color:#ffffff; top:0px;
        border:1px solid gray; padding:10px; color:black;
    }
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script>
$(function() {
	// 팝업창의 닫기 버튼을 클릭했을 때
    $('#closeBtn').click(function() {
    	// 레이어 팝업창을 숨김처리한다.
        $('#popup').hide();
    	// '하루동안 열지 않음' 체크박스에 체크된 경우에만 value를 얻어온다.
        var chkVal = $("input:checkbox[id=inactiveToday]:checked").val();
    	// jQuery ajax() 함수를 통해 요청한다.
        $.ajax({
        	// 요청할 서버의 url(경로)
            url : './PopupCookie.jsp',
            // 전송 방식
            type : 'get',
            // 파라미터(요청시 전송할 값) -> 항상 JSON 형식으로 기술!
            data : {inactiveToday : chkVal},
            // 콜백 데이터 형식 지정
            dataType : "text",
            // 성공시 콜백 함수
            success : function(resData) {
            	// 콜백 데이터는 매개변수 resData가 받는다.
            	if(resData){
            		console.log('있다');
            	}
            	else{
            		console.log('없다');	
            	}
            	// 콜백 데이터가 있다면 화면을 새로고침한다. F5를 누른 것과 동일하다.
                if (resData != '') location.reload();
            }
        });
    });
});
</script>
</head>
<body>
<h2>팝업 메인 페이지</h2>
<%
    if (popupMode.equals("on")) {
%>
    <div id="popup">
        <h2 align="center">공지사항 팝업입니다.</h2>
        <div align="right"><form name="popFrm">
        	<img src="/J03Project/PetPlanet/popup_image.png" alt="" />
            <input type="checkbox" id="inactiveToday" value="1" />
            하루 동안 열지 않음
            <input type="button" value="닫기" id="closeBtn" />
        </form></div>
    </div>
<%
    }
%>
</body>
</html>
