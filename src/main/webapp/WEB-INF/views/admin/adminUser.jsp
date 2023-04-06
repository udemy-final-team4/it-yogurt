<%@ include file="../common/tag.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
 <script src="/js/admin/admin.js"></script>
    <link href="/css/admin.css" rel="stylesheet">
    <link href="/css/container.css" rel="stylesheet">
 	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" rel="stylesheet"/>
    

<title> 관리자 | 유저관리 </title>
</head>

<style>
#keyword {
    border-radius: 15px;
    width: 300px;
}
</style>
<%@include file="../common/nav.jsp" %>
<body>
<div class="container">
	<div class="content">
    <div class="form" id="user-form">
		<button class="btn btn-primary px-5 py-2" onclick="location.href='/admin/user'">회원관리</button>
		<button class="btn btn-primary px-5 py-2" onclick="location.href='/admin/contents'">컨텐츠 등록</button> <br><br>
		<h3 id="main" >👨‍💼 전체 회원 👩‍💼</h3> <br>
		<button class="btn btn-primary px-5 py-2" onclick="location.href='/admin/user/black'">블랙 회원</button> <br><br>

		<!-- 검색을 위한 form -->
	<form action="<%=request.getContextPath()%>/admin/list/searchResult" id="">
	<!-- 검색창 -->
	<input type="text" placeholder="닉네임 입력" name="keyword" id="keyword">
    <button type="submit" id="search">검색</button>

		
		<table class="table">
			<tr>
				<th> 번호 </th>
				<th> 이메일 </th>
				<th> 닉네임 </th>
				<th> 신고 </th>
				<th> 마지막 로그인 </th>
				<th> 탈퇴  </th>
				<th> 블랙 </th>
			</tr>
			<tbody class="listData">
			<c:forEach items="${userList }" var="list">
			<c:set var="num" value="${num+1}"></c:set>
			<tr>
				<td id ="userSeq">${num}</td>
				<td>${list.email }</td>
				<td>${list.nickname }</td>
				<td>${list.declaration }</td>
				<td>${list.lastloginDate }</td>
				<td><button class= "delUserBtn" style="border-color: #C0D8C0" onclick="clicked(${list.userSeq },'${list.nickname }')">탈퇴</button></td>
				<td><button class= "black" onclick="black(${list.userSeq },'${list.email }','${list.nickname }')">블랙</button></td>
			</tr>
			</c:forEach>
			</tbody>
		</table>
	</form>

	<div class="paging">
		<nav aria-label="Page navigation example" style="margin: 10px;">
			<ul class="pagination justify-content-center">
	        <li class="page-item"><span><a href='javascript:void(0);' onclick="go_UserPage(1); return false;" class="page-link"><i class="fas fa-angle-double-left"></i></a></span></li>
	    <c:if test="${paging.prev}">
	        <li class="page-item"><span><a href='javascript:void(0);' onclick="go_UserPage(${paging.startPage-1});" class="page-link"><i class="fas fa-angle-left"></i></a></span></li>
	    </c:if>
	    <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="num">
	    	<c:choose>
	    		<c:when test= "${num==1 }">
	        		<li class="page-item active" style="pagination-bg: #91ACCC"><span><a href='javascript:void(0);' onclick="go_UserPage(${num}); return false;" class="page-link">${num}</a></span></li>
				</c:when>
				<c:otherwise>
	        		<li class="page-item" style="pagination-bg: #91ACCC"><span><a href='javascript:void(0);' onclick="go_UserPage(${num}); return false;" class="page-link">${num}</a></span></li>
				</c:otherwise>
			</c:choose>	        
	    </c:forEach>
	    <c:if test="${paging.next && paging.endPage>0}">
	        <li class="page-item"><span><a href='javascript:void(0);' onclick="go_UserPage(${paging.endPage+1});return false;" class="page-link"><i class="fas fa-angle-right"></i></a></span></li>
		 </c:if>
	        <li class="page-item"><span><a href='javascript:void(0);' onclick="go_UserPage(${maxpage});return false;" class="page-link"><i class="fas fa-angle-double-right"></i></a></span></li>
			</ul>
		</nav>
	</div>
	 
</div>

</div>
</div>
</body>
<%@include file="../common/footer.jsp" %>

</html>