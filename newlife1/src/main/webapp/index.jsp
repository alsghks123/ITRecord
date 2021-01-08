<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<!-- 
	*Ajax의 주요 속성
	-url : 데이터를 전송할 url 경로
	-data : 요청 parameter설정(back단으로 보내는값 )
	-dateType : 서버에서 response로 오는 데이터의 데이터형 설정
	-error : ajax 통신에 실패 햇을 때 호출되는 이벤트 핸들러 함수
	-success : ajax 통신에 성공했을 때 호출 될 이벤트 핸들러 함수
	-complete : 요청 완료 후 실행되는 함수 (성공, 실패 상관없이 요청처리 이후 무조건 실행) -->
<h1 align ="center">JQuery를 이용한 Ajax 테스트</h1>
	<label>이름 :</label> <input type ="text" id ="myName">
	<button id ="nameBtn">이름 보내기</button>
	
	</hr>
	<script>
	$(function(){
		$("#nameBtn").click(function(){
			var name = $("#myName").val();
		$.ajax({
			url:"test2.do",
			date:{name1:name},
			type:"get",
			success:function(data){
				console.log("성공");
			},
			error:function(data){
				console.log("실패");
			},
			complete:function(data){
				console.log("무적권 호출되는 로그");
			}
		})
		})
	})
	</script>
	
	<h1>2.버튼 선택시 서버에서 보낸 값 사용자가 수신 확인</h1>
	<button id ="getServerTextBtn">서버에서 보낸 값 확인</button>
	<p id ="p1" style ="width:300px; height:50px; border:1px solid red;">
	<hr>
	<script>
	$(function(){
		$("#getServerTextBtn").click(function(){
			$.ajax({
				url:"test3.do",
				type:"get",
				success:function(data){
					alert(data);
					$("#p1").text(data);
				},
				error:function(data){
					console.log("실패");
				}
			})
		})
	})</script>
	<h1>3. 서버로 기본값 전송하고 결과로 문자열을 받아 처리</h1>
	<label>첫번째 숫자 : </label><input type ="text" id ="firstNum"><br>
	<label>두번째 숫자 : </label><input type ="text" id ="secondNum"><br>
	<button id ="plusBtn">결과 확인</button>
	<p id ="p2" style ="width:300px; height:50px; border:1px solid red;">
	<hr>

	<script>
	$(function(){
		$("#plusBtn").click(function(){
		var firstNum = $("#firstNum").val();
		var secondNum = $("#secondNum").val();
		
		$.ajax({
			url:"test4.do", // TestServlet3 만들자
			type:"get",
			data:{firstNum1:firstNum,secondNum1:secondNum},
			success:function(data){
				$("#p2").text(data);
			},
			error:function(data){
				console.log("실패");
			}
		})	
		})
	})
	</script>
	
	<h1>4. 서버로 Object 형태의 데이터 전송 , 서버에서 처리 후 서버 console 출력</h1>
	<label>학생 1:</label><input type ="text" id ="stu1"><br>
	<label>학생 2:</label><input type ="text" id ="stu2"><br>
	<label>학생 3:</label><input type ="text" id ="stu3"><br>
	<button id ="stuTest">4번 결과 확인</button>
	<hr>
	
	<script>
	$(function(){
		$("#stuTest").click(function(){
			var student1 = $("#stu1").val();
			var student2 = $("#stu2").val();
			var student3 = $("#stu3").val();
			
			var students = {student11:student1,
							student22:student2,
							student33:student3};
			$.ajax({
				url:"test5.do",	// TestServlet4 만들자
				type:"get",
				data:students,
				success:function(data){
					
				},
				error:function(data){
					console.log("실패");
				}
			})
		})
	})
	</script>
	<h1>5.서버로 기본형 데이터 전송, 서버에서 객체 반환</h1>
	<label>유저정보(번호):</label><input type ="text" id="userNo">
	<br>
	<button id ="getUserInfoBtn">정보 가져오기</button>
	<textarea rows ="5" cols="40" style ="border: 1px solid red" id ="p3"></textarea>
<hr>
	<script>
	$(function(){
		$("#getUserInfoBtn").click(function(){
			var userNo = $("#userNo").val();
			
			$.ajax({
				url:"test6.do",
				type:"get",
				data:{userNo1:userNo},
				success:function(data){
					var result="";
					
				if(data!=null){
					result = data.userNo+","
							+data.userName+","
							+data.userNation;
				}	
				$("#p3").val(result);
				},
				error:function(data){
					console.log("실패");
				}
				
			})
		})
	})
	
	</script>	
	
	
	
</body>
</html>