<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>


<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.min.js"></script>

<script type="text/javascript" src="resources/js/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript">

var oEditors = [];
$(function(){
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: oEditors,
        elPlaceHolder: "ir1", //textarea에서 지정한 id와 일치해야 합니다. 
        //SmartEditor2Skin.html 파일이 존재하는 경로
        sSkinURI: "resources/SmartEditor2Skin.html",  
        htParams : {
            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseToolbar : true,             
            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : true,     
            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger : true,         
            fOnBeforeUnload : function(){
                 
            }
        }, 
        fOnAppLoad : function(){
            //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
            oEditors.getById["ir1"].exec("PASTE_HTML", ["기존 DB에 저장된 내용을 에디터에 적용할 문구"]);
        },
        fCreator: "createSEditor2"
    });
    
  
    //저장버튼 클릭시 form 전송
    $("#save").click(function(){
        oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
        $("#frm").submit();
    });
    
    
});


 
 
</script>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	<h1 align ="center">게시글 작성하기 </h1>
	<br>
	
	<form action="binsert.do" method="post" enctype="multipart/form-data" id="frm">
			<table align="center" border="1"  width="800">
			<tr>
				<td>제목</td>
				<td>
					<input type="text" size ="50" name="bTitle">
				</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>
					<input type="text" name="bWriter" value="${loginUser.id }" readonly>
				</td>
			</tr>
			<tr>
				<td>리그</td>
				<td>
					<select name ="bLea">
						<option value="EPL">EPL</option>
						<option value="BUNDES">BUNDES</option>
						<option value ="SERIE">SERIE</option>
						<option value ="PRIMERA">PRIMERA</option>
					</select>
				</td>
			<tr>
				<td>내용</td>
				<td>
			 <textarea rows="10" cols="30" id="ir1" name="bContent" style="width:800px; height:350p"></textarea>
				</td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td>
					
					<input type='file' name='buploadFile' accept='image/jpeg,image/gif,image/png' >
				</td>	
			</tr>
			<tr>
				<td colspan="2" align="center">
				 <input type="button" id="save" value="저장"/>
				 
				 <input type ="button" onclick="location.href ='blist.do'" value ="목록으로"/>
					
				</td>
			</tr>			
		</table>
		
	
	</form>
</body>
</html>