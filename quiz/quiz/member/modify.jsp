<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding("utf-8"); %>
	<jsp:useBean id="dto" class="day03.MemberDTO" />
	<jsp:setProperty property="*" name="dto"/>
	
	<jsp:useBean id="dao" class="day03.MemberDAO" />
	
	<%
		dao.modify(dto);
		response.sendRedirect("info.jsp?id="+dto.getId());
	%>
	
	
</body>
</html>





