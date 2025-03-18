<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax로 댓글달기</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
	* {text-align:center;}
	body {text-align:center; display: flex;}
	table {width:640px; border:2px solid; border-collapse:collapse;}
	div{ width:500px; }
	
</style>
</head>
<body>
	<div>
	<img src="img01.png"><br><br>
	
	<table id="table">
		<thead>
			<tr>
				<th>댓글 작성</th>
				<td>
					<textarea rows="3" cols="60" id="content"></textarea>
				</td>
				<td><input type="button" id="btn1" value="댓글등록"></td>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
	
	<script>
	$(() => {
		replyList();
		//setInterval(replyList, 1000);  1초마다 재호출 (리소스 엄청 쌓임)
	})	
	
	function replyList() {
		$.ajax({
			url: "rlist.bo",
			data: {bnum: 1},
			success: function(list){
				 let value = "";
				 for(let i=0; i<list.length; i++) {
					 value += "<tr>"
					 		+ "	<td>" + list[i].name + "</td>"
					 		+ "	<td>" + list[i].content + "</td>"
					 		+ "	<td>" + list[i].rdate.substring(0,10) + "</td>"
					 		+ "</tr>";	 
				 }
				 $('#table tbody').html(value);
			},
			error: function() {
				console.log("ajax통신 실패");
			}
		})
	}
	
	
	$(() => {
		$('#btn1').click(function() {
			$.ajax({
				url: "rInsert.bo",
				data: {
					content: $('#content').val(),
					bnum: 1,
					name: "이한나"
				},
				type: "post",
				success: function(result) {
					if(result > 0) {
						replyList();
					}
				},
				error: function() {
					console.log("ajax통신 실패");
				}
			})
		})
	})
	</script>
</body>
</html>