<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="LoginPro" class="ch07.LoginDB" />
<%
	String id = request.getParameter("userid");
	String pw = request.getParameter("userpw");
	
	if(LoginPro.loginMethod(id, pw)) {
		Cookie cookie = new Cookie("idKey", id);
		response.addCookie(cookie);
%>
	<script type="text/javascript">
		alert("로그인 되었습니다");
		location.href = "04.3.cookieLoginOk.jsp";
	</script>
<%
	} else {
%>
	<script type="text/javascript">
		alert("로그인 되지 않았습니다");
		location.href = "04.1.cookieLogin.jsp";
	</script>
	

<%
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>