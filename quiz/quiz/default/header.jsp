<header>
	<h1>CARE LAB</h1>
	<HR>
	<a href="/day03/quiz/member/index.jsp">HOME</a>
	<% if(session.getAttribute("login") == null) {%>
		<a href="/day03/quiz/member/login.jsp">MEMBERS</a>
		<a href="/day03/quiz/member/login.jsp">LOGIN</a>
	<% }else {%>	
		<a href="/day03/quiz/member/memberInfo.jsp">MEMBERS</a>
		<a href="/day03/quiz/member/logout.jsp">LOGOUT</a>
	<% } %>
	
	<HR>
</header>







