<%@ include file="../common/tag.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
 <script src="/js/admin/admin.js"></script>
    <link href="/css/container.css" rel="stylesheet">
    <link href="/css/admin.css" rel="stylesheet">
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


		</form>
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

				<!-- 게시판 내용 -->
				<tbody class="listData">

				<c:choose>
					<c:when test="${fn:length(userList) == 0}">
						<tr><td colspan="7"><br>검색된 내용이 없습니다.</td></tr>
					</c:when>

				<c:otherwise>
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
				</c:otherwise>
			</c:choose>
				</tbody>
			</table>
		</div>
	</div>
</div>
</body>
<%@include file="../common/footer.jsp" %>

</html>