<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("idKey");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<style>
	body {background-color: #E7EDEC;}
	table{
		border: 1px solid black;
		width:1100px;
	}
	tr,td{
		border: 1px solid black;
	}
</style>
<% if(id != null) { %>
	<b><%=id %></b>님 환영합니다<p/>
	즐거운 쇼핑되십시오<p/>
	<a href="logout.jsp">로그아웃</a>
<% } else { %>
	<form action="LoginProc.jsp" method="post">
	<table align="center">
		<tr>
			<th colspan="3"><h2>회원가입</h2></th>
		</tr>
		<tr>
			<td>아이디</td>
			<td>
				<input name="id" required>
				<input type="submit" value="ID중복확인" name="idcheck">
			</td>
			<td>영문과 숫자로만 입력.
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="pwd" required></td>
			<td>특수기호,영문,숫자가 각 1개 이상씩 들어가야 되고 6글자 이상
		</tr>
		<!--
		<tr>
			<td>비밀번호 확인</td>
			<td><input type="password" name="checkpw" required></td>
			<td>위의 비밀번호를 한번 더 넣으세요
		</tr>
		<tr>
			<td>이름</td>
			<td><input name="name" required></td>
			<td>한글로 입력
		</tr>
		<tr>
			<td>성별</td>
			<td>
				<input type="radio" name="gender" required>남 &emsp;
				<input type="radio" name="gender" required>여 &emsp;
			</td>
			<td>성별을 선택해 주세요
		</tr>
		<tr>
			<td>생년월일</td>
			<td><input name="birthday" required></td>
			<td>6글자로 입력 ex) 190315
		</tr>
		<tr>
			<td>E-mail</td>
			<td><input type="email" name="email" required></td>
			<td>ex) email@naver.com
		</tr>
		<tr>
			<td>우편번호</td>
			<td>
				<input name="zipcode" required>
				<input type="submit" value="우편번호 찾기" name="checkzipcode">
			</td>
			<td>우편번호를 검색하세요
		</tr>
		<tr>
			<td>주소</td>
			<td>
				<input name="address" size="45"required><br>
				<input name="address2" required>
			</td>
			<td>상세주소가 있으면 입력해주세요
		</tr>
		<tr>
			<td>취미</td>
			<td>
				<input type="radio" name="internet" required>인터넷 &emsp;
				<input type="radio" name="tra" required>여행 &emsp;
				<input type="radio" name="game" required>게임 &emsp;
				<input type="radio" name="movie" required>영화 &emsp;
				<input type="radio" name="exer" required>운동 &emsp;
			</td>
			<td>취미를 선택하세요
		</tr>
		<tr>
			<td>직업</td>
			<td>
				<select name="job">
		            <option value="a">회사원</option>
		            <option value="b">학생</option>
		            <option value="c">자택경비원</option>
		            <option value="etc">기타</option>
        		</select>
			</td>
			<td>상세주소가 있으면 입력해주세요
		</tr>
		-->
		
		
		<tr>
			<td colspan="3" align="center">
				<input type="submit" value="회원가입" onclick="location.href='member.jsp'">&emsp;
				<input type="reset" value="다시쓰기">&emsp;
				<input type="submit" value="로그인">
			</td>
		</tr>
	</table>
</form>
<% } %>
</body>
</html>