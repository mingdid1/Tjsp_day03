<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../default/header.jsp" %>
	<%@page import="day03.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
	<jsp:useBean id="dao" class="day03.MemberDAO"/>
	<%
		ArrayList<MemberDTO> list = dao.getList();
	%>
	size : <%= list.size() %>
	
	<table border="1">
		<tr>
			<th>id</th><th>name</th><th>addr</th>
		</tr>
		<% for(MemberDTO d : list){ %>
			<tr>
				<td><%= d.getId() %></td>
				<td>
					<a href="info.jsp?id=<%= d.getId() %>">
						<%= d.getName() %>
					</a>
				</td>
				<td><%= d.getAddr() %></td>
			</tr>
		<% } %>
	</table>
</body>
</html>