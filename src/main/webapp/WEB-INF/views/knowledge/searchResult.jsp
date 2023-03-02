<%@ page language="java" contentType="text/html;charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@include file="../common/tag.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <link href="/css/header.css" rel="stylesheet"> -->
<!-- <link href="/css/footer.css" rel="stylesheet"> -->
<link href="/css/container.css" rel="stylesheet">
<link href="/css/knowledge.css" rel="stylesheet">
<link href="/css/styles.css" rel="stylesheet">
<title>매일지식 컨텐츠</title>
</head>
<%@include file="../common/nav.jsp"%>
<body>
	<div class="container">
		<div class="content">
			<div id="tblDiv">
			<h1 id="main-title">🔍검색결과 목록🔍</h1>
			<form action="<%=request.getContextPath()%>/knowledge/searchResult" style="margin-left:16%">
				<!-- 검색창 -->
				<input type="text" placeholder="검색어 입력" name="keyword" id="keyword" >
                <button type="submit" id="search" class="btn me-md-2" >검색</button>
             </form>   
			</div>
			<table class="table">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성일자</th>
					<th>조회수</th>
					<th>작성자</th>
					<th>퀴즈풀러가기</th>
				</tr>
				<tbody class="listData">
						<c:choose>
								<c:when test="${fn:length(list) == 0}">
									<tr><td colspan="6"><br>검색된 내용이 없습니다.</td></tr>
								</c:when>
								
								<c:otherwise>
								<c:forEach items="${list }" var="list">
									<tr class="tableList">
										<td>${list.knowSeq}</td>
										<td><a href="<%=request.getContextPath()%>/knowledge/detail/${list.knowSeq}">${list.title}</a></td>
										<td>${list.insertDate }</td>
										<td>${list.viewcount }</td>
										<td>관리자</td>	
										<td><input type="button" id="quizBtn" value="퀴즈 풀러가기" class="btn me-md-2" style="background-color: #91ACCC;" onClick="location.href='<%=request.getContextPath()%>/quiz/${list.knowSeq}'"></td>
									</tr>
								</c:forEach>
								</c:otherwise>
								
						</c:choose>
				</tbody>
			</table>
			
		</div>
		</div>
	</div>
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
</script>
</body>
<%@include file="../common/footer.jsp"%>
</html>