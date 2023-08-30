<%@page import="day03.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>loginChk.jsp<br>
	<jsp:useBean id="dto" class="day03.MemberDTO"/>
	<jsp:setProperty property="*" name="dto"/>
	id : <%= dto.getId() %><br>
	pwd : <%= dto.getPwd() %><br>
	<%
		MemberDAO dao = new MemberDAO();
		int result = dao.loginChk( dto.getId(), dto.getPwd() );
		if(result == 0){//로그인 성공
			session.setAttribute("login", dto.getId() );
			String msg = "<script>";
			msg += "alert('로그인 성공');";
			msg += "location.href='successLogin.jsp'";
			msg += "</script>";
			out.print( msg );
		}else if(result == 1){//비밀번호 틀림
		%>
			<script type="text/javascript">
				alert("비밀번호 틀림");
				location.href='login.jsp'
			</script>
		<%}else{//존재하지 않는 id
			%>
			<script type="text/javascript">
				alert("존재하지 않는 아이디");
				location.href='login.jsp'
			</script>
		<%}
	%>
</body>
</html>








