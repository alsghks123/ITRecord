<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
header.masthead {
	position: relative;
	background-color: #343a40;
	background: url("mainImg.jpg") no-repeat center center;
	background-size: cover;
	padding-top: 8rem;
	padding-bottom: 8rem;
	height: 50rem;
}

header.masthead .overlay {
	position: absolute;
	background-color: #212529;
	height: 100%;
	width: 100%;
	top: 0;
	left: 0;
	opacity: 0.3;
}

header.masthead h1 {
	font-size: 2rem;
}

@media ( min-width : 768px) {
	header.masthead {
		padding-top: 12rem;
		padding-bottom: 12rem;
	}
	header.masthead h1 {
		font-size: 3rem;
	}
}

.showcase .showcase-text {
	padding: 3rem;
}

.showcase .showcase-img {
	min-height: 30rem;
	background-size: cover;
}

@media ( min-width : 768px) {
	.showcase .showcase-text {
		padding: 7rem;
	}
}

/* 프로세스 관련 style */
.wizard .nav-tabs {
	position: relative;
	margin-bottom: 0;
	border-bottom-color: transparent;
}

.wizard>div.wizard-inner {
	position: relative;
	margin-bottom: 50px;
	text-align: center;
}

.connecting-line {
	height: 4px;
	background: #e0e0e0;
	position: absolute;
	width: 80%;
	margin: 0 auto;
	left: 0;
	right: 0;
	top: 0px;
	z-index: 1;
}

.wizard .nav-tabs>li.active>a, .wizard .nav-tabs>li.active>a:hover,
	.wizard .nav-tabs>li.active>a:focus {
	color: #555555;
	cursor: default;
	border: 0;
	border-bottom-color: transparent;
}

span.round-tab {
	width: 60px;
	height: 60px;
	line-height: 53px;
	display: inline-block;
	border-radius: 50%;
	background: #fff;
/* 	background: #117a8b; */
	z-index: 2;
	position: absolute;
	left: -30px;
	top: -30px;
	text-align: center;
	font-size: 28px !important;
	color: #0e214b;
	font-weight: 700;
	border: 1px solid #ddd;
}

span.round-tab i {
	color: #fff;
	font-size: 30px !important;
	text-indent:-5px;
}

.wizard li.active span.round-tab {
	background: #117a8b;
	color: #fff;
	border-color: #117a8b;
}

.wizard li.active span.round-tab i {
	color: #5bc0de;
}

.wizard .nav-tabs>li.active>a i {
	color: #117a8b;
}

.wizard .nav-tabs>li {
	width: 25%;
}

.wizard li:after {
	content: " ";
	position: absolute;
	left: 46%;
	opacity: 0;
	margin: 0 auto;
	bottom: 0px;
	border: 5px solid transparent;
	border-bottom-color: red;
	transition: 0.1s ease-in-out;
}

.wizard .nav-tabs>li a {
	width: 30px;
	height: 30px;
	margin: 20px auto;
	border-radius: 100%;
	padding: 0;
	background-color: transparent;
	position: relative;
	top: 0;
}

.wizard .nav-tabs>li a i {
	position: absolute;
	top: -53px;
	font-style: normal;
	font-weight: 400;
	white-space: nowrap;
	left: 51%;
	transform: translate(-50%, -50%);
	font-size: 18px;
	font-weight: 700;
	color: #fff;
	font-family: 'Spoqa Han Sans', 'Spoqa Han Sans JP',
		'Sans-serif' !important;
}

.wizard .nav-tabs>li a:hover {
	background: transparent;
}

/* 프로세스 style 끝 */

