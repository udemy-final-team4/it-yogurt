<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../common/tag.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <link href="/css/header.css" rel="stylesheet">
    <link href="/css/footer.css" rel="stylesheet">
    <link href="/css/container.css" rel="stylesheet">
     <link href="/css/admin.css" rel="stylesheet">
     <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"
		    rel="stylesheet"/>
<title> 커뮤니티 | 게시판 </title>

<style>

</style>
</head>
<body>
<%@include file="../common/nav.jsp"%>
<div class="container">
     <div class="form">
		<h3 id="main" > 검색결과 </h3> <br>
		
		<!-- 검색을 위한 form -->
	<form action="<%=request.getContextPath()%>/board/list/searchResult" id="">
	<!-- 검색창 -->
	<input type="text" placeholder="검색어 입력" name="keyword" id="keyword">
    <button type="submit" id="search">검색</button>
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
		
		
	<%-- <!-- 페이징 -->
	<div class="paging">
	<nav aria-label="Page navigation example" style="margin: 10px;">
			
		<ul class="pagination justify-content-center">
		<!-- 페이지 처음으로 가기 -->
	        <li class="page-item">
	        	<a href='javascript:void(0);' onclick="go_page(1); return false;" class="page-link">
	        		<i class="fas fa-angle-double-left"></i>
	        	</a>
	        </li>
	    <c:if test="${paging.prev}">
	        <li class="page-item">
	        	<a href='javascript:void(0);' onclick="go_page(${paging.startPage-1});" class="page-link">
		        	<i class="fas fa-angle-left"></i>
		        </a>
	        </li>
	    </c:if>
	    <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="num">
	    	<c:choose>
	    		<c:when test= "${num==1 }">
	        		<li class="page-item active" style="pagination-bg: #91ACCC"><span><a href='javascript:void(0);' onclick="go_page(${num}); return false;" class="page-link">${num}</a></span></li>
				</c:when>
				<c:otherwise>
	        		<li class="page-item" style="pagination-bg: #91ACCC"><span><a href='javascript:void(0);' onclick="go_page(${num}); return false;" class="page-link">${num}</a></span></li>
				</c:otherwise>
			</c:choose>	        
	    </c:forEach>
	    <c:if test="${paging.next && paging.endPage>0}">

	        <li class="page-item">
	        	<a href='javascript:void(0);' onclick="go_page(${paging.endPage+1});return false;" class="page-link">
	        		<i class="fas fa-angle-right"></i>
	        	</a>
	        </li>
		 </c:if>
	        <li class="page-item">
	        	<a href='javascript:void(0);' onclick="go_page(${maxpage});return false;" class="page-link">
	        		<i class="fas fa-angle-double-right"></i>
	        	</a>
	        </li>
		</ul>

	</nav>
	</div>
	 --%>
<div class="d-grid gap-2 d-sm-flex justify-content-sm-end">
<!-- 글쓰기 버튼  -->
<c:choose>
	<c:when test="${ not empty sessionScope.user_seq}">
  		<button class="btn btn-primary" style="background-color: #91ACCC; font-size: 15px; width: 80px;" type="button" onClick="location.href='/board/form'">글쓰기</button>
	</c:when>
	<c:otherwise>
  		<button class="btn btn-primary" disabled="disabled" style="background-color: #91ACCC; font-size: 15px; width: 80px;" type="button" onClick="location.href='/board/form'">글쓰기</button>
	</c:otherwise>
</c:choose>
</div>
	</div>

</div>
</body>



<script>


$(document).ready(function () {
  $('#search').click(function (e) {
    if ($('#keyword').val() == "") {
      e.preventDefault()
      alert("검색어를 입력해주세요!")
      return false;
    }
  })
});









W
</script>

<%@include file="../common/footer.jsp" %>
</html>