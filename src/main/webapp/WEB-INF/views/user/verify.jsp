<%--<%@ include file="common/tag.jsp" %>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <link href="/css/header.css" rel="stylesheet">
    <link href="/css/footer.css" rel="stylesheet">
    <link href="/css/container.css" rel="stylesheet">
    <link href="/css/user/login.css" rel="stylesheet">
    <script src="/js/jquery-3.6.1.min.js"></script>
    <title>Title</title>
</head>
<style>
    content {
        margin-top: 20%;
    }
</style>
<%@include file="../common/nav.jsp" %>
<body>
<div class="container">
    <div class="content">
        <img id="logo" src="/image/logo-dark-text.png" alt="logo">
        <div id="message">${result}</div>
        <br>
        <div class="button">
            <div id="main" onclick="window.location.href='/'">메인 화면으로 돌아가기</div>
        </div>
    </div>
</div>
</body>
<%@include file="../common/footer.jsp" %>
</html>
<style>
    #logo {
        width: 50%;
    }

    #message {
        font-size: 30px;
        margin-bottom: 20px;
        width: 70%;
        align-items: center;
        text-align: center;
        word-break: keep-all;
    }

    #main {
        width: 250px;
        height: 40px;
        border-style: solid;
        border-width: medium;
        /*margin-bottom: 35px;*/
        margin-bottom: 50px;
        border-color: #fab46e;
        background-color: #fab46e;
        font-size: 15px;
        color: #ffffff;
        text-align: center;
        line-height: 40px;
    }

    #main:focus {
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