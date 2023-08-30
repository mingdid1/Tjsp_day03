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
<body>
	<%
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.getMember( request.getParameter("id") );
	%>
	<%@ include file="../default/header.jsp" %>
	<h3>수정 페이지</h3>
	<form action="modify.jsp" method="post">
		<input type="text" name="id" readonly value="<%=dto.getId() %>"><br>
		<input type="text"name="pwd"  value="<%=dto.getPwd() %>"><br>
		<input type="text" name="name" value="<%=dto.getName() %>"><br>
		<input type="text" name="addr" value="<%=dto.getAddr() %>"><br>
		<input type="text" name="tel" value="<%=dto.getTel() %>"><br>
		<input type="submit" value="수정"><br>
	</form>
</body>
</html>





