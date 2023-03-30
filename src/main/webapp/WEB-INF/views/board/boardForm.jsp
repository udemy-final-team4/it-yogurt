<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../common/tag.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <script src="/js/jquery-3.6.1.min.js"></script>
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/js/user/signup.js"></script>
    <script src="/js/util/ajax.js"></script>
    <script src="/js/util/util.js"></script>	
    <link href="/css/styles.css" rel="stylesheet" />
    <script src="/js/board/board.js"></script>
<title> 커뮤니티 | 게시판 | 글쓰기 </title>
<style>

</style>
</head>
<%@include file="../common/nav.jsp" %>
<body id="page-top" style="background-color: #F9F2ED;">



<div class="container divCss">
            <div class="container-lg">
                <div class="row gx-5 align-items-center">
                    <!-- Post content-->
                    <article>
                        <header class="masthead bg-self text-center" style="background-color: #F9F2ED;" >
    							<h2>✏ 게시글 작성 ✏</h2>
						</header>
                            <form action="form" method="post" >
    						
    						<div class="mb-4">
    						
	                            <!-- Post categories-->
    							<label for="main">카테고리</label>
                					<select name="main" id="main">

                					</select>
                					<select name="middle" id="middle">

               						</select>
                					<select name="sub" id="sub">

                					</select>
    							
    							
	                            <!-- Post title-->
	                            <p>제목</p>
	                            <h4 class="fw-bolder mb-1"><input type="text" class="fw-bolder mb-1 form-control"  name="title"></h4>
	                            <!-- Post meta content-->
	                            <div class="text-muted fst-italic mb-2"> <table> <tr><td> 작성자  </td><td> | ${sessionUserInfo.nickname }</td></tr></table> </div>
	                     		
    						</div>
                       
                        <section>
                            <p class="fs-5 mb-4"> 내용</p>
                            
                           <textarea  class="form-control" id="content" name="content" rows=10></textarea>
                      			
                      			<input type="hidden" name="userSeq" value=${sessionScope.user_seq }>
								<!-- <input type="hidden" name="categorySeq" value="18"> -->
                        
                        </section>
                    	<button type="submit" class="btn me-md-2" style="background-color: #91ACCC; margin-top:1%">등록</button>
                        </form>
                    </article>
                    <section class="mb-2">
                    <div class="d-md-flex justify-content-md-end" >
  						<button class="btn me-md-2" style="background-color: #91ACCC;" type="button" onclick="location.href='/board/list'">목록</button>
					</div>
                    </section>
                    </div>
                    </div>
                    
	</div>

</body>

<%@include file="../common/footer.jsp" %>
</html>