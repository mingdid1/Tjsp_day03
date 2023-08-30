<%@page import="day03.MemberDTO"%>
<%@page import="day03.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>info<br>
	<%
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.getMember( request.getParameter("id") );
	%>
	<%@ include file="../default/header.jsp" %>
	<h3>회원 목록</h3>
	id : <%= dto.getId() %><br>
	pwd : <%= dto.getPwd() %><br>
	name : <%= dto.getName() %><br>
	addr : <%= dto.getAddr() %><br>
	tel : <%= dto.getTel() %><br>
	<hr>
	<button type="button" 
			onclick="location.href='modiView.jsp?id=<%=dto.getId()%>'">수정</button>
	<button type="button" onclick="location.href='del.jsp?id=<%=dto.getId()%>'">삭제</button>
</body>
</html>










