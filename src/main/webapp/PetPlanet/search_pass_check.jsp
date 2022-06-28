<%@page import="utils.JSFunction"%>
<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
String pass = request.getParameter("pass");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PassWord</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
function Use_Pw(){
		self.close();
}
</script>
</head>
<body>
<div class="container-fluid" style="background-color: #4A566C; color: white; height: 50px; font-size: 20px; font-weight: bold; padding-top: 10px">
비밀 번호 확인
</div>
<form>
	<div style="padding: 20px 0px 15px 20px">
		<input type="text" name="user_id" id="id" value="<%= pass %>" style="border: 1px solid #cccccc; height: 35px; margin-bottom: 10px" readonly/>
		<br />
		<span id="id_validate" style="color: skyblue">비밀번호는 <%= pass %>입니다.</span>
	</div>
	<div class="container-fluid text-center" style="margin-top: 100px; background-color: #F2F5FA; padding-top: 10px; padding-bottom: 10px; border-top: 1px solid #cccccc; position: absolute; bottom: 0;">
		<button class="btn" type="button" onclick="Use_Pw();" style="background-color: #4A566C; color: white; width: 120px;">사용하기</button>	
	</div>
</form>
</body>
</html>