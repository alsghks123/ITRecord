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
	<jsp:include page="../common/menubar.jsp"></jsp:include>
	
	<h1 align="center">${notice.nId }번 게시글</h1>
	
	<br><br>
	
	<table align="center" border="1"  width ="400">
		<tr>
			<td>번호</td>
			<td>${notice.nId }</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>${notice.nTitle }</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${notice.nWriter }</td>
		</tr>		
		<tr>
			<td>작성날짜</td>
			<td>${notice.nCreateDate }</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>${notice.nContent }</td>
		</tr>
		
			<c:if test="${!empty notice.filePath }">
			<tr>
				<td>첨부파일</td>
				<td>
					<img src="${contextPath }/resources/nuploadFiles/${notice.filePath}">
					<br>
					<a href="${contextPath }/resources/nuploadFiles/${notice.filePath }"></a>
				
				</td>
			</tr>		
			</c:if>			
			<c:url var ="nupView" value="nupView.do">
				<c:param name ="nId" value=${notice.nId }>
			</c:param>	
			</c:url>
			<c:url var ="ndelete" value ="ndelete.do">
				<c:param name="nId" value="${notice.nId }"/>
			</c:url>
			
			<c:if test="${loginUser.id eq notice.nWriter }">
			  <tr>
			  	<td colspan ="2" align="center">
			  		<a href ="${nupView }">수정 페이지로 이동</a> &nbsp; &nbsp;
			  		<a href ="${ndelete }">삭제하기</a>
			  	</td>
			  </tr>	
			</c:if>	
	</table>
	<br><br><br><br>
</body>
</html>