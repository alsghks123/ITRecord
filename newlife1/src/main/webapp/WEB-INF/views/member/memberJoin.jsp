<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.centerText table{
		margin: auto;
	}
	
	.guide{
		display:none;
		font-size:12px;
		top:12px;
		right:10px;
	}
	span.ok{color:green;}
	span.error{color:red;}
</style>
</head>
<body>
<jsp:include page ="../common/menubar.jsp"/>

	<h1 align="center">회원가입</h1>
	<div class="centerText">
		<form action="minsert.do" method="post" id ="joinForm">
			<table width="500" cellspacing="5" style= border:solid red 1px;>
				<tr>
					<td width="150">아이디*</td>
					<td width="450">
						<input type="text" name ="id" id="userId">
						<span class ="guide ok">사용가능합니다</span>
						<span class ="guide error">사용 불가능</span>
						<input type="hidden" name ="idDuplicateCheck" id ="idDuplicateCheck" value ="0">
					</td>
				</tr>
				<tr>
					<td>이름*</td>
					<td><input type ="text" name ="name"></td>
				<tr>
					<td>비밀번호*</td>
					<td><input type ="password" name ="pwd"></td>
				</tr>
				<tr>
					<td>성별</td>
					<td>
						<input type ="radio" name ="gender" value="M">남	
						<input type= "radio" name ="gender" value="F">여	
					</td>
				</tr>	
				<tr>
					<td>나이</td>
					<td><input type="number" min="20" max="100" name="age"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="email" name="email"></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="tel" name="phone"></td>
				</tr>				
				<!-- 
					주소 api로
					주소와 우편번호를 받아보자
				 -->
				 <tr>
				 	<td>우편번호</td>
				 	<td>
				 		<input type ="text" name ="post" class ="postcodify_postcode5" value="" size ="6">
				 		<button type="button" id ="postcodify_search_button">검색</button>	
 					</td>
 				</tr>
 					 <tr>
				 	<td>도로명 주소</td>
				 	<td><input type="text" name="address1"
				 	      class="postcodify_address" value=""></td>
				 </tr>
				 <tr>
				 	<td>상세 주소</td>
				 	<td><input type="text" name="address2"
				 		  class="postcodify_extra_info" value=""></td>
				 </tr>
				 <!-- Postcodify를 로딩하자 -->
				 <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
				 <script>
				 	$(function(){
				 		$("#postcodify_search_button").postcodifyPopUp();
				 	})
				 </script>
				 <tr>
				 	<td colspan="2" align="center">
				 		<button type="button" onclick="validate()">가입하기</button>
				 		&nbsp;
				 		<input type ="reset" value ="취소하기">
 					</td>
 				</tr>
 			</table>
		</form>
	<br><br>
	<a href ="home.do">시작 페이지로 이동</a>
	<script>
/* 	function validate(){
		$("#joinForm").submit();
	} */
	
	/////////////ajax이후 ////
	
	$(function(){
		$("#userId").on("keyup", function(){
			var userId =$(this).val().trim();
			
			if(userId.length <4){
				$(".guide").hide();
				$("#idDuplicateCheck").val(0);
				
				return;
			}
			$.ajax({
				url:"dupid.do",
				data:{id:userId},
				success:function(data){
					if(data.isUsable ==true){
						
						$(".error").hide();
						$(".ok").show();
						$("#idDuplicateCheck").val(1);
					}else{
						$(".error").show();
						$(".ok").hide();
						$("#idDuplicateCheck").val(0);
					}	
					},
				error:function(request, status, errorDate){
					alert("error code: " + request.status + "\n"
							+"message: " + request.responseText
							+"error: " + errorData);
				}
				})
			})
		})

	
	function validate(){
		if($("#idDuplicateCheck").val() ==0){
			alert("사용 가능한 아이디를 입력해 주세요.");
			$("#userId").focus();
		}else{
			$("#joinForm").submit();
		}
	}
	</script>
	</div>
</body>
</html>