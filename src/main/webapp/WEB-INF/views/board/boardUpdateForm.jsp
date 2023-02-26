<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../common/tag.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <link href="/css/header.css" rel="stylesheet">
    <link href="/css/footer.css" rel="stylesheet">
    <link href="/css/container.css" rel="stylesheet">
     <link href="/css/admin.css" rel="stylesheet">
<title> 커뮤니티 | 게시판 | 글쓰기 </title>
<style>
.tableList:hover {
	background-color: #91ACCC;
	color: white;
	cursor: pointer;
}
</style>
</head>
<body>

<div class="container">
<%@include file="../common/header.jsp" %>

<div class="container mt-5">
            <div class="row">
                <div class="col-lg-auto">
                    <!-- Post content-->
                  <form action="/board/form/${oneBoard.boardSeq }" method="post">
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
								<input type="hidden" name="categorySeq" value="3">
                        
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
                    
     <!-- <div class="form">
		<h3 id="main" > 게시판 </h3> <br>
		<button id= "black" onclick="location.href='/board/list'">목록</button>
     		<form action="form" method="post">
				<div class="mb-3">
				  <label for="title" class="form-label">제목</label>
				  <input type="text" class="form-control" id="title" name ="title" placeholder="제목">
				</div>
				<div class="mb-3">
				  <label for="content" class="form-label">내용</label>
				  <textarea class="form-control" id="content" rows="3" name="content"></textarea>
				</div>
				<input type="hidden" name="userSeq" value="5">
				<input type="hidden" name="categorySeq" value="5">
				<button type="submit" class="btn btn-primary" style="background-color: #91ACCC;">등록</button>
			</form> -->
	</div>
<%@include file="../common/footer.jsp" %>
</div>
</body>
<script type="text/javascript">
var text = document.getElementById("content").value;
text = text.replace(/(?:\r\n|\r|\n)/g, '<br>');
</script>
</html>