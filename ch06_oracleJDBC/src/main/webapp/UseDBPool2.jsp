<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ch06_oracleJDBC.*, java.util.*" %>
    <jsp:useBean id="uBean" class="ch06_oracleJDBC.UseDBPool6" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Bean을 사용한 ORACLE연동</h1>
	<table border="1">
		<tr>
			<th>지역코드</th>
			<th>국가코드</th>
			<th>지역명</th>
		</tr>
	<%
		ArrayList<BeanLocation> alist = uBean.getList();
		for(int i=0;i<alist.size();i++){
			BeanLocation bean = alist.get(i);
	%>
		<tr>
			<td><%=bean.getLocal_code() %></td>
			<td><%=bean.getNational_code() %></td>
			<td><%=bean.getLocal_name() %></td>
		</tr>
	<%
		}
	%>
	</table>
</body>
</html>