<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>

<style type="text/css">
	* {margin: 0 auto;}
	div {width: 500px;}
	h2 {text-align:center;}
	table {border: 1px solid}
	.m30 {margin-top : 30px; margin-bottom : 15px;}
</style>
</head>
<body>
	<div>
		<h2 class="m30">투표 프로그램</h2>
		<hr>
		
		<h5 class="m30">설문 작성</h5>
		<hr>
		<form action="voteInsertProc.jsp" method="post">
			<table class="table">
				<tr>
					<td>질문</td>
					<td colspan="2">q:<input name="question" size="50"></td>
				</tr>
				<tr>
					<td rowspan="7">항목</td>
					<%
					for(int i=1;i<=4;i++){
						out.print("<td>" + (i*2-1) + ":<input name='item'></td>");
						out.print("<td>" + i*2 + ":<input name='item'></td>");
						out.print("</tr>");
						if(i<4) {
							out.print("<tr>");
						}
					}
					%>
					<tr>
						<td>시작일</td>
						<td>
							<select name="sdateY">
							<%
								for(int i=2025;i<=2035;i++){
									out.print("<option value='" + i + "'>" + i + "</option>");
								}
							%>
							</select>년
							<select name="sdateM">
							<%
								for(int i=1;i<=12;i++){
									out.print("<option value='" + i + "'>" + i + "</option>");
								}
							%>
							</select>월
							<select name="sdateD">
							<%
								for(int i=1;i<=31;i++){
									out.print("<option value='" + i + "'>" + i + "</option>");
								}
							%>
							</select>일
						</td>
					</tr>
					
					<tr>
						<td>종료일</td>
						<td>
							<select name="edateY">
							<%
								for(int i=2025;i<=2035;i++){
									out.print("<option value='" + i + "'>" + i + "</option>");
								}
							%>
							</select>년
							<select name="edateM">
							<%
								for(int i=1;i<=12;i++){
									out.print("<option value='" + i + "'>" + i + "</option>");
								}
							%>
							</select>월
							<select name="edateD">
							<%
								for(int i=1;i<=31;i++){
									out.print("<option value='" + i + "'>" + i + "</option>");
								}
							%>
							</select>일
						</td>
					</tr>
					<tr>
						<td>이중답변</td>
						<td colspan="2">
							<input type="radio" name="type" value="1" checked>yes &emsp;&emsp;
							<input type="radio" name="type" value="0">no
						</td>
					</tr>
					<tr>
						<td colspan="3" align="center">
							<input type="submit" value="작성하기">&emsp;
							<input type="reset" value="초기화">&emsp;
							<input type="submit" value="리스트보기" onclick="location.href='votList'">&emsp;
						</td>
					</tr>
			</table>
		</form>
	</div>
</body>
</html>