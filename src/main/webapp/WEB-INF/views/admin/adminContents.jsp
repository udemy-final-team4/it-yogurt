<%-- <%@ include file="../common/tag.jsp"%> --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    
    <!-- <link href="/css/user/signup.css" rel="stylesheet"> -->
   <!--  <script src="/js/user/signup.js"></script> -->
    <script src="/js/util/ajax.js"></script>
    <!-- <script src="/js/util/util.js"></script> -->
    <!-- <link href="/css/styles.css" rel="stylesheet" /> -->
    <link href="/css/container.css" rel="stylesheet">
 	<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
<title>관리자 | 문제 관리</title>
</head>
<style>
	
</style>
<%@include file="../common/nav.jsp" %>
<body>

<div class="container-md">

<%--<div class="contents">--%>
	<div class="content">
	
<!-- 관리자 페이지 이동 버튼  -->
<div class="form text-center" id="content-form">
	<button class="btn btn-primary px-5 py-2" onclick="location.href='/admin/user'"> 회원관리 </button>
	<button class="btn btn-primary px-5 py-2" onclick="location.href='/admin/contents'">컨텐츠 등록</button>
	
<br><br><br>
</div>
<%--	<h3 class="text-center">컨텐츠 등록</h3>--%>
		<h1 id="main-title">📝 컨텐츠 등록 📝</h1>
<form class="form" id="form" style="margin-top: 50px;">
	<label for="main"><h4>카테고리</h4></label><br>
            
 
	<div class="row" >
		<div class="col-xl col-md">
			<div class="flex-fill card">
				<div class=" py-4 card-body">
					<div class="d-flex align-items-start">
						<div class="flex-grow-1">
            
	         				<label for="main">대분류</label>
            				<br>
            				<input type="text" name="main" id="mainInput" value="it" class="form-control"><br>
              				<label for="middle">중분류</label> 
            				<br>
            				<input type="text" name="middle" id="middleInput" value="프로그래밍언어" class="form-control"><br>
              				<label for="sub">소분류</label>
            				<br>
            				<input type="text" name="sub" id="subInput" class="form-control"><br>
              				<label for="detail">상세분류</label>
              				<br>
            				<input type="text" name="detail" id="detailInput" class="form-control"><br>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
		
		<!-- 입력없이 값 전달 -->
	<input type="hidden" name ="categorySeq" value="${categorySeq }" >
	<input type="hidden" name ="userSeq" value="${sessionScope.user_seq }" >
	<br>
	
	<!-- 컨텐츠 등록 (정보글)  -->
	<div>
		<h3>정보글 등록 </h3>
	</div>
	
	<div class="row">
		<div class="col-xl col-md">
			<div class="flex-fill card">
				<div class=" py-4 card-body">
					<div class="d-flex align-items-start">
						<div class="flex-grow-1">
							<label for="title">제목</label><br>
							<input type="text" id="title" name="title" class="form-control">
							<br>
							<p>내용 등록 </p>
							<textarea rows="8" cols="50" id="content" name="content" class="form-control"></textarea>
		
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<br>
	<!-- 컨텐츠 등록( 퀴즈 3개)  -->
	<div>
		<h3>퀴즈 등록</h3>
	</div>
	
	<c:forEach var = "cnt"  begin="1" end="3">
		<div class="row">
			<div class="col-xl col-md">
				<div class="flex-fill card">
					<div class=" py-4 card-body">
						<div class="d-flex align-items-start">
							<div class="flex-grow-1">
								<div class="d-inline-block ms-3">
									<i class="fa-solid fa-q"></i> <span></span><i class="fa-sharp fa-solid fa-${cnt }"></i>
								</div><br><br>
								<label for="title">제목</label><br>
								<input type="text" id="question" name="question" class="form-control">
								<br>
								<div class="mb-0">
									<label for="choice">보기 문항</label>
									<p>
									1. <input type="text" id="choice1" name="choice1" class="form-control" ><br>
									2. <input type="text" id="choice2" name="choice2" class="form-control"><br>
									3. <input type="text" id="choice3" name="choice3" class="form-control"><br>
									4. <input type="text" id="choice4" name="choice4" class="form-control"><br>
									</p>
								</div>
								<div class="mb-0">
									<label for="answer">정답</label>
									<input type="number" min="1" max="4" id="answer" name="answer" class="form-control"><br>
									<label for="commentary">해설</label>
									<textarea rows="3" cols="50" id="commentary" name="commentary" class="form-control"></textarea>
								</div>
								<input type="hidden" id="knowSeq" name="knowSeq" value=${knowSeq } >
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>	
<!-- form(전체 컨텐츠) submit 버튼  -->			
	<div class="mb-3 text-center" style="margin-top:30px;"> 
	<button id="submitBtn" type="submit" class="btn btn-primary px-5 py-2">	등록 </button>
	</div>
</form>
	
</div>
</div>






<%@include file="../common/footer.jsp" %>
</body>


<script>

// 컨텐츠 등록 버튼 클릭시
$("#submitBtn").on("click", function(){
	

let formData = $('form').serializeArray();
$.ajax({
    url: '/admin/contents',
    enctype: 'multipart/form-data',
    type: 'POST',
    dataType:'text',
    contentType: 'application/json; charset=utf-8',
    data: JSON.stringify(formData),
    success: function(response) {
    	alert("등록되었습니다.");
    	window.location.href='/admin/page';
        // 성공적으로 처리된 경우 실행될 코드
    },
    error: function(error) {
    	alert("에러");
        // 오류 발생 시 실행될 코드
    }
});
	
})



</script>
</html>