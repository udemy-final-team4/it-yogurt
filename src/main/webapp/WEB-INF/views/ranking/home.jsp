<%--
  Created by IntelliJ IDEA.
  User: 김민지
  Date: 2023-02-23
  Time: 오후 1:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../common/tag.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>랭킹 조회</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link href="/css/container.css" rel="stylesheet">
</head>
<style>
    .a-quiz {
        text-decoration: none;
        color: black;
    }

    h1 {
        text-align: center;
    }
</style>
<%@include file="../common/nav.jsp" %>
<body>
<div class="container">
    <div class="content">
        <div class="row">
            <div class="col" style="float: none; margin:0 auto;">
                <div class="tableBox" id="box-table1">
                    <h1>🚀 RANKING 🚀</h1>
                    <br>
                    <h3>가장 많이 푼 퀴즈는?</h3>
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col" style="width: 10%">#</th>
                                <th scope="col" style="width: 20%">카테고리</th>
                                <th scope="col" style="width: 70%">퀴즈명</th>
                            </tr>
                        </thead>
                        <tbody class="table-group-divider">
                            <c:forEach items="${solvedQuizList}" var="list" varStatus="status">
                            <tr>
                                <th scope="row">${list.rank}</th>
                                <td>${list.sub}</td>
                                <td><a id=${list.quizSeq} href="/quiz/top/${list.quizSeq}?type=1&top=${status.count}" class="a-quiz">${list.question}</a></td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col" style="float: none; margin:0 auto;">
                <div class="tableBox mb-5" id="box-table2">
                    <br><br>
                    <h3>가장 많이 틀린 퀴즈는?</h3>
                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col" style="width: 10%">#</th>
                            <th scope="col" style="width: 20%">카테고리</th>
                            <th scope="col" style="width: 70%">퀴즈명</th>
                        </tr>
                        </thead>
                        <tbody class="table-group-divider">
                        <c:forEach items="${wrongQuizList}" var="list" varStatus="status">
                        <tr>
                            <th scope="row">${list.rank}</th>
                            <td>${list.sub}</td>
                            <td><a id=${list.quizSeq} href="/quiz/top/${list.quizSeq}?type=2&top=${status.count}" class="a-quiz">${list.question}</a></td>
                        </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<%@include file="../common/footer.jsp" %>
</html>
