<%--<%@ include file="common/tag.jsp" %>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="UTF-8">
    <link href="/css/header.css" rel="stylesheet">
    <link href="/css/footer.css" rel="stylesheet">
    <link href="/css/container.css" rel="stylesheet">
    <link href="/css/user/login.css" rel="stylesheet">
    <script src="/js/jquery-3.6.1.min.js"></script>
    <script src="/js/util/ajax.js"></script>
    <script src="/js/util/util.js"></script>
    <title>Title</title>
</head>
<body>
<div class="container">
    <%@include file="common/header.jsp" %>
    <div class="content">
        <img id="logo" src="/image/logo.png">
        <div class="button">
        <c:choose>
			<c:when test="${ not empty sessionScope.user_seq}">
	            <div id="logout" onclick="window.location.href='/user/o'">로그아웃</div>
			</c:when>
			<c:otherwise>
	            <div id="login" onclick="window.location.href='/user'">로그인</div>
			</c:otherwise>
		</c:choose>
        </div>
    </div>
    <%@include file="common/footer.jsp" %>
</div>
</body>
<script>
$("#logout").on("click", function (event) {
    event.preventDefault();
	alert("로그아웃되었습니다.");
    location.replace('redirect:/');
})
</script>
</html>
<style>
  .content {
    height: 500px;
  }

  #logo {
    width: 50%;
  }

  #login {
    width: 250px;
    height: 40px;
    border-style: solid;
    border-width: medium;
    /*margin-bottom: 35px;*/
    margin-bottom: 0px;
    border-color: #fab46e;
    background-color: #fab46e;
    font-size: 15px;
    color: #ffffff;
    text-align: center;
    line-height: 40px;
  }
  #logout {
    width: 250px;
    height: 40px;
    border-style: solid;
    border-width: medium;
    /*margin-bottom: 35px;*/
    margin-bottom: 0px;
    border-color: #fab46e;
    background-color: #fab46e;
    font-size: 15px;
    color: #ffffff;
    text-align: center;
    line-height: 40px;
  }

  #login:focus {
    outline-style: solid;
    outline-color: #fcae60;
    margin: 0px;
    text-align: center;
    line-height: 40px;
  }
  .button {
    width: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
  }
</style>