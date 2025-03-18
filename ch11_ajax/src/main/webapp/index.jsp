<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
	<h1>AJAX 개요</h1>
	<p>
		Asynchronous JavaScript and XML의 약자<br>
		서버로부터 데이터를 가져와서 전체 페이지를 고치지 않고 일부만 로드할 수 있게 하는 기법<br>
		
		* 동기식 / 비동기식<br>
		 > 동기식(a, form, submit)
		 <ul>
		 	<li>요청 처리 후 그에 해당하는 응답페이지가 돌아와야만 그 다음 작업 가능</li>
		 	<li>서버에 요청한 결과까지의 시간이 지연되면 무작정 계속 기다려야 됨(흰페이지로 보여짐)</li>
		 	<li>전체 페이지를 응답해주기 때문에 기본적으로 페이지가 깜빡거림</li>
		 </ul>
		 
		 > 비동기(ajax)
		 <ul>
		 	<li>현재 페이지를 그대로 유지하면서 중간중간 추가적으로 필요한 요청을 보내 줄 수 있음</li>
		 	<li>요청을 보냈다고 해서 다른 페이지로 넘어가지 않음(현 페이지 그대로 유지)</li>
		 	<li>요청을 보내놓고 그에 해당하는 응답(데이터)이 돌아올때 까지 현재페이지에서 다른 작업을 할 수 있음</li>
		 	<li>페이지가 깜빡이지 않음</li>
		 </ul>
		 	ex> 실시간 급상승 검색어 로딩, 검색어 자동완성, 추천, 댓글, 무한스크롤링
		 	<br><br>
		 	
		 * 비동기식의 단점 <br>
		 - 현재 페이지에 지속적으로 리소스가 쌓임 => 페이지가 느려질 수 있음<br>
		 - 에러 발생시 디버깅 어려움<br>
		 - 요청 처리 후에 돌아온 응답데이터를 가지고 현재페이지에 새로운 요소를 만들어서 보여줘야 됨
		   => dom요소들을 새롭게 만들어내는 구문을 알아야 됨
		 <br><br>
		 
		 * AJAX 구현 방식 : JavaScript 방식 / jQuery방식(코드 간결하고 사용하기 쉬움)
	</p>
	
	<pre>
	* jQuery방식으로 AJAX 통신
	
	$.ajax({
		속성명:속성값,
		속성명:속성값,
		속성명:속성값,
		...
	})
	
	* 주요속성
	- url : 요청할 url(필수 속성)
	- type|method : 요청전송방식(get(default) / post)
	- data : 요청시 전달할 값
	- success : ajax 통신이 성공했을때 실행할 함수 정의
	- error : ajax 통신이 실행했을 때 실행할 함수 정의
	- complete : ajax 통신의 성공과 실패에 상관없이 무조건 실행할 함수 정의
	
	* 부수적인속성
	- async : 서버와의 비동기 처리 방식 설정 여부(기본값 true:비동기)
	- contentType : request의 데이터 인코딩 방식 정의(보내는 측의 데이터 인코딩)
	- dataType : 서버에서 response로 오는 데이터의 데이터 형 설정, 값이 없다면 스마트하게 판단함
				xml - 트리 형태의 데이터 구조
				json - 맵 형식의 데이터 구조(일반적인 데이터 구조)
				script - javascript 및 일반 String 형태 데이터
				html - html 태그 자체를 return 하는 방식
				text - String 데이터
	- accept : 파라미터의 타입을 설정 (사용자 특화 된 파라미터 타입 설정 가능)
	- beforesend : ajax 요청을 하기 전 실행되는 이벤트 callback 함수 (데이터 가공 및 header 관련 설정)
	- cache : 요청 및 결과값을 scope에서 갖고 있지 않도록 하는 것 (기본값 true)
	- contents : JQuery에서 response의 데이터를 파싱하는 방식 정의
	- context : ajax 메소드 내 모든 영역에서 파싱 방식 정의
	- crossDomain : 타 도메인 호출 가능 여부 설정(기본값 false)
	- dataFilter : response를 받았을 때 정상적인 값을 return 할 수 있도록 데이터와 데이터 타입 설정
	- global : 기본 이벤트 사용 여부(ajaxstart, ajaxstop) (버퍼링 같이 시작과 끝을 나타낼 때, 선처리 작업)
	- password : 서버에 접속 권한(비밀번호)이 필요한 경우
	- processData : 서버로 보내는 값에 대한 형태 설정 여부(기본 데이터를 원하는 경우 false설정)
	- timeout : 서버 요청 시 응답 대기 시간(milisecond)
	</pre>
	
	<h1>JQuery방식을 이용한 AJAX 테스트</h1>
	
	<h3>1. 버튼 클릭시 get방식으로 서버에 요청 및 응답</h3>
	
	입력 : <input type="text" id="input1"> &emsp; <input type="button" id="btn1" value="전송">
	<br>
	
	응답 : <span id="output1">현재응답없음</span>
	
	<script type="text/javascript">
		$(() => {
			$("#btn1").click(function() {
				$.ajax({
					url : "ajax1.do",
					data : {input: $("#input1").val()},
					type : "get",	//기본이 get 방식 (빼도 됨)
					success : function (result) {
						console.log(result);
						$("#output1").text(result);
					},
					error : function() {
						console.log("ajax 통신 실패");
					}
				})
			})
		})
	</script>
	
	
	
	<!-- <form action="idCheck.me">
		ID : <input name="id" id="id"> <input type="button" value="ID중복확인" id="btn2"> <p/>
		PW : <input type="password" name="pwd">
		<input type="submit" value="회원가입" disabled>
	</form>
	
	<script type="text/javascript">
		$(() => {
			$("#btn2").click(function() {
				// $("form input[name=id]")
				let $idInput = $("input[name=id]")
				$.ajax({
					url : "idCheck.me",
					data : {checkId : $idInput.val()},
					success : function(result) {
						console.log(result);
						if(result == 'idN') {
							alert("이미 사용중이거나 탈퇴한 아이디 입니다.");
						} else {
							if(confirm("사용 가능한 아이디 입니다. 사용하시겠습니까?")) {
								$("form :submit").removeAttr("disabled");
								$idInput.attr("readonly", true);
							}
						}
					},
					error : function() {
						console.log("아이디 중복체크용 ajax통신실패");
					}
				})
			})
		})
	</script>  -->
	
	<!-- id input에 넣으면 바로바로 쓸 수 있는지 나타내줌 -->
	<form action="idCheck.me" id="enrollFrom">
		<p>ID : <input name="id" id="id"></p>
		<div id="checkResult" style="font-size:0.9em; display:none"></div>
		<input type="submit" value="회원가입">&emsp;
		<input type="reset" value="초기화">&emsp;
	</form>
	
	<script>
	$(() => {
		const $idInput = $("#id");
		$idInput.keyup(function() {
			console.log($idInput.val());
			
			// 최소 3글자 이상 입력되었을때만 ajax요청을 중복체크
			if($idInput.val().length >= 3) {
				$.ajax({
					url : "idCheck.me",
					data : {checkId : $idInput.val()},
					success : function(result) {
						if(result == "idN") {
							$('#checkResult').show();
							$('#checkResult').css("color", "red").text("중복된 아이디 입니다. 다시 입력하세요");
							$('#enrollFrom :submit').attr("disabled", true);
						} else {
							$('#checkResult').show();
							$('#checkResult').css("color", "green").text("멋진 아이디네요");
							$('#enrollFrom :submit').attr("disabled", false);
						}
					},
					error : function() {
						console.log("아이디 중복체크용 ajax통신실패");
					}
				})
				
			} else {
				$('#enrollFrom :submit').attr("disabled", true);
			}
		})
	})
	</script>
	
	<br><br>
	
	<h3>2. 버튼 클릭시 post 방식으로 서버에 여러개의 데이터 전송 및 응답</h3>
	이름 : <input id="name"><br>
	나이 : <input type="number" id="age"><br>
	<input type="button" id="btn3" value="전송">
	
	
	
	<!-- 서블릿의 v1, v2 실행시 모두 하나의 문자열로 받음
	응답 : <label id="output3"></label>
	 <script>
		$(() => {
			$('#btn3').click(function() {
				$.ajax({
					url : "ajax3.do",
					data : {
						name : $('#name').val(),
						age : $('#age').val()
					},
					type : "post",
					success : function(result) {
						console.log(result);
						// v1과 v2는 모두 하나의 문자열로 들어옴
						$('#output3').text(result);
					},
					error : function() {
						console.log("ajax통신 실패");
					}
				})
			})
		})
	</script> -->
	
	<!-- 서블릿의 v3, v4에서 배열이나 객체로 반환 -->
	응답 : <ul id="ouput3">
	</ul>
	
	<script>
	$(() => {
		$('#btn3').click(function() {
			$.ajax({
				url : "ajax3.do",
				data : {
					name : $('#name').val(),
					age : $('#age').val()
				},
				type : "post",
				success: function(result) {
					console.log(result);
					/* 배열일 때
					console.log(result[0]);
					console.log(result[1]);
					
					const value = "<li>이름 : " + result[0] + "</li>"
								+ "<li>나이 : " + result[1] + "</li>";
					$('#output3').html(value);
					$('#name').val("");
					$('#age').val(""); 
					*/
					
					// 객체일 때
					console.log(result.name);
					console.log(result.age);
					
					const value = "<li>이름 : " + result.name + "</li>"
								+ "<li>나이 : " + result.age + "</li>";
					$('#output3').html(value);
					$('#name').val("");
					$('#age').val(""); 
					
				},
				error:function() {
					console.log("ajax통신 실패");
				}
			})
		})
	})
	</script>
	
	<h3>3. 서버에 데이터 전송한 후 , 조회된 bean객체를 응답데이터로 받을 때</h3>
	
	검색하고자하는 회원번호 ID : <input id="input4">
	<input type="button" id="btn4" value="조회"><p/>
	
	<div id="output4"></div>
	
	<script>
	$(() => {
		$('#btn4').click(function() {
			$.ajax({
				url : "ajax4.do",
				data : {id: $('#input4').val()},
				success : function(result) {
					console.log(result);
					/* JSONObject로 넘겼을 때
					const value = "******* 검색 결과 *******"
								+ "ID : " + result.userId + "<br>"
								+ "이름 : " + result.userName + "<br>"
								+ "성별 : " + result.gender + "<br>"
								+ "email : " + result.email + "<br>"
					*/
					
					// Gson으로 넘겼을 때
					const value = "******* 검색 결과 *******"
								+ "ID : " + result.id + "<br>"
								+ "이름 : " + result.name + "<br>"
								+ "성별 : " + result.gender + "<br>"
								+ "email : " + result.email + "<br>"
						$('#output4').html(value);
				},
				error : function() {
					console.log("ajax통신 실패");
				}
			})
		})
	})
	</script>
	
	<br><br>
	
	<h3>4. 여러 bean객체들을 ArrayList로 받기</h3>
	

	<input type="button" id="btn5" value="전송"> <br><br>
	
	
	<table id="output5" border="1">
		<thead>
			<tr>
				<th>ID</th>
				<th>이름</th>
				<th>성별</th>
				<th>EMAIL</th>
			</tr>
		</thead>
		<tbody>
		
		</tbody>
	</table>
	
	<script>
	$(() => {
		$('#btn5').click(function() {
			$.ajax({
				url: "ajax5.do",
				success: function(result) {
					console.log(result);
					
					let value = "";
					for(let i=0; i<result.length; i++) {
						value += "<tr>"
							   +" <td>" + result[i].id + "</td>"
							   +" <td>" + result[i].name + "</td>"
							   +" <td>" + result[i].gender + "</td>"
							   +" <td>" + result[i].email + "</td>"
							   + "</tr>";
					}
					$('#output5 tbody').html(value);
					
				},
				error: function() {
					console.log("ajax통신 실패");
					
					}
				
			})
		})
	})
	</script>
	
	<br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>