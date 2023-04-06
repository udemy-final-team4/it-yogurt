<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../common/tag.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <link href="/css/container.css" rel="stylesheet">
     <link href="/css/admin.css" rel="stylesheet">
     <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"
		    rel="stylesheet"/>
	<script src="/js/board/board.js"></script>
<title> 커뮤니티 | 게시판 </title>

<style>
#keyword {
    border-radius: 15px;
    width: 300px;
}
</style>
</head>
<body>
<%@include file="../common/nav.jsp"%>
<div class="container">
<div class="content">
     <div class="form">
		<h3 id="main" >📋 검색결과 📋</h3> <br>
		
		<!-- 검색을 위한 form -->
	<form action="<%=request.getContextPath()%>/board/list/searchResult" id="">
	<!-- 검색창 -->
	<input type="text" placeholder="검색어 입력" name="keyword" id="keyword">
    <button class="btn me-md-2" style="background-color: #91ACCC;" type="submit" id="search">검색</button>
	</form>
	<!-- 게시판 테이블 -->		
		<table class="table">
		<!-- 게시판 제목 -->
		<thead>
			<tr>
				<th> 번호 </th>
				<th> 카테고리 </th>
				<th> 제목 </th>
				<th> 작성자 </th>
				<th> 조회수 </th>
			</tr>
		</thead>	
		<!-- 게시판 내용 -->		
			<tbody class="listData">
				<c:set var="num" value="${paging.totalCount - ((paging.cri.page-1)* 10)}"/>
				
			<c:choose>
				<c:when test="${fn:length(boardList) == 0}">
					<tr><td colspan="5"><br>검색된 내용이 없습니다.</td></tr>
				</c:when>
								
			<c:otherwise>		
			
			
			
			
			<c:forEach items="${boardList }" var="list">
			<tr class="tableList" onClick="location.href='/board/${list.boardSeq}'">
				<td id ="boardSeq">${num}</td>	
				<td>
				<span class="badge bg-secondary text-decoration-none link-light"> ${list.sub }</span>
				</td>
				<td style="text-align: left;">${list.title }</td>
				<td>${list.nickname }</td>
				<td>${list.viewcount }</td>
			</tr>
			<c:set var="num" value="${num-1 }"></c:set>
			</c:forEach>
			
			</c:otherwise>
		</c:choose>
		
			</tbody>
			</table>
		
		
<div class="d-grid gap-2 d-sm-flex justify-content-sm-end">
<!-- 글쓰기 버튼  -->
  		<button class="btn btn-primary" style="background-color: #91ACCC; font-size: 15px; width: 80px;" type="button" onClick="location.href='/board/form'">글쓰기</button>
</div>
	</div>

</div>
</div>
</body>



 

<%@include file="../common/footer.jsp" %>
</html>