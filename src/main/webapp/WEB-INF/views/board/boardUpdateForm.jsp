<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../common/tag.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <!-- <link href="/css/header.css" rel="stylesheet">
    <link href="/css/footer.css" rel="stylesheet"> -->
    <link href="/css/container.css" rel="stylesheet">
     <link href="/css/admin.css" rel="stylesheet">
     <script src="/js/user/signup.js"></script>
    <script src="/js/util/ajax.js"></script>
    <script src="/js/util/util.js"></script>
<title> 커뮤니티 | 게시판 | 글쓰기 </title>
<style>
.tableList:hover {
	background-color: #91ACCC;
	color: white;
	cursor: pointer;
}
</style>
</head>
<%@include file="../common/nav.jsp" %>
<body id="page-top" style="background-color: #F9F2ED;">
<header></header>
<div class="container divCss">

<div class="container-lg">
                <div class="col-lg-auto">
                
                
                    <!-- Post content-->
                  <form action="/board/form/${oneBoard.boardSeq }" method="post">
	                <label for="main">카테고리</label>
	                	<select name="main" id="main">
	
	                	</select>
	                	<select name="middle" id="middle">
	
	                	</select>
	                	<select name="sub" id="sub">
	
	                	</select>
                    <article>
                        <!-- Post header-->
                        <header class="mb-4">
                            <!-- Post title-->
                            <p>제목</p>
                            <h1 class="fw-bolder mb-1"><input type="text" class="fw-bolder mb-1" name="title" value="${oneBoard.title }"></h1>
                            <!-- Post meta content-->
                            <div class="text-muted fst-italic mb-2"> <table> <tr><td> 작성자  </td><td> | ${oneBoard.nickname }</td></tr></table> </div>
                        </header>
                       
                        <section class="mb-5">
                            <p class="fs-5 mb-4"> 내용</p>
                            
                           <textarea  class="form-control" id="content" name="content" rows=10 ><c:out value="${oneBoard.content }"/></textarea>
                      			
                      			<input type="hidden" name="userSeq" value="2">
								<!-- <input type="hidden" name="categorySeq" value="3"> -->
                        
                        </section>
                    </article>
                    	<button type="submit" class="btn me-md-2" style="background-color: #91ACCC;">수정</button>
                   </form>
                    <section class="mb-2">
                    <div class="d-md-flex justify-content-md-end" >
  						<button class="btn me-md-2" style="background-color: #91ACCC;" type="button" onclick="location.href='/board/list'">목록</button>
					</div>
                    </section>
                    </div>
                    </div>
                    
    
	</div>
<%@include file="../common/footer.jsp" %>

</body>
<script type="text/javascript">
var text = document.getElementById("content").value;
text = text.replace(/(?:\r\n|\r|\n)/g, '<br>');
</script>
</html>