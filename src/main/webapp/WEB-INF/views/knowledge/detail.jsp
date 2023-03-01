<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
<!--     <link href="/css/header.css" rel="stylesheet"> -->
<!--     <link href="/css/footer.css" rel="stylesheet"> -->
    <link href="/css/container.css" rel="stylesheet">
     <link href="/css/styles.css" rel="stylesheet">
    <link href="/css/login.css" rel="stylesheet">
    <link href="/css/knowledge.css" rel="stylesheet">
    <title>매일지식</title>
</head>
<%@include file="../common/nav.jsp"%>
<body>
<div class="container">
    <div class="content">
        <!-- 퀴즈 푸는 화면 이동 form -->
        <form action=" <%=request.getContextPath()%>/quiz/${knowSeq}">
            <div>
                <!-- 퀴즈 목록 테이블 -->
                <table id="detailTbl">
                    <div id="knowledgeDetailDiv">
                    	<tr>
                            <td><h1>${title}</h1></td>
                        </tr>
                        <tr>
                        	<td id="detailWriterTd">작성자 : 관리자</td>
                        </tr>
                        <!-- 카테고리 -->
                        <tr>
                            <td id="detailCategoryTd">
                            	<a class="badge bg-secondary text-decoration-none link-light" href="<%=request.getContextPath()%>/knowledge/list?category=all">${categoryInfo.main}</a>
                            	<a class="badge bg-secondary text-decoration-none link-light" href="<%=request.getContextPath()%>/knowledge/list?category=${categoryInfo.middle}">${categoryInfo.middle}</a>
                            	<a class="badge bg-secondary text-decoration-none link-light" href="#!">${categoryInfo.sub}</a><br>
                            </td>
                        </tr>
                    </div>
                    <tr>
                        <td id="detailContentTd">${contents }</td>
                    </tr>
                    <tr>
                        <td id="detailBtnDiv" >
	                        <input type="submit" value="퀴즈 풀러가기" id="subBtn" class="detailInput">
	                        <input type="button" value="목록" id="knowList" class="detailInput" onclick="goKnowList()">
                            <input type="hidden" value="${knowSeq}" name="knowSeq">
                        </td>
                    </tr>
                </table>
            </div>
        </form>
    </div>
</div>
<%@include file="../common/footer.jsp"%>
<script type="text/javascript">
	function goKnowList(){
		location.href="${pageContext.request.contextPath}/knowledge/list?category=all";
	}
</script>
</body>
</html>