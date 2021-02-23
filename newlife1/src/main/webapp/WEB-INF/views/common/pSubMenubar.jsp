<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.bg-light{
		background: #7F7FD5;
	    background: -webkit-linear-gradient(to bottom, #2a2f38, #272b31, #26292c);
	    background: linear-gradient(to bottom, #2a2f38, #272b31,#26292c);
		border-bottom:1px solid #2a2f38;
	}
	
	#pSubMenubar .nav-item a{
		color:white !important;
	}
</style>
</head>
<body>
	<!--navigation bar2-->
	<nav class="navbar navbar-expand-lg navbar-light bg-light" id="pSubMenubar">
		<div class="collapse navbar-collapse" id="navbarSub" style="margin-left: 3%;">
			<ul class="navbar-nav">
				<li class="nav-item">
					<c:url var="partnersProfile" value="partnersProfile.do">
			        	<c:param name="pId" value="${loginUser.memId }"/>
			        </c:url>
					<a class="nav-link ml-4 hvr-underline-from-center" href="${partnersProfile }">내 프로필</a></li>
				<li class="nav-item">
				<a class="nav-link ml-4 hvr-underline-from-center" href="likeProjectList.do">관심 프로젝트 </a></li>
				
				<c:url var="suggest" value="suggestProjectList.do">
				
				</c:url>
				
				<li class="nav-item">
				<a class="nav-link ml-4 hvr-underline-from-center" href="${suggest}">지원 요청</a></li>
				<li class="nav-item">
				<a class="nav-link ml-4 hvr-underline-from-center" href="selectApplyProject.do">지원 내역</a></li>
				<li class="nav-item">
				<a class="nav-link ml-4 hvr-underline-from-center" href="ongoingProjectList.do">진행중인 프로젝트</a></li>
				
				<c:url var="complete" value="completeProjectList.do">
				
				</c:url>
				
				<li class="nav-item">
				<a class="nav-link ml-4 hvr-underline-from-center" href="completeProjectList.do">완료한 프로젝트</a></li>
			</ul>
		</div>
	</nav>
</body>
</html>