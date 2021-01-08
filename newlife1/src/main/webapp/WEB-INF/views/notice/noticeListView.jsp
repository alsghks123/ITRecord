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
	
	<h1 align ="center">공지사항 </h1>
	<br><br>
	
	
		<c:if test ="${loginUser.id eq 'admin' }">
			<div align= "center">
				<button onclick ="location.href='nWriterView.do'">글쓰기</button>
				
			</div>
		</c:if>
		
		<br>
		
		<table align ="center" width="600" border ="1" cellspcing="0" style= "clear:right;" id ="td">
			<tr bgcolor = "#99ccff">
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>올린 날짜</th>
				<th>첨부 파일</th>
			</tr>
			
		<c:forEach var ="n" items="${list }">
			<tr>
				<td align="center">${n.nId}</td>
				<td>
					<c:if test="${!empty loginUser }">
						<c:url var ="ndetail" value="ndetail.do">
							<c:param name ="nId" value="${n.nId }"/>
						</c:url>
						<a href ="${ndetail}"> ${n.nTitle }</a>
					</c:if>
					<c:if test="${empty loginUser }">
					<a href="#" id="notAllow" >
					 ${n.nTitle }
					 </a>
					</c:if>	
				</td>
				<td align="center">${n.nWriter }</td>
				<td align ="center">${n.nCreateDate }</td>
				
				
				<td align="center">
				<c:if test="${!empty n.filePath }">
				 ★
				 </c:if>
				 <c:if test="${empty n.filePath }">
				 &nbsp;
				 </c:if>
				</td>
	
			</tr>
	</c:forEach>	
			
	<script>
	$("#notAllow").click(function(){
		alert("로그인을 하셔야 열람이 가능합니다.");
	});
	</script>
	

</body>
</html>