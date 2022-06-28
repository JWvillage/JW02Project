<%@page import="utils.JSFunction"%>
<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
MemberDAO dao = new MemberDAO();

String u_Id = request.getParameter("user_id");

MemberDTO dto = dao.idValidate(u_Id);

boolean result = true;

if(dto.getId() == null) {
	result = true;
	
	response.sendRedirect("id_duplication.jsp?id="+u_Id);
} else if(dto.getId().equals(u_Id)) {
	result = false;
	JSFunction.alertBack("중복되었습니다.", out);
}

dao.close();
%>
