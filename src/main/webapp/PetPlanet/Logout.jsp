<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 로그아웃 처리를 위한 방법
session.removeAttribute("u_id");
session.removeAttribute("u_name");

session.invalidate();

/*  
request.getHeader("referer") -> 바로 이전 주소 가져오기
response.sendRedirect(주소값) -> 입력한 주소값으로 페이지 이동
*/
/* response.sendRedirect(request.getHeader("referer")); */
response.sendRedirect("/J03Project");
%>