/* 채팅 iframe css */
.chatIframe {
	background-color: transparent;
    position: fixed;
    right: 40px;
    bottom: 35px;
	width:300px;
	height:500px;
	border-radius: 10px;
	border:none;
    box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12) !important;
    min-height: 500px;
    display: none;
    -webkit-animation: appear .15s cubic-bezier(.25, .25, .5, 1.1);
    animation: appear .15s cubic-bezier(.25, .25, .5, 1.1);
    -webkit-animation-fill-mode: forwards;
    animation-fill-mode: forwards;
    opacity: 0;
    z-index:9999999;
}
 @-webkit-keyframes appear {
    0% {
      opacity: 0;
      -webkit-transform: scale(0);
      transform: scale(0)
    }
    to {
      opacity: 1;
      -webkit-transform: scale(1);
      transform: scale(1)
    }
  }
  @keyframes appear {
    0% {
      opacity: 0;
      -webkit-transform: scale(0);
      transform: scale(0)
    }
    to {
      opacity: 1;
      -webkit-transform: scale(1);
      transform: scale(1)
    }
  }
  
  .row>.col h3{
  
  	max-width: 500px;
  	overflow: hidden;
  	white-space: nowrap;
   	text-overflow: ellipsis;
  }
  
  .row>.col p{
  
  	max-width: 500px;
  	overflow: hidden;
  	white-space: nowrap;
   	text-overflow: ellipsis;
  }
  
  
</style>

