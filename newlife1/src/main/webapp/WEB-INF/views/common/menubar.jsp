<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 부트스트랩 CDN -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<!-- jQuery CDN -->
<script src="http://code.jquery.com/jquery-Latest.min.js"></script>

<!-- 폰트 CDN -->
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css">

<!-- fontawesome icon CDN -->
<script src="https://kit.fontawesome.com/4b6b63d8f6.js"
	crossorigin="anonymous"></script>

	<!-- 폰트(배혜린 변경) -->
	<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet"
		type="text/css">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
	<script src="https://kit.fontawesome.com/4b6b63d8f6.js" crossorigin="anonymous"></script>
	
<style>
body {
	font-family: 'Lato', 'Helvetica Neue', Helvetica, Arial, sans-serif;
/* 	font-family: 'Jua', sans-serif; */
/* 	font-family: 'Do Hyeon', sans-serif; */
	background-color: #212426;
}

h1, h2, h3, h4, h5, h6 {
	font-family: 'Lato', 'Helvetica Neue', Helvetica, Arial, sans-serif;
/* 	font-family: 'Do Hyeon', sans-serif !important; */
	font-weight: 700;
}

#navbarMain>ul>li>a {
	color: white;
}

#navbarMain>ul>li>a:hover {
	color: lightblue;
}

@import url('https://fonts.googleapis.com/css?family=Roboto');

* {
	margin: 0;
	padding: 0;
}

i {
	margin-right: 10px;
}

/*------------------------*/

/*----------step-wizard------------*/
.d-flex {
	display: flex;
}

.justify-content-center {
	justify-content: center;
}

.align-items-center {
	align-items: center;
}

/*---------signup-step-------------*/
.signup-step-container {
	padding: 150px 0px;
	padding-bottom: 60px;
}

.wizard .tab-pane {
	position: relative;
	padding-top: 20px;
}

.list-inline li {
	display: inline-block;
}

@media ( max-width : 767px) {
	.wizard .nav-tabs>li a i {
		display: none;
	}
}

.back-to-top {
	position: fixed;
	bottom: 110px;
	right: 48px;
	display: none;
	z-index: 100;
}

/* 메인메뉴 마우스 호버 효과 */
.hvr-underline-from-center {
	display: inline-block;
	vertical-align: middle;
	-webkit-transform: perspective(1px) translateZ(0);
	transform: perspective(1px) translateZ(0);
	box-shadow: 0 0 1px rgba(0, 0, 0, 0);
	position: relative;
	overflow: hidden;
}

.hvr-underline-from-center:before {
	content: "";
	position: absolute;
	z-index: -1;
	left: 51%;
	right: 51%;
	bottom: 0;
	background: #17a2b8;
	height: 4px;
	-webkit-transition-property: left, right;
	transition-property: left, right;
	-webkit-transition-duration: 0.3s;
	transition-duration: 0.3s;
	-webkit-transition-timing-function: ease-out;
	transition-timing-function: ease-out;
}

.hvr-underline-from-center:hover:before, .hvr-underline-from-center:focus:before,
	.hvr-underline-from-center:active:before {
	left: 0;
	right: 0;
}
/* 마우스 호버 끝 */

/* 메뉴바 폰트 */
#navbarSub ul li a, #navbarMain ul li a {
/* 	font-family: 'Jua', sans-serif; */
	font-family: 'Do Hyeon', sans-serif !important;
}
/* 메뉴바 폰트 끝 */

/* 회원찾기 드롭다운 메뉴 */
.dropbtn {
  color: white;
  font-size: 16px;
  border: none;
}

/* The container <div> - needed to position the dropdown content */
.dropdown {
  position: relative;
  display: inline-block;
}

/* Dropdown Content (Hidden by Default) */
.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

/* Links inside the dropdown */
.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

