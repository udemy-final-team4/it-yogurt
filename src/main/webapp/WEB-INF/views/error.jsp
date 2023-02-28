
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="/css/error.css" rel="stylesheet">
    <title>error</title>
</head>
<body id="page-top">
<%@include file="common/nav.jsp"%>
<header class="masthead bg-self text-white text-center" style="background-color: #F9F2ED">
    <div class="container d-flex align-items-center flex-column">
        <!-- Masthead Avatar Image-->
        <img class="masthead-avatar mb-5" src="/image/logo-dark-text.png" alt="logo"/>
        <!-- Masthead Heading-->
        <h2 style="color: #2c3e50" class="pb-2">요청하신 페이지를 찾을 수 없습니다.</h2>
        <h4 style="color: #2c3e50" class="pb-2">해당 메시지가 지속되면 관리자에게 문의해주세요</h4>
        <button type="button" class="button btn-login mt-5 mb-5" id="btn-login"
                onclick="window.location.href='/'">메인화면으로 돌아가기
        </button>
    </div>
</header>
</body>
<%@include file="common/footer.jsp" %>
</html>
