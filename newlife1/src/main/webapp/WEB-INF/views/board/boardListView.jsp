<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
<body>

	<h1 align ="center">게시글 목록</h1>
	
	<h3 align ="center"> 
		<c:if test ="${!empty loginUser }">
		<button onclick ="location.href ='binsertView.do'">글쓰기</button>
		</c:if>
	</h3>
	
	<table align="center" border ="solid blue 2px" width="800" id ="td">
		<tr>
			<th>번호</th>
			<th>리그</th>
			<th width ="300">제목</th>
			<th>작성자</th>
			<th>조회수</th>
			<th>첨부파일</th>
		</tr>
		<c:forEach var ="b" items="${list }">
		<tr>
			<td align ="center">"${b.bId }"</td>
			<td align ="left">
				<c:if test="${!empty loginUser}">
					<c:url var ="bdetail" value="bdetail.do">
						<c:param name= "bId" value="${b.bId }"/>
						<c:param name ="page" value="${pi.currentPage }"/>
					</c:url>
					<a href ="${bdetail }">${b.bTitle }
					<c:if test="${!empty b.originalFileName }">
						<img src="${contextPath }/resources/images/sitelogo.png"/>
					</c:if>
					</a>
				</c:if>
			<c:if test ="${empty loginUser }">
				<a href="#" id="notAllow" >

			${b.bTitle }
			</c:if>
		</td>
		<td>${b.bWriter }</td>
		<td>${b.bCreateDate }</td>
		<td>${b.bCount }</td>
		<td>
			
		</c:forEach>	
	</table>

	<script>
	$("#notAllow").click(function(){
		alert("로그인을 하셔야 열람이 가능합니다.");
	});
	</script>
</body>
</html>