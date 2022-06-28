<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head><title>웹소켓 채팅</title></head>
<body>
    <script>
    function chatWinOpen() {
        var id = document.getElementById("chatId");
        if (id.value == "") {
            alert("대화명을 입력 후 채팅창을 열어주세요.");
            id.focus();
            return;
        }
        window.open("ChatWindow.jsp?chatId=" + id.value, "", "width=320,height=400");
        id.value = "";
    }
    </script>
    <div style="margin-top: 50px"></div>
    <div style="display: flex; justify-content: center">
	    대화명 :&nbsp;<input type="text" id="chatId" />
	    <button type="button" onclick="chatWinOpen();">채팅 참여</button>
    </div>
</body>
</html>