/* Change color of dropdown links on hover */
.dropdown-content a:hover {background-color: #ddd;}

/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-content {display: block;}

/*  */
.btn-info{
/* 	background-color: rgb(11,15,66) !important; */
/* 	outline:none !important; */
}




</style>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<script>
$(document).ready(function(){
	if('${loginUser.memId}'.length > 0){
		var mId = '${loginUser.memId}';
		
		$.ajax({
			url:"getMyPageSidebarProImg.do",
			data:{mId:mId},
			type:"get",
			success:function(proImgName){
				$('.dropdown-toggle').find('img').css('visibility','visible').prop('src', '${pageContext.servletContext.contextPath}/resources/proImg/'+proImgName);
			},
			error:function(error){
				alert('error : ' + error);
			}
		});
	}
});
</script>
<body id="mainMenubar">
	

	<c:set var="contextPath"
		value="${pageContext.servletContext.contextPath }" scope="application" />

	<!--Top Button-->
	<a id="back-to-top" href="#" class="btn btn-light btn-lg back-to-top"
		role="button"><i class="fas fa-chevron-up" style="margin: 0"></i></a>
	<script>
		$(document).ready(function() {
			$(window).scroll(function() {
				if ($(this).scrollTop() > 10) {
					$('#back-to-top').css("display", "block")

				} else {
					$('#back-to-top').css("display", "none")

				}
			});
			// scroll body to 0px on click
			$('#back-to-top').click(function() {
				$('body,html').animate({
					scrollTop : 0
				}, 400);
				return false;
			});
		});
	</script>

	<!--navigation bar 1-->
	<nav class="navbar navbar-expand-lg" style="background-color: black;">
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarMain" aria-controls="navbarMain"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarMain">
			<ul class="navbar-nav">
				<li class="nav-item active"><a class="nav-link" href="home.do"><img
						src="${contextPath }/resources/images/logo.png" height="60px"
						style="padding-bottom: 0; padding-top: 0; margin-top: 0; margin-bottom: 0;"><span
						class="sr-only">(current)</span></a></li>
			</ul>
			<ul class="navbar-nav ml-auto">
				<li class="nav-item">
					<a class="nav-link hvr-underline-from-center mr-2" href="searchProjectList.do" style="font-size:18px;">프로젝트찾기</a>
				</li>
	<input type ="hidden" name="memId" value="${loginUser.memId}"/>
				<li class="nav-item">
					<a class="nav-link hvr-underline-from-center mr-2"  href='addProject.do 'style="font-size:18px;">프로젝트등록</a>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link hvr-underline-from-center dropbtn" href="#" style="font-size:18px;">회원 찾기</a>
					<div class="dropdown-content">
						<a href="clientList.do">클라이언트 찾기</a>
						<a href="partnersList.do">파트너스 찾기</a>
					</div>
		        </li>
			</ul>

			<ul class="navbar-nav ml-auto">
				<!-- 관리자 페이지, 파트너스/클라이언트페이지 -->
				<c:if test="${empty sessionScope.loginUser }">
					<!-- <button type="button" class="btn btn-secondary">LOGIN</button> -->
					<a href="loginpage.do" class="btn btn-secondary">LOGIN</a>
					<!-- <button type="button" class="btn btn-info" href="sign.do">SIGNIN</button> -->
					<a href="signpage.do" class="btn btn-info">SIGNIN</a>
				</c:if>
				<c:if test="${!empty sessionScope.loginUser }">
				<!-- 관리자 로그인 -->
					<c:if test="${loginUser.userType eq 'UT1' || loginUser.userType eq 'UT2'}">
						<h3 align="right" style="color: white">
							<span style="font-size:16px; font-weight:550;">관리자 ${loginUser.memName }</span>&nbsp;&nbsp;
							<div class="btn-group">
							  <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							    <img src="" height="30px" width="30px" style="border-radius: 50%" onerror="this.style.visibility='hidden';">		
							  </button>
							  <div class="dropdown-menu" style="position:absolute;left:-88px;">
							    <a class="dropdown-item" href="#">profile</a>
							    <div class="dropdown-divider"></div>
							    <c:url var="logout" value="logout.do"/>
							    <a class="dropdown-item" onclick="location.href='${logout }'">logout</a>
							  </div>
							</div>
						</h3>
					</c:if>
					<!-- 사용자 로그인 -->
					<c:if test="${loginUser.userType eq 'UT3'}">
						<h3 align="right" style="color: white">
							<div class="btn-group">

							  <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">

							    <img src="" height="30px" width="30px" style="border-radius: 50%" onerror="this.style.visibility='hidden';">									  
							  </button>
							  <div class="dropdown-menu" style="position:absolute;left:-88px;">
							  	<c:url var="clientProfile" value="clientProfile.do">
			                    	<c:param name="cId" value="${loginUser.memId }"/>
			                    </c:url>
							  
							    <a href="${clientProfile }" class="dropdown-item">profile</a>
							    <a href="gotoAccountMypage.do" class="dropdown-item">myAccount</a>
							    <div class="dropdown-divider"></div>
							    <c:url var="logout" value="logout.do"/>
							    <a class="dropdown-item" onclick="location.href='${logout }'">logout</a>
							  </div>
							</div>
						</h3>
					</c:if>
					<c:if test="${loginUser.userType eq 'UT4'}">
						<h3 align="right" style="color: white">
							
							<div class="btn-group">
							  <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							  <!-- 파트너스 기본 이미지 -->
							  <c:if test="${loginUser.userType eq 'UT4' }">
							    <img src="" height="30px" width="30px" style="border-radius: 50%" onerror="this.style.visibility='hidden';">							  
							  </c:if>
							  </button>
							  <div class="dropdown-menu" style="position:absolute;left:-88px;">
							  <c:url var="partnersProfile" value="partnersProfile.do">
						      	<c:param name="pId" value="${loginUser.memId }"/>
						      </c:url>
							    <a href="${partnersProfile }" class="dropdown-item">profile</a>
							    <a href="gotoAccountMypage.do" class="dropdown-item">myAccount</a>
							    <div class="dropdown-divider"></div>
							    <c:url var="logout" value="logout.do"/>
							    <a class="dropdown-item" onclick="location.href='${logout }'">logout</a>
							  </div>
							</div>
						</h3>
					</c:if>
				</c:if>
				</ul>
			</div>
	</nav>

	<script>
		$(function() {
			$("#navbarMain .nav-link").mouseenter(function() {
// 				$(this).css("font-size", "120%");
			})

			$("#navbarMain .nav-link").mouseleave(function() {
// 				$(this).css("font-size", "115%");
			})
		})
		
		
	</script>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
		crossorigin="anonymous"></script>
</body>
</html>