<%@ page language="java" contentType="text/html;charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@include file="../common/tag.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
<!-- 	<link href="/css/header.css" rel="stylesheet"> -->
<!-- 	<link href="/css/footer.css" rel="stylesheet"> -->
	<link href="/css/container.css" rel="stylesheet">
	<link href="/css/quiz.css" rel="stylesheet">
	<link href="/css/user/mypage.css" rel="stylesheet">
	<script src="/js/util/ajax.js"></script>

	<title>myPage</title>
	<style type="text/css">
		
	</style>
</head>
<body>
<div class="container">
	<%@include file="../common/nav.jsp"%>
	<div class="content">
		<div style="display: block; width:100%;">
<!--     	<h3>마이페이지</h3><br> -->
		<form action="<%=request.getContextPath()%>/mypage/info/${userDto.userSeq}" method="post" id="myForm">
			<br>
			<h1>${userDto.nickname}님!📝</h1>
			<p>오늘의 지식과 퀴즈를 확인해보셨나요?</p><br><br>
			<div id="userRecord"></div>
			<b>유저정보</b>
			<div class="myDiv">
				<label>닉네임</label>
				<div style="display: inline;"> ${userDto.nickname}</div>
			</div>
			<div class="myDiv">
				<label>이메일</label>
				<div style="display: inline;"> ${userDto.email}</div>
			</div>
			<div class="myDiv">
				<label>연락처</label>
				<div style="display: inline;"> ${userDto.phone}</div>
			</div>
			<div class="myDiv">
				<label>카테고리</label>
				<div style="display: inline;" id="category"> ${categoryDto.main} > ${categoryDto.middle} > ${categoryDto.sub}</div>
			</div>
			<div class="myDiv">
				<label>가입일자</label>
				<div style="display: inline;"> ${userDto.insertDate}</div>
			</div>
			<div class="infoP1">
				<p id="deleteInfo" onclick="goDelete()">회원탈퇴</p>
			</div>
			<div class="infoP2">
				<p id="updateInfo" onclick="goUpdate()">회원정보수정</p>
			</div>
			<div id="myBtnDiv">
				<br>
				<input type="button" value="오답노트" class="myBtn"  onclick="window.location.href='/mypage/wrong/${sessionScope.user_seq}'">
				<input type="button" value="나의 약점 보러가기" class="myBtn"  onclick="window.location.href='/mypage/weak/${sessionScope.user_seq}'">
			</div>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
	function goUpdate(){
		document.getElementById('myForm').submit();
	}

	function goDelete(e){
		let con = confirm('탈퇴시 회원님의 모든 정보가 삭제됩니다.\n정말 IT-Yogurt를 떠나시겠어요...?');
		if(con == true){
			alert('탈퇴되었습니다. 나중에 또 공부하러 오세요!');
			location.href="${pageContext.request.contextPath}/mypage/cancel/${sessionScope.user_seq}";
		}else{
			e.preventDefault();

		}
	}

	window.ajax.request('/mypage/record',{},(result)=>{
		$("#userRecord").html(`\${result.learnDay +1}일 동안 연속으로 출석 중입니다. <br> 지금까지 총 \${result.learnQuizCount}문제를 푸셨습니다.`)
	})

</script>
</body>
<%@include file="../common/footer.jsp"%>
</html>