</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="menubar.jsp" />
	<!-- sideMenubar -->
	<jsp:include page="../common/pSubMenubar.jsp"/>
	

	<!-- 메인 -->
	<!-- Masthead -->
	<header class="masthead text-white text-center"
		style="background-image: url(${contextPath}/resources/images/mainImg.jpg);">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-xl-9 mx-auto" style="margin-top: 100px;">
					<h1 class="mb-5">Realize Your Dream With Devenue</h1>
				</div>
				<div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
					<form>
						<div class="form-row">
							<div class="col-12 col-md-9 mb-2 mb-md-0">
								<input type="email" class="form-control form-control-lg"
									placeholder="당신의 파트너스를 찾아보세요." style="font-family: 'Do Hyeon', sans-serif;">
							</div>
							<div class="col-12 col-md-3">
								<button type="submit" class="btn btn-block btn-lg btn-info">SEARCH</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</header>

	<script>
		$(
				function() {
					var flag = 1;
					setInterval(function() {
						if (flag == 1) {
							$("header.masthead").css('background-image',
									'url("${contextPath}/resources/images/mainImg2.jpg")').css(
									"background-repeat", "no-repeat").css(
									"background-position", "center center");
							
							flag = 2;
						} else {
							$("header.masthead").css('background-image',
									'url("${contextPath}/resources/images/mainImg.jpg")');
							flag = 1;
						}
					}, 10000);
				})
	</script>

	<!-- 추천 프로젝트(Tab Menu) -->
	<section style="background-color: #25292c;">
		<div class="row" style="padding-top: 120px; padding-bottom: 120px;">
			<div class="col-md-2"></div>

			<div class="col-md-8 text-white">
				<h3>
					<i class="fas fa-quote-left text-white"
						style="font-size: 20px; position: relative; top: -10px;"></i>회원들이 가장 많이 본 게시물<i class="fas fa-quote-right text-white"
						style="font-size: 20px; position: relative; top: -10px;"></i>
				</h3>
				<hr style="background-color: rgb(71, 78, 92);height:2px;">
				<br>
				<ul class="nav nav-pills" style="margin-bottom:8px;">
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#qwe" onclick="giveInfo(1);" id="p1">공지사항</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#asd" onclick="giveInfo(2);" id="p2">게시판</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#zxc" onclick="giveInfo(3);" id="p3">?</a></li>
				</ul>

				<script>
					$(function() {
						$("#p1").addClass("btn-secondary").css("color", "white");
						$("#p2").css("color", "white");
						$("#p3").css("color", "white");
					})

					function giveInfo(value) {
						console.log(value);

						if (value == 1) {
							$("#p1").addClass("btn-secondary").css("box-shadow",
									"none");
							$("#p2").removeClass("btn-secondary");
							$("#p3").removeClass("btn-secondary");
						} else if (value == 2) {

							$("#p1").removeClass("btn-secondary");
							$("#p2").addClass("btn-secondary").css("box-shadow",
									"none");
							$("#p3").removeClass("btn-secondary");
						} else {
							$("#p1").removeClass("btn-secondary");
							$("#p2").removeClass("btn-secondary");
							$("#p3").addClass("btn-secondary").css("box-shadow",
									"none");
						}
					}
				</script>
				<div class="tab-content">
					
					<!-- 웹프로젝트 시작 -->
					<c:if test="${fn:length(notice)>=1}">
					<div class="tab-pane fade show active" id="qwe">
						<div class="row mb-2">
						
							<div class="col-md-6">
								<div
									class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative text-white"
									style="background-color: #212426;border:2px solid rgb(61, 68, 82) !important;">
									<div class="col p-4 d-flex flex-column position-static">
										<strong class="d-inline-block mb-2 text-info">웹</strong>
										<h3 class="mb-0">${notice[0].nId}</h3>
										<p class="card-text mb-auto" style="font-size: 14px;">
											${notice[0].nId}
										</p>
										<div class="mb-1 text-muted">예상 예산:<fmt:formatNumber type="currency">	${notice[0].nId}</fmt:formatNumber>원</div>
										
										<c:url var="pdetail1" value="searchProjectDetail.do">
							            	<c:param name="id" value="${notice[0].nId}"/>
							            	<c:param name="page" value="1"/>
							            	<c:param name="mCategory" value="${notice[0].nId}"/>
							            	<c:param name="dCategory" value="${notice[0].nId}"/>
							            </c:url>
										
										<a href="	${notice[0].nId}" class="stretched-link" style="color:#17a2b8;">Continue reading</a>
									</div>
								</div>
							</div>
							
							<c:if test="${fn:length(web)>=2}">
							<div class="col-md-6">
								<div
									class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative text-white"
									style="background-color: #212426;border:2px solid rgb(61, 68, 82) !important;">
									<div class="col p-4 d-flex flex-column position-static">
										<strong class="d-inline-block mb-2 text-info">웹</strong>
										<h3 class="mb-0">${web[1].project.proName}</h3>
										<p class="card-text mb-auto" style="font-size: 14px;">
											${web[1].project.proSummary}
										</p>
										<div class="mb-1 text-muted">예상 예산:<fmt:formatNumber type="currency">${web[1].project.proPayment}</fmt:formatNumber>원</div>
										
										<c:url var="pdetail2" value="searchProjectDetail.do">
							            	<c:param name="id" value="${web[1].id}"/>
							            	<c:param name="page" value="1"/>
							            	<c:param name="mCategory" value="${web[1].mCategory}"/>
							            	<c:param name="dCategory" value="${web[1].dCategory}"/>
							            </c:url>
										
										<a href="${pdetail2}" class="stretched-link" style="color:#17a2b8;">Continue reading</a>
									</div>
								</div>
							</div>
							</c:if>
							
						</div>
						
						<c:if test="${fn:length(web)>=3}">
						<div class="row mb-2">
							<div class="col-md-6">
								<div
									class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative text-white"
									style="background-color: #212426;border:2px solid rgb(61, 68, 82) !important;">
									<div class="col p-4 d-flex flex-column position-static">
										<strong class="d-inline-block mb-2 text-info">웹</strong>
										<h3 class="mb-0">${web[2].project.proName}</h3>
										<p class="card-text mb-auto" style="font-size: 14px;">
											${web[2].project.proSummary}
										</p>
										<div class="mb-1 text-muted">예상 예산:<fmt:formatNumber type="currency">${web[2].project.proPayment}</fmt:formatNumber>원</div>
										
										<c:url var="pdetail3" value="searchProjectDetail.do">
							            	<c:param name="id" value="${web[2].id}"/>
							            	<c:param name="page" value="1"/>
							            	<c:param name="mCategory" value="${web[2].mCategory}"/>
							            	<c:param name="dCategory" value="${web[2].dCategory}"/>
							            </c:url>
										
										<a href="${pdetail3}" class="stretched-link" style="color:#17a2b8;">Continue reading</a>
									</div>
								</div>
							</div>
							
							<c:if test="${fn:length(web)>=4}">
							<div class="col-md-6">
								<div
									class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative text-white"
									style="background-color: #212426;border:2px solid rgb(61, 68, 82) !important;">
									<div class="col p-4 d-flex flex-column position-static">
										<strong class="d-inline-block mb-2 text-info">웹</strong>
										<h3 class="mb-0">${web[3].project.proName}</h3>
										<p class="card-text mb-auto" style="font-size: 14px;">
											${web[3].project.proSummary}
										</p>
										<div class="mb-1 text-muted">예상 예산:<fmt:formatNumber type="currency">${web[3].project.proPayment}</fmt:formatNumber>원</div>
										
										<c:url var="pdetail4" value="searchProjectDetail.do">
							            	<c:param name="id" value="${web[3].id}"/>
							            	<c:param name="page" value="1"/>
							            	<c:param name="mCategory" value="${web[3].mCategory}"/>
							            	<c:param name="dCategory" value="${web[3].dCategory}"/>
							            </c:url>
										
										<a href="${pdetail4}" class="stretched-link" style="color:#17a2b8;">Continue reading</a>
									</div>
								</div>
							</div>
							</c:if>
							
						</div>
						</c:if>
					</div>
					</c:if>
					<!-- 웹프로젝트 끝 -->
					
					<!-- 애플리케이션 프로젝트 시작 -->
					<c:if test="${fn:length(app)>=1}">
					<div class="tab-pane fade show" id="asd">
						<div class="row mb-2">
						
							<div class="col-md-6">
								<div
									class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative text-white"
									style="background-color: #212426;border:2px solid rgb(61, 68, 82) !important;">
									<div class="col p-4 d-flex flex-column position-static">
										<strong class="d-inline-block mb-2 text-info">앱</strong>
										<h3 class="mb-0">${app[0].project.proName}</h3>
										<p class="card-text mb-auto" style="font-size: 14px;">
											${app[0].project.proSummary}
										</p>
										<div class="mb-1 text-muted">예상 예산:<fmt:formatNumber type="currency">${app[0].project.proPayment}</fmt:formatNumber>원</div>
										
										<c:url var="pdetail5" value="searchProjectDetail.do">
							            	<c:param name="id" value="${app[0].id}"/>
							            	<c:param name="page" value="1"/>
							            	<c:param name="mCategory" value="${app[0].mCategory}"/>
							            	<c:param name="dCategory" value="${app[0].dCategory}"/>
							            </c:url>
										
										<a href="${pdetail5}" class="stretched-link" style="color:#17a2b8;">Continue reading</a>
									</div>
								</div>
							</div>
							
							<c:if test="${fn:length(app)>=2}">
							<div class="col-md-6">
								<div
									class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative text-white"
									style="background-color: #212426;border:2px solid rgb(61, 68, 82) !important;">
									<div class="col p-4 d-flex flex-column position-static">
										<strong class="d-inline-block mb-2 text-info">앱</strong>
										<h3 class="mb-0">${app[1].project.proName}</h3>
										<p class="card-text mb-auto" style="font-size: 14px;">
											${app[1].project.proSummary}
										</p>
										<div class="mb-1 text-muted">예상 예산:<fmt:formatNumber type="currency">${app[1].project.proPayment}</fmt:formatNumber>원</div>
										
										<c:url var="pdetail6" value="searchProjectDetail.do">
							            	<c:param name="id" value="${app[1].id}"/>
							            	<c:param name="page" value="1"/>
							            	<c:param name="mCategory" value="${app[1].mCategory}"/>
							            	<c:param name="dCategory" value="${app[1].dCategory}"/>
							            </c:url>
										
										<a href="${pdetail6}" class="stretched-link" style="color:#17a2b8;">Continue reading</a>
									</div>
								</div>
							</div>
							</c:if>
							
						</div>
						
						<c:if test="${fn:length(app)>=3}">
						<div class="row mb-2">
							<div class="col-md-6">
								<div
									class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative text-white"
									style="background-color: #212426;border:2px solid rgb(61, 68, 82) !important;">
									<div class="col p-4 d-flex flex-column position-static">
										<strong class="d-inline-block mb-2 text-info">앱</strong>
										<h3 class="mb-0">${app[2].project.proName}</h3>
										<p class="card-text mb-auto" style="font-size: 14px;">
											${app[2].project.proSummary}
										</p>
										<div class="mb-1 text-muted">예상 예산:<fmt:formatNumber type="currency">${app[2].project.proPayment}</fmt:formatNumber>원</div>
										
										<c:url var="pdetail7" value="searchProjectDetail.do">
							            	<c:param name="id" value="${app[2].id}"/>
							            	<c:param name="page" value="1"/>
							            	<c:param name="mCategory" value="${app[2].mCategory}"/>
							            	<c:param name="dCategory" value="${app[2].dCategory}"/>
							            </c:url>
										
										<a href="${pdetail7}" class="stretched-link" style="color:#17a2b8;">Continue reading</a>
									</div>
								</div>
							</div>
							
							<c:if test="${fn:length(app)>=4}">
							<div class="col-md-6">
								<div
									class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative text-white"
									style="background-color: #212426;border:2px solid rgb(61, 68, 82) !important;">
									<div class="col p-4 d-flex flex-column position-static">
										<strong class="d-inline-block mb-2 text-info">앱</strong>
										<h3 class="mb-0">${app[3].project.proName}</h3>
										<p class="card-text mb-auto" style="font-size: 14px;">
											${app[3].project.proSummary}
										</p>
										<div class="mb-1 text-muted">예상 예산:<fmt:formatNumber type="currency">${app[3].project.proPayment}</fmt:formatNumber>원</div>
										
										<c:url var="pdetail8" value="searchProjectDetail.do">
							            	<c:param name="id" value="${app[3].id}"/>
							            	<c:param name="page" value="1"/>
							            	<c:param name="mCategory" value="${app[3].mCategory}"/>
							            	<c:param name="dCategory" value="${app[3].dCategory}"/>
							            </c:url>
										
										<a href="${pdetail8}" class="stretched-link" style="color:#17a2b8;">Continue reading</a>
									</div>
								</div>
							</div>
							</c:if>
							
						</div>
						</c:if>
					</div>
					</c:if>
					<!-- 애플리케이션 프로젝트 끝 -->
					
					
					<!-- 퍼블리싱 프로젝트 시작 -->
					<c:if test="${fn:length(pub)>=1}">
					<div class="tab-pane fade show" id="zxc">
						<div class="row mb-2">
						
							<div class="col-md-6">
								<div
									class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative text-white"
									style="background-color: #212426;border:2px solid rgb(61, 68, 82) !important;">
									<div class="col p-4 d-flex flex-column position-static">
										<strong class="d-inline-block mb-2 text-info">퍼블리싱</strong>
										<h3 class="mb-0">${pub[0].project.proName}</h3>
										<p class="card-text mb-auto" style="font-size: 14px;">
											${pub[0].project.proSummary}
										</p>
										<div class="mb-1 text-muted">예상 예산:<fmt:formatNumber type="currency">${pub[0].project.proPayment}</fmt:formatNumber>원</div>
										
										<c:url var="pdetail9" value="searchProjectDetail.do">
							            	<c:param name="id" value="${pub[0].id}"/>
							            	<c:param name="page" value="1"/>
							            	<c:param name="mCategory" value="${pub[0].mCategory}"/>
							            	<c:param name="dCategory" value="${pub[0].dCategory}"/>
							            </c:url>
										
										<a href="${pdetail9}" class="stretched-link" style="color:#17a2b8;">Continue reading</a>
									</div>
								</div>
							</div>
							
							<c:if test="${fn:length(pub)>=2}">
							<div class="col-md-6">
								<div
									class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative text-white"
									style="background-color: #212426;border:2px solid rgb(61, 68, 82) !important;">
									<div class="col p-4 d-flex flex-column position-static">
										<strong class="d-inline-block mb-2 text-info">퍼블리싱</strong>
										<h3 class="mb-0">${pub[1].project.proName}</h3>
										<p class="card-text mb-auto" style="font-size: 14px;">
											${pub[1].project.proSummary}
										</p>
										<div class="mb-1 text-muted">예상 예산:<fmt:formatNumber type="currency">${pub[1].project.proPayment}</fmt:formatNumber>원</div>
										
										<c:url var="pdetail10" value="searchProjectDetail.do">
							            	<c:param name="id" value="${pub[1].id}"/>
							            	<c:param name="page" value="1"/>
							            	<c:param name="mCategory" value="${pub[1].mCategory}"/>
							            	<c:param name="dCategory" value="${pub[1].dCategory}"/>
							            </c:url>
										
										<a href="${pdetail10}" class="stretched-link" style="color:#17a2b8;">Continue reading</a>
									</div>
								</div>
							</div>
							</c:if>
							
						</div>
						
						<c:if test="${fn:length(pub)>=3}">
						<div class="row mb-2">
							<div class="col-md-6">
								<div
									class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative text-white"
									style="background-color: #212426;border:2px solid rgb(61, 68, 82) !important;">
									<div class="col p-4 d-flex flex-column position-static">
										<strong class="d-inline-block mb-2 text-info">퍼블리싱</strong>
										<h3 class="mb-0">${pub[2].project.proName}</h3>
										<p class="card-text mb-auto" style="font-size: 14px;">
											${pub[2].project.proSummary}
										</p>
										<div class="mb-1 text-muted">예상 예산:<fmt:formatNumber type="currency">${pub[2].project.proPayment}</fmt:formatNumber>원</div>
										
										<c:url var="pdetail11" value="searchProjectDetail.do">
							            	<c:param name="id" value="${pub[2].id}"/>
							            	<c:param name="page" value="1"/>
							            	<c:param name="mCategory" value="${pub[2].mCategory}"/>
							            	<c:param name="dCategory" value="${pub[2].dCategory}"/>
							            </c:url>
										
										<a href="${pdetail11}" class="stretched-link" style="color:#17a2b8;">Continue reading</a>
									</div>
								</div>
							</div>
							
							<c:if test="${fn:length(pub)>=4}">
							<div class="col-md-6">
								<div
									class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative text-white"
									style="background-color: #212426;border:2px solid rgb(61, 68, 82) !important;">
									<div class="col p-4 d-flex flex-column position-static">
										<strong class="d-inline-block mb-2 text-info">퍼블리싱</strong>
										<h3 class="mb-0">${pub[3].project.proName}</h3>
										<p class="card-text mb-auto" style="font-size: 14px;">
											${pub[3].project.proSummary}
										</p>
										<div class="mb-1 text-muted">예상 예산:<fmt:formatNumber type="currency">${pub[3].project.proPayment}</fmt:formatNumber>원</div>
										
										<c:url var="pdetail12" value="searchProjectDetail.do">
							            	<c:param name="id" value="${pub[3].id}"/>
							            	<c:param name="page" value="1"/>
							            	<c:param name="mCategory" value="${pub[3].mCategory}"/>
							            	<c:param name="dCategory" value="${pub[3].dCategory}"/>
							            </c:url>
										
										<a href="${pdetail12}" class="stretched-link" style="color:#17a2b8;">Continue reading</a>
									</div>
								</div>
							</div>
							</c:if>
							
						</div>
						</c:if>
					</div>
					</c:if>
					<!-- 퍼블리싱 프로젝트 끝 -->
					
					
				</div>
			</div>

			<div class="col-md-2"></div>
		</div>
		</div>
		</div>
	</section>
	<!-- 추천 프로젝트 끝 -->

	<script>
		$(document).ready(function() {
			$('.round-tab').click(function() {
				$('.round-tab').parents('li').removeClass("active");
				$(this).parents('li').addClass("active");
			});
		});
	</script>

	<!-- Image Showcases -->
	<section class="showcase">
		<div class="container-fluid p-0">
			<div class="row no-gutters" style="background-color: #212426;padding-top: 70px;padding-bottom: 70px;">
				<div class="col-lg-6 order-lg-2 text-white showcase-img"
					style="background-image: url('${contextPath}/resources/images/showcase.jpg');"></div>
				<div class="col-lg-6 order-lg-1 my-auto showcase-text text-white" style="text-align:center;">
					<h2>최고의 TF와 연결되어 보세요.</h2>
					<p class="lead mb-0">Devenue에서 빠르고 안전한 IT 아웃소싱을 경험해보세요.</p>
				</div>
			</div>
	</section>
	<!-- Image Showcases end-->

	<!-- 프로세스 시작 -->
	<section class="signup-step-container text-white"
		style="background-color: #25292c;padding-top: 150px;padding-bottom: 70px;">
		<div class="container">
			<div class="row d-flex justify-content-center">
				<div class="col-md-10">
					<div class="wizard">
						<div class="wizard-inner">
							<div class="connecting-line"></div>
							<ul class="nav nav-tabs" role="tablist">
								<li role="presentation" class="active"><a href="#step1"
									data-toggle="tab" aria-controls="step1" role="tab"
									aria-expanded="true"><span class="round-tab">1 </span> <i>프로젝트
											등록</i></a></li>
								<li role="presentation" class="disabled"><a href="#step2"
									data-toggle="tab" aria-controls="step2" role="tab"
									aria-expanded="false"><span class="round-tab">2</span> <i>지원자
											모집</i></a></li>
								<li role="presentation" class="disabled"><a href="#step3"
									data-toggle="tab" aria-controls="step3" role="tab"><span
										class="round-tab">3</span> <i>프로젝트 계약</i></a></li>
								<li role="presentation" class="disabled"><a href="#step4"
									data-toggle="tab" aria-controls="step4" role="tab"><span
										class="round-tab">4</span> <i>프로젝트 진행</i></a></li>
							</ul>
						</div>

						<div class="tab-content" id="main_form" style="margin-top: 100px;">

							<div class="tab-pane active jumbotron text-white rounded"
								role="tabpane1" id="step1"
								style="background-image: url(${contextPath}/resources/images/process1.jpg); background-position: center center;">
								<h1 class="display-4 text-info"
									style="font-family: 'Do Hyeon', sans-serif;">STEP 1</h1>
								<p class="lead"
									style="font-family: 'Do Hyeon', sans-serif; font-size: 40px;">프로젝트
									등록 및 상담</p>
								<hr class="my-4">
								<p style="font-family: 'Do Hyeon', sans-serif;">
									프로젝트에 딱 맞는 맞춤 상담을 받아보세요. <br> 프로젝트를 등록해 주시면 내용 작성을 도와드립니다.
								</p>
								<a class="btn btn-info btn-lg" href="#" role="button"
									style="float: right;">Learn more</a>
							</div>

							<div class="tab-pane jumbotron text-white" role="tabpane2"
								id="step2"
								style="background-image: url(${contextPath}/resources/images/process2.jpg); background-position: center center;">
								<h1 class="display-4 text-info"
									style="font-family: 'Do Hyeon', sans-serif;">STEP 2</h1>
								<p class="lead"
									style="font-family: 'Do Hyeon', sans-serif; font-size: 40px;">지원자
									모집 및 선택</p>
								<hr class="my-4">
								<p style="font-family: 'Do Hyeon', sans-serif;">
									마음에 드는 믿을만한 파트너를 만나보세요. <br> 유사프로젝트를 진행한 경험이 있는 파트너에게 프로젝트
									분석 및 제안을 받아볼 수 있습니다.
								</p>
								<a class="btn btn-info btn-lg" href="#" role="button"
									style="float: right;">Learn more</a>
							</div>

							<div class="tab-pane jumbotron text-white" role="tabpane3"
								id="step3"
								style="background-image: url(${contextPath}/resources/images/process3.jpg); background-position: center center;">
								<h1 class="display-4 text-info"
									style="font-family: 'Do Hyeon', sans-serif;">STEP 3</h1>
								<p class="lead"
									style="font-family: 'Do Hyeon', sans-serif; font-size: 40px;">프로젝트
									계약</p>
								<hr class="my-4">
								<p style="font-family: 'Do Hyeon', sans-serif;">
									계약과정이 복잡하고 번거로우셨나요? <br> 아웃소싱에 특화된 계약 시스템을 이용해 보세요.
								</p>
								<a class="btn btn-info btn-lg" href="#" role="button"
									style="float: right;">Learn more</a>
							</div>

							<div class="tab-pane jumbotron text-white" role="tabpane4"
								id="step4"
								style="background-image: url(${contextPath}/resources/images/process4.jpg); background-position: center center;">
								<h1 class="display-4 text-info"
									style="font-family: 'Do Hyeon', sans-serif;">STEP 4</h1>
								<p class="lead"
									style="font-family: 'Do Hyeon', sans-serif; font-size: 40px;">프로젝트
									진행 및 완료</p>
								<hr class="my-4">
								<p style="font-family: 'Do Hyeon', sans-serif;">
									Devenue의 안전한 대금보호시스템을 사용해보세요.<br> 혹시 모를 분쟁도 안심중재 솔루션을 통해
									원만하게 해결할 수 있습니다.
								</p>
								<a class="btn btn-info btn-lg" href="#" role="button"
									style="float: right;font-family: 'Lato', 'Helvetica Neue', Helvetica, Arial, sans-serif !important;">Learn more</a>
							</div>



							<div class="clearfix"></div>
						</div>


					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 프로세스 끝 -->
	
	<!-- 채팅 불러오기 -->
	
	
	<!-- footer -->
	<jsp:include page="footer.jsp"/>
</body>
</html>